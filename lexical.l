%option yywrap
%{
	#include <stdio.h>
	#include <string.h>
	#include "y.tab.h"
%}

%%

END         return (END);
Program 	return (PROGRAM);
\n 			return (NEWLINE);
"="			return (ASSIGN);
"("			return (AP);
")"			return (FP);
"=="		return (EQUALS);
"+"			return (PLUS);
"-"			return (MINUS);
"*"			return (MULT);
"/"			return (DIVIDE);
">"			return (GREATER);
">="		return (GREATEROREQUAL);
"<"			return (LESSER);
"<="		return (LESSEROREQUAL);
ENQUANTO    return (ENQUANTO);
ENTRADA     return (ENTRADA);
SAIDA       return (SAIDA);
FACA        return (FACA);
FIM         return (FIM);
SE          return (SE);
ENTAO       return (ENTAO);
SENAO       return (SENAO);
INC         return (INC);
ZERA        return (ZERA);
VEZES		return (VEZES);
[a-zA-Z]+	{yylval.str=strdup(yytext); return ID;};
