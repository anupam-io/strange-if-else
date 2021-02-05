
%{
#include<stdio.h>
#include<ctype.h>
int yylex (void);
int yyerror (char  *);

%}

%token IF ELSE cL cR rL rR SEMICOLON OTHER DIGIT

%type <a> atom prog DIGIT
%union{
	int a;
}

%%

prog:
	prog atom{printf("Answer:%d \n", $2);}
|	prog SEMICOLON
|
;

atom:
	IF rL atom rR cL atom cR ELSE cL atom cR{if($3 != 0){$$ = $6;} else{$$ = $10;}}
|	IF rL atom rR cL atom cR{if($3 != 0){$$ = $6;} else{$$ = 0;}}
|	DIGIT
;

%%


int yyerror(char *s)
{
	printf("Error in .y file: %s\n", s);
}

int main()
{
    yyparse();
    return 0;
}
