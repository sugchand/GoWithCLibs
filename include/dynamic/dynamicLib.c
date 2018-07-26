#include <string.h>


#define TRUE 1
#define FALSE 0

/* Check if a character is repeating in a string
 * OPtimized to find it in O(n/2)
 * */
int isCharRepeatInString(char *s, char ch) {
	int len;
	int found = 0;
	int i, j;
	if (s == NULL) {
		return -1;
	}
	len = strlen(s);
	if (len == 0 || len == 1){
		return TRUE;
	}
	for (i = 0, j = len - 1; i <= len/2 && j >= len/2; i++,j--) {
		if (s[i] != ch && s[j] != ch) {
			//Continue as is, no match for the character.
			continue;
		}
		else {
			found++;
		}
		if (found >= 2) {
			return TRUE;
		}
	}
	return FALSE;
}
