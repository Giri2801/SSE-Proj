#include <stdio.h>
#include <string.h>

void encrypt(char str[]){
	char key[10]="key";
	int a,b,e,f,g;
	char c[10],d[10];
	for(int i=0;i<10;i++){
		a = str[i];
		b = key[i%3] ;
		c[i] = a^b;
		str[i] = c[i];
		d[i] = c[i];
	}
	b = 0;
}

int main(){
	char arr[]="tobeencryp";
	encrypt(arr);
	printf("%s",arr);
}

