%{
   #include "y.tab.h"
   extern char yyval;    //This is a global variable used to store the value of any token.
%}

NUMBER [0-9]+
LETTER [a-zA-Z]+

%%
{NUMBER} {yylval.sym=(char)yytext[0]; return NUMBER;}
{LETTER} {yylval.sym=(char)yytext[0];return LETTER;}

\n {return 0;}
.  {return yytext[0];}

%%

/*yacc.y
%{                                   /*Declaration Section Begins  */

  #include<stdio.h>                  //Header Files
  #include<string.h>
  #include<stdlib.h>

void qudraple();                     //Function call
char AddToTable(char ,char, char);   //Function call

  int ind=0;                         // Data type 
  char temp='A';

  struct incod                       //Structure declaration
  {
	char opd1;
	char opd2;
	char opr;
  };
%}                                  /*Declaration Section Ends */

%union
{
 char sym;
}

%token <sym> LETTER NUMBER   //Used to declare the tokens used in the grammar.
%type <sym> expr             //Used to create the type of a variable.
%left '-''+'                 //Used to assign the left to right associativity to operators.
%right '*''/'                //Used to assign the right to left associativity to operators.


%%          //Rules & Actions Begins

statement: LETTER '=' expr ';' {AddToTable((char)$1,(char)$3,'=');}
           | expr ';'
	   ;

expr: expr '+' expr {$$ = AddToTable((char)$1,(char)$3,'+');}
      | expr '-' expr {$$ = AddToTable((char)$1,(char)$3,'-');}
      | expr '*' expr {$$ = AddToTable((char)$1,(char)$3,'*');}
      | expr '/' expr {$$ = AddToTable((char)$1,(char)$3,'/');}
      | '(' expr ')' {$$ = (char)$2;}
      | NUMBER {$$ = (char)$1;}
      | LETTER {$$ = (char)$1;}
      ;

%%        //Rules & Actions Ends

/*Auxiliary Function Begins....C function Definition, Main Fun, yyrawp & yyerror */

struct incod code[20];
int id=0;


/*-------------------------------------*/
char AddToTable(char opd1,char opd2,char opr)
{
code[ind].opd1=opd1;
code[ind].opd2=opd2;
code[ind].opr=opr;
ind++;
//temp++;
printf("\n ind: %d\tcode[ind].opd1: %c\tcode[ind].opd2: %c\tcode[ind].opr: %c\ttemp: %c",ind,opd1,opd2,opr,temp);
return temp++;
}

/*---------------------------------*/

void quadraple()  //3 Address code
{
    int cnt=0;
    printf("\n\n\t QUADRUPLE CODE\n\n");
    printf("\tIndex\tOpr\tOpd1\tOpd2\tResult\n");
	while(cnt<ind)
	{
	
          printf("\t%d",id);           
          printf("\t%c",code[cnt].opr);
          
           if(isalpha(code[cnt].opd1))
		printf("\t%c",code[cnt].opd1);
        	else
		{
				
			printf("\t%c",temp);
		}
	
		if(isalpha(code[cnt].opd2))
			printf("\t%c",code[cnt].opd2);
		else
		{
							
			printf("\t%c",temp);
		}
		
		printf("\t%c",temp);
		printf("\n");
		cnt++;
		temp++;
		id++;
	
	}
}


main()                               //MAin function 
{
 	printf("\nEnter the Expression: ");
 	yyparse();
	temp='A';
	quadraple();

}

yywrap()   
/* This function is called when end of file (or input) is encountered.
If yywrap() returns 0, the scanner continues scanning, while if it
returns 1 the scanner returns a zero token to report the end of file.  */
{
 	return 1;
}

yyerror(char *s)                  //for displaying any error message
{
  	printf("\n ERROR: %s\n",s);
  	exit(0);
}

*/
/*re: a=((b+c)*(d/e))
*/

/*how to run
lex a5.l
yacc -d yacc.y
gcc lex.yy.c y.tab.c -ll -ly 
./a.out 
 */
