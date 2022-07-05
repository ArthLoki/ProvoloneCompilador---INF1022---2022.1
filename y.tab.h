/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    PROGRAM = 259,
    ENTRADA = 260,
    SAIDA = 261,
    END = 262,
    NEWLINE = 263,
    ENQUANTO = 264,
    FACA = 265,
    INC = 266,
    ZERA = 267,
    SE = 268,
    ENTAO = 269,
    SENAO = 270,
    VEZES = 271,
    FIM = 272,
    ASSIGN = 273,
    AP = 274,
    FP = 275,
    EQUALS = 276,
    DIF = 277,
    PLUS = 278,
    MINUS = 279,
    MULT = 280,
    DIVIDE = 281,
    GREATER = 282,
    GREATEROREQUAL = 283,
    LESSER = 284,
    LESSEROREQUAL = 285
  };
#endif
/* Tokens.  */
#define ID 258
#define PROGRAM 259
#define ENTRADA 260
#define SAIDA 261
#define END 262
#define NEWLINE 263
#define ENQUANTO 264
#define FACA 265
#define INC 266
#define ZERA 267
#define SE 268
#define ENTAO 269
#define SENAO 270
#define VEZES 271
#define FIM 272
#define ASSIGN 273
#define AP 274
#define FP 275
#define EQUALS 276
#define DIF 277
#define PLUS 278
#define MINUS 279
#define MULT 280
#define DIVIDE 281
#define GREATER 282
#define GREATEROREQUAL 283
#define LESSER 284
#define LESSEROREQUAL 285

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 19 "grammar.y"

    char *str;
    int number;

#line 122 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
