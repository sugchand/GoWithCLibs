#include <string.h>
#include <stdio.h>
#define TRUE 1
#define FALSE 0

/* Function to check if a a string paliandrome or not. */
int isPaliandrome(char *a) {
	int len;
	int i,j;
	if (a == NULL) {
		return -1;
	}
	len = strlen(a);
	if (len == 0 || len == 1) {
		return TRUE;
	}
	for(i = 0, j = len-1; i <= len/2 && j >= len/2; i++, j--) {
		if (a[i] != a[j]) {
			return FALSE;
		}
	}
	return TRUE;
}
