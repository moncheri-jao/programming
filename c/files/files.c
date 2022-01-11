#include <stdio.h> //library containing FILE operation functions: fopen, fscanf, fread, fgetc, fprintf, fputc, fwrite

// FILE opening options (fopen):
// -----------------------------------.
// r		|	read-only
// w		|	write-only
// a		|	append-only
// r+/w+	|	read-write
// rb		|	read-only bin
// wb		|	write-only bin
int main() {
    FILE *filepointer; //generate a pointer to file, aka _stream_
    filepointer = fopen("helloworld.dat","r"); //assigns FILE pointer to file element (_record_)
    return 0;
}
