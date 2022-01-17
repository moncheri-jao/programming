#include <stdio.h>
#include <stdlib.h>

int main(void) {
	FILE* exe;
	exe = fopen("wrong.exe", "r+");
        if (exe == NULL) {
                system("gcc -Wall -pedantic -o wrong.exe wrong.c");
        }
        fclose(exe);
        printf("I'm completely wrong hello\n");
//        int x = 1;
//        printf("%s",x);
}
