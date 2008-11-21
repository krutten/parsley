%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "kstring.h"

#define YYSTYPE char *

int yylex (void);
void yyerror (char const *);

void prepare_parse(char*);
void cleanup_parse(void);

int yyparse(void);
void myparse(char*);
  
%}

%glr-parser
%token_table

%token OTHER

%%

main:
  | OTHER
  | OTHER main { $$ = astrcat($1, $2); }
  ;

%%

void myparse(char* string){
  prepare_parse(string);
  yyparse();
  cleanup_parse();
}

void yyerror (const char * s) {
  printf("%s\n", s);
  exit(1);
}