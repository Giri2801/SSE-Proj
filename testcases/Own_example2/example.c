#include <stdio.h>
#include <string.h>

void encrypt(char str[]){
	char key[10]="key";
	int a,b,d,e,c,f;
	for(int i=0;i<10;i++){
		a = str[i];
		b = key[i%3] ;
		c = key[i%2];
		d = b + c;
		f = a | 3;
		e = f^d;
		str[i] = e;
	}
	b = 0;
	c = 0;
	d = 0;
	for(int i=0;i<10;i++){
		key[i]='\0';
	}
}

int main(){
	char arr[]="tobeencryp";
	encrypt(arr);
	printf("%s",arr);
}

