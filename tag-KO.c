#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define LEN 1024

struct options {
	int help;
	int stat;
	int check;
	char *input;
};

void help(void){
	printf("USAGE:\n");
	printf(" tag-KO [-h] [-s] [-c] if=<input file>.\n");
	printf("  -h : help.\n");
	printf("  -s : stat.\n");
	printf("  -c : check args.\n");
	printf("  if : file name (len < 1024).\n");
}

void status(void){
	printf("STATUS:\n");
	printf(" this program is template.\n");
}

struct options *alloc_options(void){
	struct options *p;
	if((p = malloc(sizeof(struct options) * 1)) == NULL){
		printf("failed : malloc() in alloc_options().\n");
		exit(1);
	}
	if(((*p).input = malloc(sizeof(char) * LEN)) == NULL){
		printf("failed : malloc() in alloc_options().\n");
		exit(1);
	}
	return(p);
}

void init_options(struct options *opt){
	(*opt).help = 0;
	(*opt).stat = 0;
	(*opt).check = 0;
	(*opt).input[0] = '\0';
}

void get_options(int optc, char **optv, struct options *opt){
	int i = 0;
	for(i=0;i<optc;i++){
		if(strcmp(optv[i],"-h") == 0){
			(*opt).help = 1;
		}else if(strcmp(optv[i],"-s") == 0){
			(*opt).stat = 1;
		}else if(strcmp(optv[i],"-c") == 0){
			(*opt).check = 1;
		}else if(strncmp(optv[i],"if=",3) == 0){
			sscanf(optv[i],"if=%s",(*opt).input);
		}
	}
}

void check_options(struct options *opt){
	printf("OPTIONS:\n");
	printf(" opt.input:%s:\n",(*opt).input);
}

int main(int argc, char **argv){
	struct options *opt;
	int ie = 0;
	FILE *IN;
	int c = 0;
	int tagstart = 0;
	int flag = 0;
	opt = alloc_options();
	init_options(opt);
	get_options(argc-1, argv+1, opt);
	if(argc == 1){
		(*opt).help = 1;
	}
	if((*opt).help == 1){
		help();
		ie = 1;
	}
	if((*opt).stat == 1){
		status();
		ie = 1;
	}
	if((*opt).check == 1){
		check_options(opt);
		ie = 1;
	}
	if(ie == 1){
		exit(0);
	}
	/* (* file open while-put close */
	if((IN = fopen((*opt).input,"r")) == NULL){
		perror((*opt).input);
		exit(1);
	}
	while((c = fgetc(IN)) != EOF){
		if(c == '<'){
			flag = 1;
			tagstart = 1;
		}else if(c == '>'){
			flag = 0;
			tagstart = 0;
		}else{
			tagstart = 0;
		}
		if(flag == 1 && tagstart == 1){
			putchar('<');
		}else if(flag == 1 && tagstart == 0){
			putchar(' ');
		}else if(flag == 0 && tagstart == 1){
			putchar(c);
		}else if(flag == 0 && tagstart == 0){
			putchar(c);
		}
	}
	fclose(IN);
	/* *) */

	return(0);
}
