%locations

%{

#include <stdio.h>
#include "grammar.h"

extern int yylineno;
%}

%locations
%union {
	char *id;
}

%token <id> IDENTIFIER CONSTANT STRING_LITERAL SIZEOF
%token PTR_OP INC_OP DEC_OP LEFT_OP RIGHT_OP LE_OP GE_OP EQ_OP NE_OP
%token AND_OP OR_OP MUL_ASSIGN DIV_ASSIGN MOD_ASSIGN ADD_ASSIGN
%token SUB_ASSIGN LEFT_ASSIGN RIGHT_ASSIGN AND_ASSIGN
%token XOR_ASSIGN OR_ASSIGN TYPE_NAME

%token TYPEDEF EXTERN STATIC AUTO REGISTER INLINE RESTRICT
%token CHAR SHORT INT LONG SIGNED UNSIGNED FLOAT DOUBLE CONST VOLATILE VOID
%token BOOL COMPLEX IMAGINARY
%token STRUCT UNION ENUM ELLIPSIS

%token CASE DEFAULT IF ELSE SWITCH WHILE DO FOR GOTO CONTINUE BREAK RETURN

%token ANY_TOKEN

%type <id> declarator
%type <id> primary_expression expression

%start translation_unit

%%

translation_unit
	: external_declaration
	| translation_unit external_declaration
	;

external_declaration
	: struct_or_union_specifier ';'
	| enum_specifier ';'
	| declarator_specifier
	;

struct_or_union_specifier
	: struct_or_union declarator_list
	| struct_or_union declarator '{' struct_declaration_list '}'
	| struct_or_union declarator '{' struct_declaration_list '}' declarator_list
	| struct_or_union '{' struct_declaration_list '}' declarator_list
	;

struct_declaration_list
	: external_declaration
	| struct_declaration_list external_declaration
	;

struct_or_union
	: STRUCT
	| UNION
	;

enum_specifier
	: ENUM declarator_list
	| ENUM declarator '{' declarator_list '}'
	| ENUM declarator '{' declarator_list '}' declarator_list
	| ENUM '{' declarator_list '}'
	| ENUM '{' declarator_list '}' declarator_list
	;

declarator_specifier
	: declarator {/*garante o tipo da função como identificador*/}
	| declarator ';' {/*declaração de variáveis*/}
	| function_definition
	;

function_definition
	: declarator '(' ')' ';'
		{parser_add_function($1, @2.first_line, 0); /* function declaration */}
	| declarator '(' ')'
		{parser_add_function($1, @2.first_line, 1); /* function definition */}
		compound_statement
	| declarator '(' parameter_list ')' ';'
		{parser_add_function($1, @2.first_line, 0); /* function declaration */}
	| declarator '(' parameter_list ')'
		{parser_add_function($1, @2.first_line, 1); /* function definition */}
		compound_statement {_set_ep_last_line(@6.last_line);}
	;

parameter_list
	: parameter
	| parameter_list parameter
	;

parameter
	: declarator
	| struct_or_union declarator
	| ENUM declarator
	;

declarator_list
	: declarator
	| declarator_list declarator
	;

declarator
	: IDENTIFIER
	| ANY_TOKEN {$$ = NULL;}
	;

compound_statement
	: '{' '}'
	| '{' statement_list '}'
	;

statement_list
	: statement
	| statement_list statement
	;

statement
	: compound_statement
	| selection_statement
	| iteration_statement
	| jump_statement
	| expression_statement
	;

selection_statement
	: IF '(' expression ')'
		{_add_stmt(STMT_IF, @1.first_line);}
		{_add_stmt_then(@1.first_line);}
			then_else_statement
		{_add_stmt_end(yylineno);}
	| SWITCH '(' expression ')'
		{_add_stmt(STMT_SWITCH, @1.first_line);}
			'{' labeled_statement '}'
		{_add_stmt_end(yylineno);}
	;

then_else_statement
	: compound_statement {_add_stmt_then_end();}
	| compound_statement {_add_stmt_then_end();}
		ELSE {_add_stmt_else(yylineno);}
			statement
	;

labeled_statement
	: CASE expression ':'
		{_add_stmt(STMT_CASE, @1.first_line);}
		{_add_stmt_then(@1.first_line);}
			statement_list
		{/*_add_stmt_then_end(yylineno);*/}
			labeled_statement
		{_add_stmt_end(yylineno);}
	| DEFAULT ':'
		{_add_stmt_else(@2.first_line);}
			statement_list
	;

iteration_statement
	: WHILE '(' expression ')'
		{_add_stmt(STMT_WHILE, @1.first_line);}
		{_add_stmt_then(@1.first_line);}
			compound_statement
		{/*_add_stmt_then_end(yylineno);*/}
		{_add_stmt_end(yylineno);}
	| DO
		{_add_stmt(STMT_DO_WHILE, @1.first_line);}
		{_add_stmt_then(@1.first_line);}
			compound_statement
			WHILE '(' expression ')' ';'
		{/*_add_stmt_then_end(yylineno);*/}
		{_add_stmt_end(yylineno);}
	| for_statement
	;

for_statement
	: FOR '(' expression ';' expression ';'	expression ')'
		{_add_stmt(STMT_FOR, @1.first_line);}
		{_add_stmt_then(@1.first_line);}
		compound_statement
		{/*_add_stmt_then_end(yylineno);*/}
		{_add_stmt_end(yylineno);}
	{/*| FOR '(' expression ';' expression';' ')' compound_statement
	| FOR '(' ';' expression ';' expression ')' compound_statement
	| FOR '(' ';' expression ';' ')' compound_statement*/}
	;

jump_statement
	: BREAK {_add_break(@1.first_line);}
	| CONTINUE {_add_continue(@1.first_line);}
	| RETURN {_add_return(@1.first_line);}
	;

expression_statement
	: ';' {_add_common_node(@1.first_line);}
	| expression ';' {_add_common_node(@2.first_line);}
	;

expression
	: primary_expression
	| expression primary_expression {$$ = $2;}
	| expression '(' ')' {_add_function_caller($1, @1.first_line);}
	| expression '(' expression ')' {_add_function_caller($1, @1.first_line);}
	| '(' expression ')' '?' expression ':' {$$ = NULL;}
	| '(' expression ')' {$$ = NULL;}
	;

primary_expression
	: IDENTIFIER
	| struct_or_union IDENTIFIER {$$ = NULL;}
	| ENUM IDENTIFIER {$$ = NULL;}
	| ANY_TOKEN {$$ = NULL;}
	;

%%

extern int column;
extern FILE *yyin;

int main (int argc, char **argv) {

	if (argc > 1) {
		yyin = fopen(argv[1], "r");
		if (!yyin) {
			perror(argv[1]);
			return 1;
		}
	}
	else
		yyin = stdin;

	parser_init_structs();
	yyparse();
	parser_last_commands(argv[1]);

	return 0;
}

yyerror (char *str) {

	fflush(stdout);
	fprintf(stderr, "\n%*s\n%*s\nline %d\n\n", column, "^", column, str, yylineno);
	exit(1);
}
