%{

%}
quotes [""'']
comment ("//".*)
comment2 ("/*".*"*/")
%%

public|private|protected {printf("The %s : is a Access specifier\n",yytext);}
class|System|out|println|void|main|static {printf("The %s : is a Keyword\n",yytext);}
int|double|char|String {printf("The %s : is a DataType\n",yytext);}
[A-Z]+[a-z]* {printf("The %s : is a Class-Name\n",yytext);}
[A-Z]*[a-z]+ {printf("The %s : is a Variable\n",yytext);}
"+"|"-"|"<"|">"|"!"|"%"|"&"|"^"|"*"|"?"|"=" {printf("The %s : is a Operator\n",yytext);}
"["|"]"|"{"|"}"|"("|")"  {printf("The %s : is a Bracket\n",yytext);}
","|"."|":"|";" {printf("The %s : is a Delimiter\n",yytext);}
[0-9]+ {printf("The %s : is a Number\n",yytext);}
{quotes} {printf("The %s : is a Quote\n",yytext);}
{comment} {printf("The %s : is a Single line Comment\n",yytext);}
{comment2} {printf("The %s : is a Multiline Comment\n",yytext);}
%%
main(argc,argv)
int argc;
char **argv;
{
	if(argc >1){
		FILE *file;
		file=fopen(argv[1],"r");
		if(!file){
			fprintf(stderr,"Could not open %s\n",argv[1]);
			exit(1);
		}
		yyin=file;
	}
	yylex();

	
}
int yywrap(){
 return 1;
}


