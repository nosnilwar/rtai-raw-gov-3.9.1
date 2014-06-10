#include <stdio.h>
#include <string.h>
#include <libxml/encoding.h>
#include <libxml/xmlwriter.h>

#include "../graph/graph_structs.h"
#include "../graph/graph.h"
#include "graphml_writer.h"
#include "handle_files.h"
#include "graphml_wcec.h"

int yed_output;

void write_ep_in_graphml(struct entrypoint *ep, xmlTextWriterPtr writer);
void init_nodes (char* fname, struct entrypoint *ep, struct cycles*);
void compute_graph_wcec (char* fname, struct entrypoint_list *graph,
													xmlTextWriterPtr writer);
void make_graphml (char* fname, struct entrypoint_list *graph);


void write_ep_in_graphml(struct entrypoint *ep, xmlTextWriterPtr writer) {

	struct basic_block_list *bbl, *children;
	struct basic_block *bb, *child;
	char tmp[10];
	int rwcec = 0, edge_id = 0, rc, stat;

	/* write nodes */
	FOR_EACH_BB (bbl, ep->bbs)
		write_node(writer, ep, bbl->bb);

	/* write edges */
	FOR_EACH_BB (bbl, ep->bbs) {
		bb = bbl->bb;
		for (children = bb->children; children != NULL;
												children = children->next_bb) {
			child = children->bb;
			stat = child->status;
			rwcec = child->rwcec; // child->wcec + rest->rwcec

			// if the bb points to a loop condition node and it's not a pseudo
			if (bb->status != STMT_PSEUDO &&
				(stat == STMT_FOR ||stat == STMT_WHILE ||stat == STMT_DO_WHILE))
				rwcec = child->wcec;

			snprintf(tmp, sizeof(tmp), "g%de%d", ep->id, edge_id++);
			rc = write_edge(writer, tmp, ep, bb, child, rwcec);
		}
	}

}

void init_nodes (char *fname, struct entrypoint *ep, struct cycles *cycles) {

	struct basic_block_list *bbl;
	struct basic_block *bb;
	int id = 0, i, line, flag;

	FOR_EACH_BB (bbl, ep->bbs) {
		bb = bbl->bb;
		bb->id = id++;
		bb->wcec = bb->rwcec = bb->max_rwcec = 0;
		bb->color = 0;

		/* NODE WCEC */
		bb->wcec = compute_bb_wcec(bb, cycles);

		//fprintf(stderr, "aqui linha %d wcec %d\n", bb->start_line, bb->wcec);

		/* loop variables */
		bb->isloop = 0;
		bb->iteration_num = bb->loop_wcec = bb->loop_parent = 0;
		bb->loop_last_node = bb->loop_then = NULL;
		if (bb->status == STMT_WHILE || bb->status == STMT_DO_WHILE ||
														bb->status == STMT_FOR){
			bb->isloop = 1;
			bb->iteration_num = loop_iteration_num(fname, bb);
		}

	}
}

void compute_graph_wcec (char *fname, struct entrypoint_list *graph,
													xmlTextWriterPtr writer) {
	struct entrypoint *ep;
	struct cycles *cycles;

	// get the struct of the file with wcec and instructions information
	cycles = readInstrFile(fname);

	// each entrypoint is a function in the input file
	FOR_EACH_ENTRY (ep, graph->ep) {
		init_nodes(fname, ep, cycles);
		compute_ep_wcec(ep);
		write_ep_in_graphml(ep, writer);
	}

}

void make_graphml (char *fname, struct entrypoint_list *graph) {

	xmlTextWriterPtr writer;
	int rc;

	yed_output = 1;
	writer = start_xml_document();
	start_yed_graph(writer, 0, 0);

	compute_graph_wcec(fname, graph, writer);

	/* close now yEd big graph entry */
	if (yed_output) {
		/* Close the element named graph. */
		rc = xmlTextWriterEndElement(writer);
		if (rc < 0)
			fprintf(stderr, "Error finishing element graph\n");
	}

	rc = end_xml_document(writer);
}

