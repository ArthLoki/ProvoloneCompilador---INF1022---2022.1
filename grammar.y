%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>

int yylex();
void yyerror(const char *s){
    fprintf(stderr, "%s\n", s);
};

%}

%union {
    char *str;
    int number;
};

%type <str> varlist, cmds, cmd, Program;
%token <str> ID;
