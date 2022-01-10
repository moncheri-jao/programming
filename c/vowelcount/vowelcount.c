#include <string.h>
#include <stdio.h>
#include <stdint.h>
int get_count(const char *s) {
        int count, i = 0;
	int len = strlen(s);
	while (i < len) {
	    if (s[i] == *(int8_t*)"a" || s[i] == *(int8_t*)"e" || s[i] == *(int8_t*)"i" || s[i] == *(int8_t*)"o" || s[i] == *(int8_t*)"u"){
		count++;
	    }
	    i++;
	}
	printf("%d\n",len);
        return(count);
}
int main () {
        int count = 0;
	count = get_count("");
        printf("vowels: %d\n",count);
        return 0;
}
