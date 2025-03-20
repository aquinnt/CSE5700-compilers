%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s); //Function to handle syntax errors
int yylex(); // Declare the lexical analyzer
%}

%token NUMBER // Declare token for numbers

%left '+' '-'
%left '*' '/'

%%

expr: expr '+' term {printf("Addition\n");}
 | expr '-' term {printf("Subtraction\n");}
 |term;

term: term '*' factor {printf("Multiplication\n");}
 | term '/' factor {printf("Division\n");}
 | factor;

factor:'('expr')' {printf("Parentheses\n");}
 |NUMBER;

%%

//Function to print syntax errors

void yyerror(const char *s) {
 fprintf(stderr, "Error: %s\n",s);
}

//Main funtion to process input continuously

int main(){

 while(1) {
  printf("Enter expression: ");
  yyparse(); //parse input and return after each line
}
 return 0;
}
