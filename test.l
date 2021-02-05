%{

#include <stdio.h>
#include <string.h>
#include "test.tab.h"
void showError();
%}

digit       [0-9]+
if          "if"
else        "else"
cleft       "{"
cright      "}"
rleft       "("
rright      ")"


%%
{if}            {return (IF);}
{else}          {return (ELSE);}
{cleft}         {return (cL);}
{cright}        {return (cR);}
{rleft}         {return (rL);}
{rright}        {return (rR);}
{digit}         {yylval.a = atoi(yytext);  return (DIGIT);}
";"             {return (SEMICOLON);}
" "             {}
"\n"            {}
.      		    { showError(); return(OTHER);}
%%

void showError(){printf("Other input");}