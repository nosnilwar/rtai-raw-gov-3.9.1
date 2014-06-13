/*
 * This file has the functions that generate graphml.
 */

#include <stdio.h>
#include <libxml/encoding.h>
#include <libxml/xmlwriter.h>
#include "graphml_struct.h"

#ifndef ARRAY_SIZE
#define ARRAY_SIZE(x) ( sizeof(x) / sizeof((x)[0]) )
#endif

extern int yed_output;

xmlTextWriterPtr start_xml_document(void);
int start_yed_graph(xmlTextWriterPtr writer, int nodes, int edges);
int end_xml_document(xmlTextWriterPtr writer);

static int write_keys_header(xmlTextWriterPtr writer);
static int write_key_entry(xmlTextWriterPtr writer, const struct keys*,	int);

int write_node(xmlTextWriterPtr, struct entrypoint*, struct basic_block*);
int write_edge(xmlTextWriterPtr, char *id, struct entrypoint *ep,
													struct basic_block *source,
													struct basic_block *dest,
													int rwcec);

static int write_data_list(xmlTextWriterPtr writer, struct entrypoint *ep,
							struct basic_block *bb, const char *for_element);
static int write_data_entry(xmlTextWriterPtr writer, struct entrypoint *ep,
							struct basic_block *bb, const struct keys *key);

/*
 * Start an indented xml document to represent the CFG
 * of C code files. The output format is graphml.
 */
xmlTextWriterPtr start_xml_document(void) {

	xmlTextWriterPtr writer;
	int rc;

	writer = xmlNewTextWriterFilename("-", 0);
	if (writer == NULL) {
		fprintf(stderr, "Error creating the xml writer\n");
		goto exit;
	}

	rc = xmlTextWriterStartDocument(writer, NULL, "UTF-8", NULL);
	if (rc < 0) {
		fprintf(stderr, "Error at xmlTextWriterStartDocument %d\n", rc);
		goto free_writer;
	}

	rc = xmlTextWriterSetIndent(writer, 1);
	if (rc < 0) {
		fprintf(stderr, "Error setting identation\n");
		goto end_document;
	}

	/*
	 * Start an element named "graphml". That will be
	 * the root element of the document.
	 */
	rc = xmlTextWriterStartElement(writer, BAD_CAST "graphml");
	if (rc < 0) {
		fprintf(stderr, "Error creating document root %d\n", rc);
		goto end_document;
	}

	rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns",
			BAD_CAST "http://graphml.graphdrawing.org/xmlns");
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto end_document;
	}

	rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:xsi",
			BAD_CAST "http://www.w3.org/2001/XMLSchema-instance");
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto end_document;
	}

	if (yed_output) {
		rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "xmlns:y",
				BAD_CAST "http://www.yworks.com/xml/graphml");
		if (rc < 0) {
			fprintf(stderr, "Error creating attributes %d\n", rc);
			goto end_document;
		}
	}

	if (yed_output)
		rc = xmlTextWriterWriteAttribute(writer,
		BAD_CAST "xsi:schemaLocation",
		BAD_CAST "http://graphml.graphdrawing.org/xmlns "
		"http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd"
		" http://www.yworks.com/xml/schema/graphml/1.0/ygraphml.xsd");
	else
		rc = xmlTextWriterWriteAttribute(writer,
		BAD_CAST "xsi:schemaLocation",
		BAD_CAST "http://graphml.graphdrawing.org/xmlns "
		"http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd");

	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto end_document;
	}

	rc = write_keys_header(writer);

	goto exit;

end_document:
	xmlTextWriterEndDocument(writer);
free_writer:
	xmlFreeTextWriter(writer);
	writer = NULL;
exit:
	return writer;
}

int start_yed_graph(xmlTextWriterPtr writer, int nodes, int edges) {

	int rc;

	rc = xmlTextWriterStartElement(writer, BAD_CAST "graph");
	if (rc < 0) {
		fprintf(stderr, "Error creating graph root %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "edgedefault",
			BAD_CAST "directed");
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteFormatAttribute(writer, BAD_CAST "id", "G");
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteFormatAttribute(writer,
			BAD_CAST "parse.nodes", "%d", nodes);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteFormatAttribute(writer,
			BAD_CAST "parse.edges", "%d", edges);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteFormatAttribute(writer,
			BAD_CAST "parse.order",
			"%s" , "free");
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}
exit:
	return rc;
}

/*
 * Close xml document.
 */
int end_xml_document(xmlTextWriterPtr writer) {

	int rc = 0;

	/* Close the element named graphml. */
	rc = xmlTextWriterEndElement(writer);
	if (rc < 0) {
		fprintf(stderr, "Error finishing element graphml\n");
		goto exit;
	}

	rc = xmlTextWriterEndDocument(writer);
	if (rc < 0) {
		fprintf(stderr, "Error at xmlTextWriterEndDocument\n");
		goto exit;
	}

	xmlFreeTextWriter(writer);

exit:
	return rc;
}

/* Simply write the list of additional keys */
static int write_keys_header(xmlTextWriterPtr writer) {

	int i;
	int rc = 0;

	for (i = 0; i < ARRAY_SIZE(key_list); i++) {
		rc = write_key_entry(writer, &key_list[i], 0);
		if (rc < 0)
			goto exit;
	}


	if (yed_output) {
		for (i = 0; i < ARRAY_SIZE(yed_key_list); i++) {
			rc = write_key_entry(writer, &yed_key_list[i], 1);
			if (rc < 0)
				goto exit;
		}
	}

exit:
	return rc;
}

/* write_key_entry outputs our keys in graphml format */
static int write_key_entry(xmlTextWriterPtr writer, const struct keys *key,
																	int yed) {

	int rc;

	rc = xmlTextWriterStartElement(writer, BAD_CAST "key");
	if (rc < 0) {
		fprintf(stderr, "Error creating key tag %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "id",
					BAD_CAST key->id);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	if (!yed) {
		rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "attr.name",
						BAD_CAST key->name);
		if (rc < 0) {
			fprintf(stderr, "Error creating attributes %d\n", rc);
			goto exit;
		}

		rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "attr.type",
						BAD_CAST key->type);
	} else {
		rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "yfiles.type",
						BAD_CAST key->type);
	}

	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "for",
				BAD_CAST key->for_element);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	if (!yed) {
		rc = xmlTextWriterWriteElement(writer, BAD_CAST "default",
					BAD_CAST key->default_value);
		if (rc < 0) {
			fprintf(stderr, "Error while creating default "
					"values %d.\n", rc);
			goto exit;
		}
	}

	/* Close the element named node. */
	rc = xmlTextWriterEndElement(writer);
	if (rc < 0) {
		fprintf(stderr, "Error finishing element graph\n");
		goto exit;
	}

exit:
	return rc;
}

/*
 * Write info about a node. It will use the struct basic_block pointer
 * as node id value.
 */
int write_node(xmlTextWriterPtr writer, struct entrypoint *ep,
													struct basic_block *bb) {

	int rc;

	rc = xmlTextWriterStartElement(writer, BAD_CAST "node");
	if (rc < 0) {
		fprintf(stderr, "Error creating node tag %d\n", rc);
		goto exit;
	}
	rc = xmlTextWriterWriteFormatAttribute(writer, BAD_CAST "id",
			"g%dn%d", ep->id, bb->id);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	rc = write_data_list(writer, ep, bb, "node");
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	/* Close the element named node. */
	rc = xmlTextWriterEndElement(writer);
	if (rc < 0) {
		fprintf(stderr, "Error finishing element graph\n");
		goto exit;
	}

exit:
	return rc;
}

/*
 * Write info about an edge. It will use the struct basic_block pointer
 * as source node id value. The target is simple a string passed as
 * parameter. This way, one can use it to add a string of external references.
 */
int write_edge(xmlTextWriterPtr writer, char *id, struct entrypoint *ep,
													struct basic_block *source,
													struct basic_block *dest,
													int rwcec) {

	int rc, aux;

	rc = xmlTextWriterStartElement(writer, BAD_CAST "edge");
	if (rc < 0) {
		fprintf(stderr, "Error creating edge tag %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "id",
		BAD_CAST id);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteFormatAttribute(writer, BAD_CAST "source",
			"g%dn%d", ep->id, source->id);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteFormatAttribute(writer,
					BAD_CAST "target",
			"g%dn%d", ep->id, dest->id);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}
	/*start data elemtent*/
	rc = xmlTextWriterStartElement(writer, BAD_CAST "data");
	if (rc < 0) {
		fprintf(stderr, "Error creating data tag %d\n", rc);
		goto exit;
	}
	/*write key atribute for edges*/
	rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "key",
				BAD_CAST "k3");
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}
	/*write rwcec integer value for edges*/
	rc = xmlTextWriterWriteFormatRaw(writer, "%d",rwcec);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}
	/* Close the element named data. */
	rc = xmlTextWriterEndElement(writer);
	if (rc < 0) {
		fprintf(stderr, "Error finishing element data\n");
		goto exit;
	}

	/* write data for graphic view in yed */
	if (yed_output) {
		aux = dest->max_rwcec;
		dest->max_rwcec = rwcec;
		rc = write_data_entry(writer, ep, dest, &yed_key_list[1]);
		dest->max_rwcec = aux;
		if (rc < 0) {
			fprintf(stderr, "Error finishing element data\n");
			goto exit;
		}
	}
	/* Close the element named edge. */
	rc = xmlTextWriterEndElement(writer);
	if (rc < 0) {
		fprintf(stderr, "Error finishing element graph\n");
		goto exit;
	}

exit:
	return rc;
}

/*
 * Write a list of data values to this basic block. Will
 * call only datas if the key is for element in for_element
 */
static int write_data_list(xmlTextWriterPtr writer, struct entrypoint *ep,
							struct basic_block *bb, const char *for_element) {

	int i, rc = 0;

	for (i = 0; i < ARRAY_SIZE(key_list); i++) {
		/* skip whay is not for node */
		if (strcmp(key_list[i].for_element, for_element))
			continue;

		rc = write_data_entry(writer, ep, bb, &key_list[i]);
		if (rc < 0)
			goto exit;
	}

	if (yed_output) {
		for (i = 0; i < ARRAY_SIZE(yed_key_list); i++) {
			/* skip whay is not for node */
			if (strcmp(yed_key_list[i].for_element, for_element))
				continue;

			rc = write_data_entry(writer, ep, bb, &yed_key_list[i]);
			if (rc < 0)
				goto exit;
		}
	}

exit:
	return rc;
}

static int write_data_entry(xmlTextWriterPtr writer, struct entrypoint *ep,
							struct basic_block *bb, const struct keys *key) {

	int rc = 0;
	const char *value;

	rc = xmlTextWriterStartElement(writer, BAD_CAST "data");
	if (rc < 0) {
		fprintf(stderr, "Error creating data tag %d\n", rc);
		goto exit;
	}

	rc = xmlTextWriterWriteAttribute(writer, BAD_CAST "key",
				BAD_CAST key->id);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	if (key->get_data)
		value = key->get_data(ep, bb);
	else
		value = key->default_value;
	rc = xmlTextWriterWriteRaw(writer, BAD_CAST value);
	if (rc < 0) {
		fprintf(stderr, "Error creating attributes %d\n", rc);
		goto exit;
	}

	/* Close the element named data. */
	rc = xmlTextWriterEndElement(writer);
	if (rc < 0) {
		fprintf(stderr, "Error finishing element data\n");
		goto exit;
	}

exit:
	return rc;
}
