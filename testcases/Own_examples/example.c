#include <stdio.h>
#include <string.h>

void encrypt(char str[]){
	char key[10]="key";
	int a,b,d,e,f,c,g;
	for(int i=0;i<10;i++){
		a = str[i];
		b = key[i%3] ;
		c = a^b;
		str[i] = c;
	}
	b = 0;
	c = 0;
	for(int i=0;i<10;i++){
		key[i]='\0';
	}
}

int main(){
	char arr[]="tobeencryp";
	encrypt(arr);
	printf("%s",arr);
}

