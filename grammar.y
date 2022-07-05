%{
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>

int yylex();
int qtdParametros = 0;
void yyerror(const char *s){
    fprintf(stderr, "%s\n", s);
};

// create aux functions
void generateProvolone2c(char *params, char *var1, char *var2){
    printf("int provolone2c(%s) {\n\n%s\n%s\n", params, var1, var2);
};

%}

%union {
    char *str;
    int number;
};

%type <str> varlist cmds cmd program ret;
%token<str> ID;
%token<number> PROGRAM;
%token<number> ENTRADA;
%token<number> SAIDA;
%token<number> END;
%token<number> NEWLINE;
%token<number> ENQUANTO;
%token<number> FACA;
%token<number> INC;
%token<number> ZERA;
%token<number> SE;
%token<number> ENTAO;
%token<number> SENAO;
%token<number> VEZES;
%token<number> FIM;
%token<number> ASSIGN;
%token<number> AP;
%token<number> FP;
%token<number> EQUALS;
%token<number> DIF;
%token<number> PLUS;
%token<number> MINUS;
%token<number> MULT;
%token<number> DIVIDE;
%token<number> GREATER;
%token<number> GREATEROREQUAL;
%token<number> LESSER;
%token<number> LESSEROREQUAL;

%start program

%%

program : ENTRADA varlist SAIDA ret cmds END NEWLINE            {printf("int provolone2c(%s) {\n\n%s\n%s\n", $2, $5, $4);}
        ;

varlist : ID varlist                                            {char *p1=malloc(strlen($1) + strlen($2) + 7); sprintf(p1, "int %s, %s", $1, $2); $$ = p1; qtdParametros++;}
        | ID                                                    {char *p2=malloc(strlen($1) + 5); sprintf(p2, "int %s", $1); $$ = p2; qtdParametros++;}
        ;

ret     : ID                                                    {char *returns = malloc(strlen($1) + 14); sprintf(returns,"\treturn %s;\n\n}\n",$1); $$ = returns;}
        ;

cmds    : cmd cmds                                              {char *cmds1=malloc(strlen($1) + strlen($2) + 2); sprintf(cmds1, "\t%s %s", $1, $2); $$=cmds1;}
        | cmd                                                   {char *cmds2=malloc(strlen($1) + 2); sprintf(cmds2, "\t%s", $1); $$=cmds2;}
        ;

cmd     : ENQUANTO ID FACA cmds FIM                             {char *repIndet=malloc(strlen($2) + strlen($4) + 16); sprintf(repIndet, "while (%s) {\n\t%s\t}\n", $2, $4); $$ = repIndet;}
        | ID ASSIGN ID                                          {char *assign=malloc(strlen($1) + strlen($3) + 6); sprintf(assign, "%s = %s;\n",$1,$3); $$ = assign;}
        | INC AP ID FP                                          {char *increment=malloc(strlen($3) + 5); sprintf(increment, "%s++;\n",$3); $$ = increment;}
        | ZERA AP ID FP                                         {char *zerar=malloc(strlen($3) + 7); sprintf(zerar, "%s = 0;\n",$3); $$ = zerar;}
        | SE cmds ENTAO cmds FIM                                {char *condition1=malloc(strlen($2) + strlen($4) + 13); sprintf(condition1, "if (%s) {\n\t%s\t}\n", $2, $4); $$ = condition1;}
        | SE cmds ENTAO cmds SENAO cmds FIM                     {char *condition2=malloc(strlen($2) + strlen($4) + strlen($6) + 24); sprintf(condition2, "if (%s) {\n\t%s\t}\n\telse{\n\t%s\t}\n", $2, $4, $6); $$ = condition2;}
        | FACA ID VEZES cmds FIM                                {char *repDet=malloc(strlen($2) + strlen($4) + 30); sprintf(repDet, "for (int i=0; i<%s; i++) {\n\t%s\t}\n", $2, $4); $$ = repDet;}
        | ID EQUALS ID                                          {char *equals=malloc(strlen($1) + strlen($3) + 10); sprintf(equals, "%s == %s", $1, $3); $$ = equals;}
        | ID DIF ID                                             {char *dif=malloc(strlen($1) + strlen($3) + 10); sprintf(dif, "%s != %s", $1, $3); $$ = dif;}
        | ID PLUS ID                                            {char *plus=malloc(strlen($1) + strlen($3) + 10); sprintf(plus, "%s + %s", $1, $3); $$ = plus;}
        | ID MINUS ID                                           {char *minus=malloc(strlen($1) + strlen($3) + 10); sprintf(minus, "%s - %s", $1, $3); $$ = minus;}
        | ID MULT ID                                            {char *mult=malloc(strlen($1) + strlen($3) + 10); sprintf(mult, "%s * %s", $1, $3); $$ = mult;}
        | ID DIVIDE ID                                          {char *divide=malloc(strlen($1) + strlen($3) + 10); sprintf(divide, "%s / %s", $1, $3); $$ = divide;}
        | ID GREATER ID                                         {char *greater=malloc(strlen($1) + strlen($3) + 10); sprintf(greater, "%s > %s", $1, $3); $$ = greater;}
        | ID GREATEROREQUAL ID                                  {char *greaterorequal=malloc(strlen($1) + strlen($3) + 10); sprintf(greaterorequal, "%s >= %s", $1, $3); $$ = greaterorequal;}
        | ID LESSER ID                                          {char *lesser=malloc(strlen($1) + strlen($3) + 10); sprintf(lesser, "%s < %s", $1, $3); $$ = lesser;}
        | ID LESSEROREQUAL ID                                   {char *lesserorequal=malloc(strlen($1) + strlen($3) + 10); sprintf(lesserorequal, "%s <= %s", $1, $3); $$ = lesserorequal;}
        | PLUS ID                                               {char *plus2=malloc(strlen($2) + 5); sprintf(plus2, "+ %s;", $2); $$ = plus2;}
        | MINUS ID                                              {char *minus2=malloc(strlen($2) + 5); sprintf(minus2,"- %s;", $2); $$ = minus2;}
        | MULT ID                                               {char *mult2=malloc(strlen($2) + 5); sprintf(mult2, "* %s;", $2); $$ = mult2;}
        | DIVIDE ID                                             {char *divide2=malloc(strlen($2) + 5); sprintf(divide2, "/ %s;", $2); $$ = divide2;}
        ;

%%

int main(){
    printf("#include <stdio.h>\n#include <stdlib.h>\n\n");
    yyparse();
    printf("int main(int argc, char *argv[]) {");
    printf("\n\tint provol2c = provolone2c(atoi(argv[1])");
    for (int i=2; i<qtdParametros+1; i++){
		printf(", atoi(argv[%d])", i);
    }
    printf(");");
    printf("\n\tprintf(\"Result -> %%d\\n\", provol2c);");
    printf("\n\treturn 0;\n}");
    

	return 0;
}
