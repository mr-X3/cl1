/*lex.l
%{
#include "y.tab.h"
%}

%%

\# {return HASH;}
\< {return LT;}
"include" {return KEYWORD;}
[a-zA-Z_]+*\.h {return HEADER_FILE;}
\> {return GT;}
"void"|"int"  {return DATATYPE;}
"main" {return MAIN;}
\( {return LB;}
\) {return RB;}
\{ {return OCB;}
[a-zA-Z_]+[a-zA-Z]* {return IDENTIFIER;}
printf\(.*\)";" {return STATEMENT;}
[0-9]+ {return NUMBER;}
\} {return CCB;}

[ \t\n] ;

%%
*/

/*yacccode.y
        %{
	#include<stdio.h>
%}
%token DATATYPE IDENTIFIER NUMBER RNUMBER EOL LB  RB COMMA HASH LT GT HEADER_FILE DEFINE OCB CCB STATEMENT MAIN KEYWORD

%%
	pgm: header main_fun { printf("\n Valid C Program\n"); }
	header: HASH KEYWORD LT HEADER_FILE GT 
		| ;
	main_fun: fun_name block main_fun
		| ;
	fun_name: DATATYPE MAIN LB RB 
		| ;
	
	block:  OCB stmt CCB
		| ;
	stmt:  STATEMENT stmt 
		| ;
	
	
%%

extern FILE *yyin;
extern char *yytext;

main()
{
	char fname[25];
	printf("\nEnter file name: ");
	scanf("%s",fname);
	yyin=fopen(fname,"r");
	while(!feof(yyin))
		yyparse();
	fclose(yyin);
	printf("\nString parsed successfully\n");
}

yyerror(char *s)
{
	printf("Error occured: %s: %s can not parse\n ",s,yytext);
	exit(1);
}

int yywrap()
{
	return 1;
}

*/

/*ip.txt:
#include<stdio.h>

void main()
{
	printf("\n Hello World");

	
}
*/

/*how to run:
1. lex progname.l
2. yacc progname.y
3. cc lex.yy.c y.tab.c -ll -ly -lm
4. ./a.out <ip.txt
*/

