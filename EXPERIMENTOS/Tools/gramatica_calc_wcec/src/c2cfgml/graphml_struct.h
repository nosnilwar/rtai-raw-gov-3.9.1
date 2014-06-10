/*
 * This file has the structs definition to make the graphml.
 */

#include <stdio.h>
#include "../graph/graph_structs.h"

static const char *get_bb_status(struct entrypoint*, struct basic_block*);
static const char *get_function_name(struct entrypoint*, struct basic_block*);
static const char *get_call_func_name(struct entrypoint*, struct basic_block*);

static const char *get_start_line(struct entrypoint*, struct basic_block*);
static const char *get_last_line(struct entrypoint*, struct basic_block*);
static const char *get_loop_iteration(struct entrypoint*, struct basic_block*);

static const char *get_loop_wcec(struct entrypoint*, struct basic_block*);
static const char *get_wcec(struct entrypoint*, struct basic_block*);

/* the functions below are for the visual part of graphml  */
static const char *get_nodegr(struct entrypoint*, struct basic_block*);
static const char *get_edgegr(struct entrypoint*, struct basic_block*);

/*
 * this is the children struct of nodes and edges, in other words,
 * the atrributes
 */
struct keys {
	const char *id;
	const char *name;
	const char *type;
	const char *for_element; /* this element could be a node or edge */
	const char *default_value;
	const char *(*get_data)(struct entrypoint *, struct basic_block *);
};

static const struct keys key_list[] = {
	{
		.id = "k0",
		.name = "type",
		.type = "string",
		.for_element = "node",
		.default_value = "normal",
		.get_data = get_bb_status,
	},
	{
		.id = "k1",
		.name = "start_line",
		.type = "int",
		.for_element = "node",
		.default_value = "-1",
		.get_data = get_start_line,
	},
	{
		.id = "k2",
		.name = "last_line",
		.type = "int",
		.for_element = "node",
		.default_value = "-1",
		.get_data = get_last_line,
	},
	{
		.id = "k3",
		.name = "inside",
		.type = "string",
		.for_element = "node",
		.default_value = "main",
		.get_data = get_function_name,
	},
	{
		.id = "k4",
		.name = "call",
		.type = "string",
		.for_element = "node",
		.default_value = "no",
		.get_data = get_call_func_name,
	},
	{
		.id = "k5",
		.name = "wcec",
		.type = "int",
		.for_element = "node",
		.default_value = "0",
		.get_data = get_wcec,
	},
	{
		.id = "k6",
		.name = "iterations",
		.type = "int",
		.for_element = "node",
		.default_value = "0",
		.get_data = get_loop_iteration,
	},
	{
		.id = "k7",
		.name = "loop_wcec",
		.type = "int",
		.for_element = "node",
		.default_value = "0",
		.get_data = get_loop_wcec,
	},
	{	/* attribute for edges */
		.id = "k8",
		.name = "rwcec",
		.type = "int",
		.for_element = "edge",
		.default_value = "0",
	},
};

/* struct for visual details in graphml */
static const struct keys yed_key_list[] = {
	{
		.id = "d1",
		.type = "nodegraphics",
		.for_element = "node",
		.get_data = get_nodegr,
	},
	{
		.id = "d3",
		.type = "edgegraphics",
		.for_element = "edge",
		.get_data = get_edgegr,
	},
};

static const char *get_bb_status(struct entrypoint *ep, struct basic_block *bb){

	static char status[9];

	if (bb->status == STMT_CALL)
		snprintf(status, sizeof(status), "call");
	else if (bb->status == STMT_WHILE)
		snprintf(status, sizeof(status), "while");
	else if (bb->status == STMT_FOR)
		snprintf(status, sizeof(status), "for");
	else if (bb->status == STMT_DO_WHILE)
		snprintf(status, sizeof(status), "do_while");
	else if(bb->status == STMT_PSEUDO)
		snprintf(status,sizeof(status),"pseudo");
	else if(bb->status == STMT_RETURN)
		snprintf(status,sizeof(status),"return");
	else
		snprintf(status, sizeof(status), "normal");

	return status;
}

static const char *get_call_func_name (struct entrypoint *ep,
													struct basic_block *bb) {

	static char name[31];

	if (!bb->call_name)	snprintf(name, sizeof(name), "no");
	else snprintf(name, sizeof(name), "%s", bb->call_name);

	return name;
}

static const char *get_function_name(struct entrypoint *ep,
													struct basic_block *bb) {

	static char name[31];

	snprintf(name, sizeof(name), "%s", ep->name);

	return name;
}

static const char *get_start_line(struct entrypoint *ep,
													struct basic_block *bb) {

	static char line[5];

	snprintf (line, sizeof(line),"%d", bb->start_line);

	return line;
}

static const char *get_last_line (struct entrypoint *ep,
													struct basic_block *bb) {

	static char line[5];

	snprintf (line,sizeof(line),"%d",bb->last_line);
	return line;
}

static const char *get_loop_iteration (struct entrypoint *ep,
													struct basic_block *bb) {

	static char iterat[7];

	snprintf (iterat, sizeof(iterat), "%d", bb->iteration_num);

	return iterat;
}

static const char *get_loop_wcec(struct entrypoint *ep, struct basic_block *bb){

	static char loop_wcec[10];

	snprintf (loop_wcec, sizeof(loop_wcec), "%d", bb->loop_wcec);

	return loop_wcec;
}

static const char *get_wcec (struct entrypoint *ep, struct basic_block *bb) {

	static char wcec[20];

	snprintf(wcec, sizeof(wcec), "%d", bb->wcec);
	return wcec;
}

static const char *get_nodegr(struct entrypoint *ep, struct basic_block *bb)
{
	static char buff[580];

	sprintf(buff, "\n<y:ShapeNode>"
		"\n<y:Geometry height=\"30.0\" width=\"30.0\" x=\"413.0\" "
								"y=\"90.0\"/>"
		"\n<y:Fill color=\"#FFCC00\" transparent=\"false\"/>"
		"\n<y:BorderStyle color=\"#000000\" type=\"line\" "
							"width=\"1.0\"/>"
		"\n<y:NodeLabel alignment=\"center\" autoSizePolicy=\"content\""
		" fontFamily=\"Dialog\" fontSize=\"12\" fontStyle=\"plain\" "
		"hasBackgroundColor=\"false\" hasLineColor=\"false\" "
		"height=\"19.0\" modelName=\"internal\" modelPosition=\"c\" "
		"textColor=\"#000000\" visible=\"true\" width=\"12.0\" "
		"x=\"9.0\" y=\"5.5\">\n%d\nW: %d\n</y:NodeLabel>"
	"\n<y:Shape type=\"ellipse\"/>"
	"\n</y:ShapeNode>\n", bb->id, bb->wcec);

	return buff;

}

static const char *get_edgegr(struct entrypoint *ep, struct basic_block *bb)
{
	static char buff[600];

	sprintf(buff, "\n<y:PolyLineEdge>"
		"\n<y:Path sx=\"0.0\" sy=\"0.0\" tx=\"0.0\" ty=\"0.0\"/>"
		"\n<y:LineStyle color=\"#000000\" type=\"line\" width=\"1.0\"/>"
		"\n<y:Arrows source=\"none\" target=\"standard\"/>"
		"\n<y:BendStyle smoothed=\"false\"/>"
		"<y:EdgeLabel alignment=\"center\" distance=\"2.0\" "
			"fontFamily=\"Dialog\" fontSize=\"12\" "
			"fontStyle=\"plain\" hasBackgroundColor=\"false\" "
			"hasLineColor=\"false\" height=\"19.0\" "
			"modelName=\"six_pos\" modelPosition=\"tail\" "
			"visible=\"true\">%d</y:EdgeLabel>"
		"\n</y:PolyLineEdge>", bb->max_rwcec);

	return buff;
}

