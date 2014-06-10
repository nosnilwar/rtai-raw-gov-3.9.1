
%option yylineno

%{

#include <stdio.h>
#include "syntax.tab.h"

#define ONE 1
int yycolumn = ONE;

// toda vez que um token é lido, estes comandos são executados antes do código entre chaves {}!
#define YY_USER_ACTION count(); \
	yylloc.first_line = yylloc.last_line = yylineno; \
	yylloc.first_column = yycolumn; yylloc.last_column = yycolumn + yyleng-1; \
	yycolumn += yyleng;

int check_type(void);
void count(void);
%}

D	[0-9]
L	[a-zA-Z_]
H	[a-fA-F0-9]
E	([Ee][+-]?{D}+)
P	([Pp][+-]?{D}+)
FS	(f|F|l|L)
IS	((u|U)|(u|U)?(l|L|ll|LL)|(l|L|ll|LL)(u|U))

comments	"//".*|\/\*([^\*]|\*+[^\/\*])*\*+\/

%%

{comments}		{ /* nothing to do */ }
"#".*			{ /* nothing to do */ }

"auto"			{ return ANY_TOKEN; }
"_Bool"			{ return ANY_TOKEN; }
"break"			{ return(BREAK); }
"case"			{ return(CASE); }
"char"			{ return ANY_TOKEN;}
"_Complex"		{ return ANY_TOKEN;}
"const"			{ return ANY_TOKEN;}
"continue"		{ return(CONTINUE); }
"default"		{ return(DEFAULT); }
"do"			{ return(DO); }
"double"		{ return ANY_TOKEN; }
"else"			{ return(ELSE); }
"enum"			{ return(ENUM); }
"extern"		{ return ANY_TOKEN; }
"float"			{ return ANY_TOKEN; }
"for"			{ return(FOR); }
"goto"			{ return ANY_TOKEN; }
"if"			{ return(IF); }
"_Imaginary"	{ return ANY_TOKEN; }
"inline"		{ return ANY_TOKEN; }
"int"			{ return ANY_TOKEN; }
"long"			{ return ANY_TOKEN; }
"register"		{ return ANY_TOKEN; }
"restrict"		{ return ANY_TOKEN; }
"return"		{ return(RETURN); }
"short"			{ return ANY_TOKEN; }
"signed"		{ return ANY_TOKEN; }
"sizeof"		{ return ANY_TOKEN; }
"static"		{ return ANY_TOKEN; }
"struct"		{ return(STRUCT); }
"switch"		{ return(SWITCH); }
"typedef"		{ return ANY_TOKEN; }
"union"			{ return(UNION); }
"unsigned"		{ return ANY_TOKEN; }
"void"			{ return ANY_TOKEN; }
"volatile"		{ return ANY_TOKEN; }
"while"			{ return(WHILE); }

{L}({L}|{D})*			{ yylval.id = strdup(yytext); return(IDENTIFIER); }

0[xX]{H}+{IS}?			{return ANY_TOKEN; }
0[0-7]*{IS}?			{return ANY_TOKEN; }
[1-9]{D}*{IS}?			{return ANY_TOKEN; }
L?'(\\.|[^\\'\n])+'		{return ANY_TOKEN; }

{D}+{E}{FS}?			{return ANY_TOKEN; }
{D}*"."{D}+{E}?{FS}?			{ return ANY_TOKEN; }
{D}+"."{D}*{E}?{FS}?			{ return ANY_TOKEN; }
0[xX]{H}+{P}{FS}?				{ return ANY_TOKEN; }
0[xX]{H}*"."{H}+{P}?{FS}?		{ return ANY_TOKEN; }
0[xX]{H}+"."{H}*{P}?{FS}?		{ return ANY_TOKEN; }


L?\"(\\.|[^\\"\n])*\"			{ return ANY_TOKEN; }

"..."			{ return ANY_TOKEN; }
">>="			{ return ANY_TOKEN; }
"<<="			{ return ANY_TOKEN; }
"+="			{ return ANY_TOKEN; }
"-="			{ return ANY_TOKEN; }
"*="			{ return ANY_TOKEN; }
"/="			{ return ANY_TOKEN; }
"%="			{ return ANY_TOKEN; }
"&="			{ return ANY_TOKEN; }
"^="			{ return ANY_TOKEN; }
"|="			{ return ANY_TOKEN; }
">>"			{ return ANY_TOKEN; }
"<<"			{ return ANY_TOKEN; }
"++"			{ return ANY_TOKEN; }
"--"			{ return ANY_TOKEN; }
"->"			{ return ANY_TOKEN; }
"&&"			{ return ANY_TOKEN; }
"||"			{ return ANY_TOKEN; }
"<="			{ return ANY_TOKEN; }
">="			{ return ANY_TOKEN; }
"=="			{ return ANY_TOKEN; }
"!="			{ return ANY_TOKEN; }
";"				{ return(';'); }
("{"|"<%")		{ return('{'); }
("}"|"%>")		{ return('}'); }
","			{ return ANY_TOKEN; }
":"			{ return (':'); }
"="			{ return ANY_TOKEN; }
"("			{ return('('); }
")"			{ return(')'); }
("["|"<:")		{ return ANY_TOKEN; }
("]"|":>")		{ return ANY_TOKEN; }
"."			{ return ANY_TOKEN; }
"&"			{ return ANY_TOKEN; }
"!"			{ return ANY_TOKEN; }
"~"			{ return ANY_TOKEN; }
"-"			{ return ANY_TOKEN; }
"+"			{ return ANY_TOKEN; }
"*"			{ return ANY_TOKEN; }
"/"			{ return ANY_TOKEN; }
"%"			{ return ANY_TOKEN; }
"<"			{ return ANY_TOKEN; }
">"			{ return ANY_TOKEN; }
"^"			{ return ANY_TOKEN; }
"|"			{ return ANY_TOKEN; }
"?"			{ return '?'; }

[ \t\v\f]	{ /* nothing to do */ }
\n			{ yycolumn = ONE;}
.			{ /* Add code to complain about unmatched characters */ return ANY_TOKEN;}

%%

int column = 0;

void count(void)
{
	int i;

	//fprintf(stderr, "%s", yytext);
	for (i = 0; yytext[i] != '\0'; i++)
		if (yytext[i] == '\n')
			column = 0;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;

	//ECHO;
}
