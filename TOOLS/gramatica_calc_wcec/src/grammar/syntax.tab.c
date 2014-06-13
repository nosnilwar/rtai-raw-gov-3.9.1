
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 1



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 3 "src/grammar/syntax.y"


#include <stdio.h>
#include "grammar.h"

extern int yylineno;


/* Line 189 of yacc.c  */
#line 82 "src/grammar/syntax.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IDENTIFIER = 258,
     CONSTANT = 259,
     STRING_LITERAL = 260,
     SIZEOF = 261,
     PTR_OP = 262,
     INC_OP = 263,
     DEC_OP = 264,
     LEFT_OP = 265,
     RIGHT_OP = 266,
     LE_OP = 267,
     GE_OP = 268,
     EQ_OP = 269,
     NE_OP = 270,
     AND_OP = 271,
     OR_OP = 272,
     MUL_ASSIGN = 273,
     DIV_ASSIGN = 274,
     MOD_ASSIGN = 275,
     ADD_ASSIGN = 276,
     SUB_ASSIGN = 277,
     LEFT_ASSIGN = 278,
     RIGHT_ASSIGN = 279,
     AND_ASSIGN = 280,
     XOR_ASSIGN = 281,
     OR_ASSIGN = 282,
     TYPE_NAME = 283,
     TYPEDEF = 284,
     EXTERN = 285,
     STATIC = 286,
     AUTO = 287,
     REGISTER = 288,
     INLINE = 289,
     RESTRICT = 290,
     CHAR = 291,
     SHORT = 292,
     INT = 293,
     LONG = 294,
     SIGNED = 295,
     UNSIGNED = 296,
     FLOAT = 297,
     DOUBLE = 298,
     CONST = 299,
     VOLATILE = 300,
     VOID = 301,
     BOOL = 302,
     COMPLEX = 303,
     IMAGINARY = 304,
     STRUCT = 305,
     UNION = 306,
     ENUM = 307,
     ELLIPSIS = 308,
     CASE = 309,
     DEFAULT = 310,
     IF = 311,
     ELSE = 312,
     SWITCH = 313,
     WHILE = 314,
     DO = 315,
     FOR = 316,
     GOTO = 317,
     CONTINUE = 318,
     BREAK = 319,
     RETURN = 320,
     ANY_TOKEN = 321
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 12 "src/grammar/syntax.y"

	char *id;



/* Line 214 of yacc.c  */
#line 190 "src/grammar/syntax.tab.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 215 "src/grammar/syntax.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL \
	     && defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
  YYLTYPE yyls_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE) + sizeof (YYLTYPE)) \
      + 2 * YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  17
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   419

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  74
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  46
/* YYNRULES -- Number of rules.  */
#define YYNRULES  90
/* YYNRULES -- Number of states.  */
#define YYNSTATES  159

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   321

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      70,    71,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    72,    67,
       2,     2,     2,    73,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    68,     2,    69,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    11,    14,    16,    19,    25,
      32,    38,    40,    43,    45,    47,    50,    56,    63,    68,
      74,    76,    79,    81,    86,    87,    93,    99,   100,   107,
     109,   112,   114,   117,   120,   122,   125,   127,   129,   132,
     136,   138,   141,   143,   145,   147,   149,   151,   152,   153,
     161,   162,   171,   173,   174,   175,   181,   182,   183,   184,
     193,   194,   199,   200,   201,   202,   211,   212,   213,   214,
     225,   227,   228,   229,   230,   231,   245,   247,   249,   251,
     253,   256,   258,   261,   265,   270,   277,   281,   283,   286,
     289
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      75,     0,    -1,    76,    -1,    75,    76,    -1,    77,    67,
      -1,    80,    67,    -1,    81,    -1,    79,    87,    -1,    79,
      88,    68,    78,    69,    -1,    79,    88,    68,    78,    69,
      87,    -1,    79,    68,    78,    69,    87,    -1,    76,    -1,
      78,    76,    -1,    50,    -1,    51,    -1,    52,    87,    -1,
      52,    88,    68,    87,    69,    -1,    52,    88,    68,    87,
      69,    87,    -1,    52,    68,    87,    69,    -1,    52,    68,
      87,    69,    87,    -1,    88,    -1,    88,    67,    -1,    82,
      -1,    88,    70,    71,    67,    -1,    -1,    88,    70,    71,
      83,    89,    -1,    88,    70,    85,    71,    67,    -1,    -1,
      88,    70,    85,    71,    84,    89,    -1,    86,    -1,    85,
      86,    -1,    88,    -1,    79,    88,    -1,    52,    88,    -1,
      88,    -1,    87,    88,    -1,     3,    -1,    66,    -1,    68,
      69,    -1,    68,    90,    69,    -1,    91,    -1,    90,    91,
      -1,    89,    -1,    92,    -1,   104,    -1,   116,    -1,   117,
      -1,    -1,    -1,    56,    70,   118,    71,    93,    94,    96,
      -1,    -1,    58,    70,   118,    71,    95,    68,    99,    69,
      -1,    89,    -1,    -1,    -1,    89,    97,    57,    98,    91,
      -1,    -1,    -1,    -1,    54,   118,    72,   100,   101,    90,
     102,    99,    -1,    -1,    55,    72,   103,    90,    -1,    -1,
      -1,    -1,    59,    70,   118,    71,   105,   106,    89,   107,
      -1,    -1,    -1,    -1,    60,   108,   109,    89,    59,    70,
     118,    71,    67,   110,    -1,   111,    -1,    -1,    -1,    -1,
      -1,    61,    70,   118,    67,   118,    67,   118,    71,   112,
     113,    89,   114,   115,    -1,    64,    -1,    63,    -1,    65,
      -1,    67,    -1,   118,    67,    -1,   119,    -1,   118,   119,
      -1,   118,    70,    71,    -1,   118,    70,   118,    71,    -1,
      70,   118,    71,    73,   118,    72,    -1,    70,   118,    71,
      -1,     3,    -1,    79,     3,    -1,    52,     3,    -1,    66,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    39,    39,    40,    44,    45,    46,    50,    51,    52,
      53,    57,    58,    62,    63,    67,    68,    69,    70,    71,
      75,    76,    77,    81,    84,    83,    86,    89,    88,    94,
      95,    99,   100,   101,   105,   106,   110,   111,   115,   116,
     120,   121,   125,   126,   127,   128,   129,   134,   135,   133,
     139,   138,   145,   146,   147,   146,   153,   154,   156,   152,
     160,   159,   166,   167,   169,   165,   172,   173,   176,   171,
     178,   183,   184,   186,   187,   182,   194,   195,   196,   200,
     201,   205,   206,   207,   208,   209,   210,   214,   215,   216,
     217
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "IDENTIFIER", "CONSTANT",
  "STRING_LITERAL", "SIZEOF", "PTR_OP", "INC_OP", "DEC_OP", "LEFT_OP",
  "RIGHT_OP", "LE_OP", "GE_OP", "EQ_OP", "NE_OP", "AND_OP", "OR_OP",
  "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN", "SUB_ASSIGN",
  "LEFT_ASSIGN", "RIGHT_ASSIGN", "AND_ASSIGN", "XOR_ASSIGN", "OR_ASSIGN",
  "TYPE_NAME", "TYPEDEF", "EXTERN", "STATIC", "AUTO", "REGISTER", "INLINE",
  "RESTRICT", "CHAR", "SHORT", "INT", "LONG", "SIGNED", "UNSIGNED",
  "FLOAT", "DOUBLE", "CONST", "VOLATILE", "VOID", "BOOL", "COMPLEX",
  "IMAGINARY", "STRUCT", "UNION", "ENUM", "ELLIPSIS", "CASE", "DEFAULT",
  "IF", "ELSE", "SWITCH", "WHILE", "DO", "FOR", "GOTO", "CONTINUE",
  "BREAK", "RETURN", "ANY_TOKEN", "';'", "'{'", "'}'", "'('", "')'", "':'",
  "'?'", "$accept", "translation_unit", "external_declaration",
  "struct_or_union_specifier", "struct_declaration_list",
  "struct_or_union", "enum_specifier", "declarator_specifier",
  "function_definition", "$@1", "$@2", "parameter_list", "parameter",
  "declarator_list", "declarator", "compound_statement", "statement_list",
  "statement", "selection_statement", "$@3", "$@4", "$@5",
  "then_else_statement", "$@6", "$@7", "labeled_statement", "$@8", "$@9",
  "$@10", "$@11", "iteration_statement", "$@12", "$@13", "$@14", "$@15",
  "$@16", "$@17", "for_statement", "$@18", "$@19", "$@20", "$@21",
  "jump_statement", "expression_statement", "expression",
  "primary_expression", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,    59,   123,   125,
      40,    41,    58,    63
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    74,    75,    75,    76,    76,    76,    77,    77,    77,
      77,    78,    78,    79,    79,    80,    80,    80,    80,    80,
      81,    81,    81,    82,    83,    82,    82,    84,    82,    85,
      85,    86,    86,    86,    87,    87,    88,    88,    89,    89,
      90,    90,    91,    91,    91,    91,    91,    93,    94,    92,
      95,    92,    96,    97,    98,    96,   100,   101,   102,    99,
     103,    99,   105,   106,   107,   104,   108,   109,   110,   104,
     104,   112,   113,   114,   115,   111,   116,   116,   116,   117,
     117,   118,   118,   118,   118,   118,   118,   119,   119,   119,
     119
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     2,     2,     1,     2,     5,     6,
       5,     1,     2,     1,     1,     2,     5,     6,     4,     5,
       1,     2,     1,     4,     0,     5,     5,     0,     6,     1,
       2,     1,     2,     2,     1,     2,     1,     1,     2,     3,
       1,     2,     1,     1,     1,     1,     1,     0,     0,     7,
       0,     8,     1,     0,     0,     5,     0,     0,     0,     8,
       0,     4,     0,     0,     0,     8,     0,     0,     0,    10,
       1,     0,     0,     0,     0,    13,     1,     1,     1,     1,
       2,     1,     2,     3,     4,     6,     3,     1,     2,     2,
       1
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,    36,    13,    14,     0,    37,     0,     2,     0,     0,
       0,     6,    22,    20,     0,    15,    34,     1,     3,     4,
       0,     7,    34,     5,    21,     0,     0,    34,    35,     0,
      11,     0,     0,     0,    24,     0,     0,    29,    31,    18,
       0,     0,    12,     0,    33,    23,     0,    32,    27,    30,
      19,    16,    10,     8,     0,    25,    26,     0,    17,     9,
      87,     0,     0,     0,     0,    66,     0,    77,    76,    78,
      90,    79,    38,     0,     0,    42,     0,    40,    43,    44,
      70,    45,    46,     0,    81,    28,    89,     0,     0,     0,
      67,     0,     0,    88,    39,    41,    80,     0,    82,     0,
       0,     0,     0,     0,    86,    83,     0,    47,    50,    62,
       0,     0,     0,    84,    48,     0,    63,     0,     0,     0,
       0,     0,     0,     0,     0,    85,    52,    49,     0,     0,
       0,    64,     0,     0,     0,     0,    60,    51,    65,     0,
      71,    54,    56,     0,    68,    72,     0,    57,    61,    69,
       0,    55,     0,    73,    58,    74,     0,    75,    59
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,    30,     8,    31,    74,    10,    11,    12,    46,
      57,    36,    37,    15,    28,    75,    76,    77,    78,   114,
     120,   115,   127,   134,   146,   130,   147,   152,   156,   143,
      79,   116,   122,   138,    90,   102,   149,    80,   145,   150,
     155,   157,    81,    82,    83,    84
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -129
static const yytype_int16 yypact[] =
{
     266,  -129,  -129,  -129,    14,  -129,   240,  -129,   -60,    22,
     -58,  -129,  -129,   -62,     1,     1,   -47,  -129,  -129,  -129,
     266,     1,   -45,  -129,  -129,   106,    -1,  -129,  -129,     1,
    -129,   230,   266,     1,   -41,     1,   110,  -129,  -129,     1,
      33,     1,  -129,   261,  -129,  -129,   -40,  -129,   -38,  -129,
       1,     1,     1,     1,   128,  -129,  -129,   -40,     1,     1,
    -129,    19,   -43,   -39,   -36,  -129,   -31,  -129,  -129,  -129,
    -129,  -129,  -129,   204,    29,  -129,   150,  -129,  -129,  -129,
    -129,  -129,  -129,   196,  -129,  -129,  -129,   204,   204,   204,
    -129,   204,    35,  -129,  -129,  -129,  -129,    41,  -129,    44,
      66,    72,   -40,   201,   -33,  -129,    75,  -129,  -129,  -129,
     -11,   204,   204,  -129,  -129,   -14,  -129,   -12,   209,     0,
     -40,   -35,   -40,   204,   204,  -129,     2,  -129,   204,    -8,
      -9,  -129,    97,   100,    27,    11,  -129,  -129,  -129,    30,
    -129,  -129,  -129,   171,  -129,  -129,   171,  -129,   171,  -129,
     -40,  -129,   171,  -129,   171,  -129,   -35,  -129,  -129
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -129,  -129,     6,  -129,    57,    10,  -129,  -129,  -129,  -129,
    -129,  -129,    62,     4,   329,   -46,  -128,   -75,  -129,  -129,
    -129,  -129,  -129,  -129,  -129,   -48,  -129,  -129,  -129,  -129,
    -129,  -129,  -129,  -129,  -129,  -129,  -129,  -129,  -129,  -129,
    -129,  -129,  -129,  -129,   213,   284
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -54
static const yytype_int16 yytable[] =
{
      55,    95,     1,    60,     1,    24,     7,    19,    25,    23,
       9,    85,    18,    21,    60,   148,     9,     1,    26,   128,
     129,    29,    86,    32,   154,     1,    45,    87,    54,    56,
       9,    88,    93,    40,    89,    35,     1,    42,    60,    91,
     112,     9,     9,    50,    60,    52,    35,    60,   117,    42,
       2,     3,    61,     9,   121,    58,   110,    59,   123,   -53,
     137,     2,     3,    61,   136,     5,    70,     5,    39,    60,
      97,   151,   125,    95,   126,    60,   131,    70,    60,    95,
       5,    97,    14,   142,   141,     2,     3,    61,     5,    43,
      20,     2,     3,    61,     2,     3,    61,   144,    49,     5,
      60,    70,    51,    60,   153,    97,   104,    70,   158,     1,
      70,    73,   105,     1,    97,   107,     2,     3,    61,     0,
       0,     0,     2,     3,    61,     2,     3,    61,     0,     0,
       0,    60,    70,     0,     0,     0,    97,   108,    70,     0,
       0,    70,    97,   109,     0,    97,   113,     2,     3,    61,
       2,     3,    61,    60,     0,     0,     2,     3,    33,     0,
       2,     3,    33,    70,     0,     0,    70,    97,   139,     0,
      97,   140,     5,     0,    60,     0,     5,    34,     2,     3,
      61,    48,     0,     0,    62,     0,    63,    64,    65,    66,
       0,    67,    68,    69,    70,    71,    54,    72,    73,    60,
       2,     3,    61,     0,    60,     0,    62,    60,    63,    64,
      65,    66,    60,    67,    68,    69,    70,    71,    54,    94,
      73,     2,     3,    61,     0,     0,     0,    62,     0,    63,
      64,    65,    66,     1,    67,    68,    69,    70,    71,    54,
      17,    73,     0,     1,     0,     0,     2,     3,    61,     0,
       0,     2,     3,    61,     2,     3,    61,     0,     0,     2,
       3,    61,    70,    96,     1,     0,    97,    70,   111,     1,
      70,    97,     0,     0,    73,    70,   124,     0,     0,    97,
       2,     3,     4,     0,     0,     0,    92,     0,     0,     0,
       2,     3,     4,     0,     0,     0,     5,     0,     0,    41,
      99,   100,   101,     0,   103,     0,     5,     0,     0,     0,
     106,     2,     3,     4,     0,     0,     2,     3,     4,     0,
       0,     0,     0,     0,   118,   119,     0,     5,     0,    13,
      53,     0,     5,    16,     0,    13,   132,   133,    22,     0,
       0,   135,     0,    27,     0,     0,     0,     0,     0,    13,
       0,     0,     0,     0,    38,     0,     0,     0,    27,     0,
      13,    13,    44,     0,    47,    38,     0,    98,    27,     0,
      27,     0,    13,     0,     0,     0,    98,     0,     0,     0,
      27,     0,    27,    98,    98,    98,     0,    98,     0,     0,
      98,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    98,    98,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    98,    98,     0,    98
};

static const yytype_int16 yycheck[] =
{
      46,    76,     3,     3,     3,    67,     0,    67,    70,    67,
       0,    57,     6,     9,     3,   143,     6,     3,    14,    54,
      55,    68,     3,    68,   152,     3,    67,    70,    68,    67,
      20,    70,     3,    29,    70,    25,     3,    31,     3,    70,
      73,    31,    32,    39,     3,    41,    36,     3,    59,    43,
      50,    51,    52,    43,    68,    51,   102,    53,    70,    57,
      69,    50,    51,    52,    72,    66,    66,    66,    69,     3,
      70,   146,    72,   148,   120,     3,   122,    66,     3,   154,
      66,    70,    68,    72,    57,    50,    51,    52,    66,    32,
      68,    50,    51,    52,    50,    51,    52,    67,    36,    66,
       3,    66,    69,     3,   150,    70,    71,    66,   156,     3,
      66,    70,    71,     3,    70,    71,    50,    51,    52,    -1,
      -1,    -1,    50,    51,    52,    50,    51,    52,    -1,    -1,
      -1,     3,    66,    -1,    -1,    -1,    70,    71,    66,    -1,
      -1,    66,    70,    71,    -1,    70,    71,    50,    51,    52,
      50,    51,    52,     3,    -1,    -1,    50,    51,    52,    -1,
      50,    51,    52,    66,    -1,    -1,    66,    70,    71,    -1,
      70,    71,    66,    -1,     3,    -1,    66,    71,    50,    51,
      52,    71,    -1,    -1,    56,    -1,    58,    59,    60,    61,
      -1,    63,    64,    65,    66,    67,    68,    69,    70,     3,
      50,    51,    52,    -1,     3,    -1,    56,     3,    58,    59,
      60,    61,     3,    63,    64,    65,    66,    67,    68,    69,
      70,    50,    51,    52,    -1,    -1,    -1,    56,    -1,    58,
      59,    60,    61,     3,    63,    64,    65,    66,    67,    68,
       0,    70,    -1,     3,    -1,    -1,    50,    51,    52,    -1,
      -1,    50,    51,    52,    50,    51,    52,    -1,    -1,    50,
      51,    52,    66,    67,     3,    -1,    70,    66,    67,     3,
      66,    70,    -1,    -1,    70,    66,    67,    -1,    -1,    70,
      50,    51,    52,    -1,    -1,    -1,    73,    -1,    -1,    -1,
      50,    51,    52,    -1,    -1,    -1,    66,    -1,    -1,    69,
      87,    88,    89,    -1,    91,    -1,    66,    -1,    -1,    -1,
      97,    50,    51,    52,    -1,    -1,    50,    51,    52,    -1,
      -1,    -1,    -1,    -1,   111,   112,    -1,    66,    -1,     0,
      69,    -1,    66,     4,    -1,     6,   123,   124,     9,    -1,
      -1,   128,    -1,    14,    -1,    -1,    -1,    -1,    -1,    20,
      -1,    -1,    -1,    -1,    25,    -1,    -1,    -1,    29,    -1,
      31,    32,    33,    -1,    35,    36,    -1,    83,    39,    -1,
      41,    -1,    43,    -1,    -1,    -1,    92,    -1,    -1,    -1,
      51,    -1,    53,    99,   100,   101,    -1,   103,    -1,    -1,
     106,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   118,   119,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,   132,   133,    -1,   135
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     3,    50,    51,    52,    66,    75,    76,    77,    79,
      80,    81,    82,    88,    68,    87,    88,     0,    76,    67,
      68,    87,    88,    67,    67,    70,    87,    88,    88,    68,
      76,    78,    68,    52,    71,    79,    85,    86,    88,    69,
      87,    69,    76,    78,    88,    67,    83,    88,    71,    86,
      87,    69,    87,    69,    68,    89,    67,    84,    87,    87,
       3,    52,    56,    58,    59,    60,    61,    63,    64,    65,
      66,    67,    69,    70,    79,    89,    90,    91,    92,   104,
     111,   116,   117,   118,   119,    89,     3,    70,    70,    70,
     108,    70,   118,     3,    69,    91,    67,    70,   119,   118,
     118,   118,   109,   118,    71,    71,   118,    71,    71,    71,
      89,    67,    73,    71,    93,    95,   105,    59,   118,   118,
      94,    68,   106,    70,    67,    72,    89,    96,    54,    55,
      99,    89,   118,   118,    97,   118,    72,    69,   107,    71,
      71,    57,    72,   103,    67,   112,    98,   100,    90,   110,
     113,    91,   101,    89,    90,   114,   102,   115,    99
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value, Location); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (!yyvaluep)
    return;
  YYUSE (yylocationp);
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, YYLTYPE const * const yylocationp)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep, yylocationp)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
    YYLTYPE const * const yylocationp;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  YY_LOCATION_PRINT (yyoutput, *yylocationp);
  YYFPRINTF (yyoutput, ": ");
  yy_symbol_value_print (yyoutput, yytype, yyvaluep, yylocationp);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, YYLTYPE *yylsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yylsp, yyrule)
    YYSTYPE *yyvsp;
    YYLTYPE *yylsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       , &(yylsp[(yyi + 1) - (yynrhs)])		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, yylsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, YYLTYPE *yylocationp)
#else
static void
yydestruct (yymsg, yytype, yyvaluep, yylocationp)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
    YYLTYPE *yylocationp;
#endif
{
  YYUSE (yyvaluep);
  YYUSE (yylocationp);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Location data for the lookahead symbol.  */
YYLTYPE yylloc;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.
       `yyls': related to locations.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    /* The location stack.  */
    YYLTYPE yylsa[YYINITDEPTH];
    YYLTYPE *yyls;
    YYLTYPE *yylsp;

    /* The locations where the error started and ended.  */
    YYLTYPE yyerror_range[2];

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;
  YYLTYPE yyloc;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N), yylsp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yyls = yylsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;
  yylsp = yyls;

#if YYLTYPE_IS_TRIVIAL
  /* Initialize the default location before parsing starts.  */
  yylloc.first_line   = yylloc.last_line   = 1;
  yylloc.first_column = yylloc.last_column = 1;
#endif

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;
	YYLTYPE *yyls1 = yyls;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yyls1, yysize * sizeof (*yylsp),
		    &yystacksize);

	yyls = yyls1;
	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
	YYSTACK_RELOCATE (yyls_alloc, yyls);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;
      yylsp = yyls + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;
  *++yylsp = yylloc;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];

  /* Default location.  */
  YYLLOC_DEFAULT (yyloc, (yylsp - yylen), yylen);
  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 20:

/* Line 1455 of yacc.c  */
#line 75 "src/grammar/syntax.y"
    {/*garante o tipo da função como identificador*/;}
    break;

  case 21:

/* Line 1455 of yacc.c  */
#line 76 "src/grammar/syntax.y"
    {/*declaração de variáveis*/;}
    break;

  case 23:

/* Line 1455 of yacc.c  */
#line 82 "src/grammar/syntax.y"
    {parser_add_function((yyvsp[(1) - (4)].id), (yylsp[(2) - (4)]).first_line, 0); /* function declaration */;}
    break;

  case 24:

/* Line 1455 of yacc.c  */
#line 84 "src/grammar/syntax.y"
    {parser_add_function((yyvsp[(1) - (3)].id), (yylsp[(2) - (3)]).first_line, 1); /* function definition */;}
    break;

  case 26:

/* Line 1455 of yacc.c  */
#line 87 "src/grammar/syntax.y"
    {parser_add_function((yyvsp[(1) - (5)].id), (yylsp[(2) - (5)]).first_line, 0); /* function declaration */;}
    break;

  case 27:

/* Line 1455 of yacc.c  */
#line 89 "src/grammar/syntax.y"
    {parser_add_function((yyvsp[(1) - (4)].id), (yylsp[(2) - (4)]).first_line, 1); /* function definition */;}
    break;

  case 28:

/* Line 1455 of yacc.c  */
#line 90 "src/grammar/syntax.y"
    {_set_ep_last_line((yylsp[(6) - (6)]).last_line);;}
    break;

  case 37:

/* Line 1455 of yacc.c  */
#line 111 "src/grammar/syntax.y"
    {(yyval.id) = NULL;;}
    break;

  case 47:

/* Line 1455 of yacc.c  */
#line 134 "src/grammar/syntax.y"
    {_add_stmt(STMT_IF, (yylsp[(1) - (4)]).first_line);;}
    break;

  case 48:

/* Line 1455 of yacc.c  */
#line 135 "src/grammar/syntax.y"
    {_add_stmt_then((yylsp[(1) - (5)]).first_line);;}
    break;

  case 49:

/* Line 1455 of yacc.c  */
#line 137 "src/grammar/syntax.y"
    {_add_stmt_end(yylineno);;}
    break;

  case 50:

/* Line 1455 of yacc.c  */
#line 139 "src/grammar/syntax.y"
    {_add_stmt(STMT_SWITCH, (yylsp[(1) - (4)]).first_line);;}
    break;

  case 51:

/* Line 1455 of yacc.c  */
#line 141 "src/grammar/syntax.y"
    {_add_stmt_end(yylineno);;}
    break;

  case 52:

/* Line 1455 of yacc.c  */
#line 145 "src/grammar/syntax.y"
    {_add_stmt_then_end();;}
    break;

  case 53:

/* Line 1455 of yacc.c  */
#line 146 "src/grammar/syntax.y"
    {_add_stmt_then_end();;}
    break;

  case 54:

/* Line 1455 of yacc.c  */
#line 147 "src/grammar/syntax.y"
    {_add_stmt_else(yylineno);;}
    break;

  case 56:

/* Line 1455 of yacc.c  */
#line 153 "src/grammar/syntax.y"
    {_add_stmt(STMT_CASE, (yylsp[(1) - (3)]).first_line);;}
    break;

  case 57:

/* Line 1455 of yacc.c  */
#line 154 "src/grammar/syntax.y"
    {_add_stmt_then((yylsp[(1) - (4)]).first_line);;}
    break;

  case 58:

/* Line 1455 of yacc.c  */
#line 156 "src/grammar/syntax.y"
    {/*_add_stmt_then_end(yylineno);*/;}
    break;

  case 59:

/* Line 1455 of yacc.c  */
#line 158 "src/grammar/syntax.y"
    {_add_stmt_end(yylineno);;}
    break;

  case 60:

/* Line 1455 of yacc.c  */
#line 160 "src/grammar/syntax.y"
    {_add_stmt_else((yylsp[(2) - (2)]).first_line);;}
    break;

  case 62:

/* Line 1455 of yacc.c  */
#line 166 "src/grammar/syntax.y"
    {_add_stmt(STMT_WHILE, (yylsp[(1) - (4)]).first_line);;}
    break;

  case 63:

/* Line 1455 of yacc.c  */
#line 167 "src/grammar/syntax.y"
    {_add_stmt_then((yylsp[(1) - (5)]).first_line);;}
    break;

  case 64:

/* Line 1455 of yacc.c  */
#line 169 "src/grammar/syntax.y"
    {/*_add_stmt_then_end(yylineno);*/;}
    break;

  case 65:

/* Line 1455 of yacc.c  */
#line 170 "src/grammar/syntax.y"
    {_add_stmt_end(yylineno);;}
    break;

  case 66:

/* Line 1455 of yacc.c  */
#line 172 "src/grammar/syntax.y"
    {_add_stmt(STMT_DO_WHILE, (yylsp[(1) - (1)]).first_line);;}
    break;

  case 67:

/* Line 1455 of yacc.c  */
#line 173 "src/grammar/syntax.y"
    {_add_stmt_then((yylsp[(1) - (2)]).first_line);;}
    break;

  case 68:

/* Line 1455 of yacc.c  */
#line 176 "src/grammar/syntax.y"
    {/*_add_stmt_then_end(yylineno);*/;}
    break;

  case 69:

/* Line 1455 of yacc.c  */
#line 177 "src/grammar/syntax.y"
    {_add_stmt_end(yylineno);;}
    break;

  case 71:

/* Line 1455 of yacc.c  */
#line 183 "src/grammar/syntax.y"
    {_add_stmt(STMT_FOR, (yylsp[(1) - (8)]).first_line);;}
    break;

  case 72:

/* Line 1455 of yacc.c  */
#line 184 "src/grammar/syntax.y"
    {_add_stmt_then((yylsp[(1) - (9)]).first_line);;}
    break;

  case 73:

/* Line 1455 of yacc.c  */
#line 186 "src/grammar/syntax.y"
    {/*_add_stmt_then_end(yylineno);*/;}
    break;

  case 74:

/* Line 1455 of yacc.c  */
#line 187 "src/grammar/syntax.y"
    {_add_stmt_end(yylineno);;}
    break;

  case 75:

/* Line 1455 of yacc.c  */
#line 188 "src/grammar/syntax.y"
    {/*| FOR '(' expression ';' expression';' ')' compound_statement
	| FOR '(' ';' expression ';' expression ')' compound_statement
	| FOR '(' ';' expression ';' ')' compound_statement*/;}
    break;

  case 76:

/* Line 1455 of yacc.c  */
#line 194 "src/grammar/syntax.y"
    {_add_break((yylsp[(1) - (1)]).first_line);;}
    break;

  case 77:

/* Line 1455 of yacc.c  */
#line 195 "src/grammar/syntax.y"
    {_add_continue((yylsp[(1) - (1)]).first_line);;}
    break;

  case 78:

/* Line 1455 of yacc.c  */
#line 196 "src/grammar/syntax.y"
    {_add_return((yylsp[(1) - (1)]).first_line);;}
    break;

  case 79:

/* Line 1455 of yacc.c  */
#line 200 "src/grammar/syntax.y"
    {_add_common_node((yylsp[(1) - (1)]).first_line);;}
    break;

  case 80:

/* Line 1455 of yacc.c  */
#line 201 "src/grammar/syntax.y"
    {_add_common_node((yylsp[(2) - (2)]).first_line);;}
    break;

  case 82:

/* Line 1455 of yacc.c  */
#line 206 "src/grammar/syntax.y"
    {(yyval.id) = (yyvsp[(2) - (2)].id);;}
    break;

  case 83:

/* Line 1455 of yacc.c  */
#line 207 "src/grammar/syntax.y"
    {_add_function_caller((yyvsp[(1) - (3)].id), (yylsp[(1) - (3)]).first_line);;}
    break;

  case 84:

/* Line 1455 of yacc.c  */
#line 208 "src/grammar/syntax.y"
    {_add_function_caller((yyvsp[(1) - (4)].id), (yylsp[(1) - (4)]).first_line);;}
    break;

  case 85:

/* Line 1455 of yacc.c  */
#line 209 "src/grammar/syntax.y"
    {(yyval.id) = NULL;;}
    break;

  case 86:

/* Line 1455 of yacc.c  */
#line 210 "src/grammar/syntax.y"
    {(yyval.id) = NULL;;}
    break;

  case 88:

/* Line 1455 of yacc.c  */
#line 215 "src/grammar/syntax.y"
    {(yyval.id) = NULL;;}
    break;

  case 89:

/* Line 1455 of yacc.c  */
#line 216 "src/grammar/syntax.y"
    {(yyval.id) = NULL;;}
    break;

  case 90:

/* Line 1455 of yacc.c  */
#line 217 "src/grammar/syntax.y"
    {(yyval.id) = NULL;;}
    break;



/* Line 1455 of yacc.c  */
#line 1994 "src/grammar/syntax.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;
  *++yylsp = yyloc;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }

  yyerror_range[0] = yylloc;

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval, &yylloc);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  yyerror_range[0] = yylsp[1-yylen];
  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      yyerror_range[0] = *yylsp;
      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp, yylsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;

  yyerror_range[1] = yylloc;
  /* Using YYLLOC is tempting, but would change the location of
     the lookahead.  YYLOC is available though.  */
  YYLLOC_DEFAULT (yyloc, (yyerror_range - 1), 2);
  *++yylsp = yyloc;

  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval, &yylloc);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp, yylsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1675 of yacc.c  */
#line 220 "src/grammar/syntax.y"


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

