%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>

%}

%%

[0-9]+ {yylval = atoi(yytext); return NUMBER;} //Recognize numbers
"+" {return '+';} //Recognize addition
"-" {return '-';} //Recognize subtraction
"*" {return '*';} //Recognize multipication
"/" {return '/';} //Recognize division
"(" {return '(';} //Recognize left parenthesis
")" {return ')';} // Recognize right parenthesis
\n  {return 0;} //Signal end of expression to Yacc
[\t] {/* Ignore spaces and tabs*/}


%%

int yywrap() {return 1;}






