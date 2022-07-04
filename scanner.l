%option yywrap {
	#include <stdio.h>
	#include <string.h>
	#include "grammar.tab.h"
}
%%

Program 	return PROGRAM;
[a-zA-Z]+	{printf("lido: %s", yytext); yyval.number=atoi(yytext); return ID;}
\n 			return NEWLINE;
"="			return ASSIGN;
"("			return AP;
")"			return FP;
ENQUANTO    return WHILE;
ENTRADA     return INPUT;
SAIDA       return OUTPUT;
FACA        return DO;
FIM         return END;
SE          return IF;
ENTAO       return THEN;
SENAO       return ELSE;
INC         return INC;
ZERA        return ZERA;
