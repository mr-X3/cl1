%{
	/* Program for lexical analyzer for c language  */

	#include<string.h>
	int insert(char str[]);
	FILE *fin, *fout;
	char in_file[25], out_file[25];
	unsigned int n=1, cnt=0, i;
	struct st
	{
		char name[25];
		int val;
	}*symbol[50];
%}
headerfile ("#include<"[a-z]+".h>"[\t]*[\n]+)
datatype ([\t]*"int"|"float"|"char")
keyword ("if"|"else"|"then"|"do"|"while"|"return"|"void"|"for")
inbuilt "getch"|"clrscr"|"scanf(".*");"[\n]+|"printf(".*");"[\n]+
operator ("+"|"-"|"*"|"/")
comment ("/*"[\t\n]*.*[\n]*.*[\t\n]*.*"*/")
digit [0-9]+
identifier [_a-zA-Z]+[_a-zA-Z0-9]*

mainfun ("main()"[\t\n]+)
relation ("<"|">"|"="|"<="|">="|"!=")
smallbracket "("|")"
curlybracket "{"|"}"
squarebracket "["|"]"
punctuation (";"|"!"|"@"|"~"|"#"|"$"|"&"|"'")


%%

[ \t] ;    /*do nothing for white sapce and tab */
[ \n]*
{
	fprintf(yyout,"\n"); 
	n++;
}


{headerfile} {
		fprintf(yyout,"\n Header file declaration: \t\t%s",yytext);
		printf("\n%d\t Header File: \t\t%s", n,yytext);
	      }
{datatype} {
		fprintf(yyout,"\n Datatype: \t\t%s",yytext);
		printf("\n%d\t Data Type: \t\t%s", n,yytext);
	      }
{keyword} {
		fprintf(yyout,"\n Keyword: \t\t%s",yytext);
		printf("\n%d\t Keyword: \t\t%s", n,yytext);
	      }
{inbuilt} {
		fprintf(yyout,"\n inbulit: \t\t%s",yytext);
		printf("\n%d\t inbuilt: \t\t%s", n,yytext);
	      }
{operator} {
		fprintf(yyout,"\n Operator: \t\t%s",yytext);
		printf("\n%d\t Operator: \t\t%s", n,yytext);
	      }
{comment} {
		fprintf(yyout,"\n comment: \t\t%s",yytext);
		printf("\n%d\t Comment: \t\t%s", n,yytext);
	      }
{digit} {
		fprintf(yyout,"\n Digit: \t\t%s",yytext);
		printf("\n%d\t Digit: \t\t%s", n,yytext);
	      }
{identifier} {
		fprintf(yyout,"\n Identifier: \t\t%s",yytext);
		printf("\n%d\t Identifier: \t\t%s \t\t\t\t%d", n,yytext,insert(yytext));
	      }
{mainfun} {
		fprintf(yyout,"\n Mainfun: \t\t%s",yytext);
		printf("\n%d\t Main fun: \t\t%s", n,yytext);
	      }
{relation} {
		fprintf(yyout,"\n Relational Op: \t\t%s",yytext);
		printf("\n%d\t Ralational op: \t\t%s", n,yytext);
	      }
{smallbracket} {
		fprintf(yyout,"\n smallbracket: \t\t%s",yytext);
		printf("\n%d\t smallbracket: \t\t%s", n,yytext);
	      }
{curlybracket} {
		fprintf(yyout,"\n curlybracket: \t\t%s",yytext);
		printf("\n%d\t curlybracket: \t\t%s", n,yytext);
	    }
{squarebracket} {
		fprintf(yyout,"\n squarebracket: \t\t%s",yytext);
		printf("\n%d\t squarebarcket: \t\t%s", n,yytext);
	      }
{punctuation} {
		fprintf(yyout,"\n punctuation: \t\t%s",yytext);
		printf("\n%d\t punctuation: \t\t%s", n,yytext);
	      }
[0-9]+[_a-zA-Z]+[_a-zA-Z0-9]*
		{
		fprintf(yyout,"\n Identifier error: \t\t%s",yytext);
		
		}

%%

main()
{
	printf("\n Enter input file name: ");
	scanf("%s", in_file);
	
	printf("\n Enter Output file name: ");
	scanf("%s", out_file);
	
	fin = fopen(in_file, "r");
	if(!fin)
	{
		fprintf(stderr,"WARNING: Error in opening file :- %s\n",in_file);
		exit(1);
	}
	fout = fopen(out_file, "w");

	yyin = fin;
	yyout = fout;

	printf("\n__________________________________________________________________________");
	printf("\nLINE \t\tLEXEME\t\t\tTOKEN\t\t\tATTRIBUTE");
	printf("\n__________________________________________________________________________");
	
	yylex();
	
	printf("\n__________________________________________________________________________");
	printf("\n\t\t\t\tSYMBOL TABLE");
	printf("\n__________________________________________________________________________");
	printf("\n\t\tNAME\t\t\t\tVALUE");
	printf("\n__________________________________________________________________________");
	
	for(i=0;i<cnt;i++)
	{
		printf("\n\t\t%s\t\t\t\t%d",symbol[i]->name, symbol[i]->val);
		printf("\n__________________________________________________________________________\n");
	}
	
	fclose(fin);
	fclose(fout);
}

int insert(char str[])
{
	int i;
	for(i=0;i<cnt;i++)
	{
		if(strcmp(str,symbol[i]->name)==0)
		return i;
	}
	
	symbol[cnt]=(struct st*)malloc(sizeof(struct st));
	strcpy(symbol[cnt]->name,str);
	symbol[cnt]->val=0;
	return cnt++;
}

/*ip.txt

#include<stdio.h>
#include<conio.h>
void main()
{
int a=2,b=5,xyz;
char ans;
clrscr();
if(a>b)
{
	printf("a is greater no.");
}
else
{
	printf("b is greater no.");
}


getch();

}

