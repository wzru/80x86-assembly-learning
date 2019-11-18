#include <string.h>
#include <stdio.h>

#define SIZE 10
#define N 100
#define LEVEL(score) ((score) >= 90 ? 'A' : (score) >= 80 ? 'B' : (score) >= 70 ? 'C' : (score) >= 60 ? 'D' : 'F')

typedef unsigned char BYTE;
typedef struct Data
{
	char name[SIZE + 1];
	BYTE a, b, c, avg;
} Data;

Data BUF[N] =
{
	{"ZhangSan", 100, 85, 80},
	{"LiSi", 80, 85, 80},
	{"WangZR", 85, 85, 100}
};
const char* msg1 = "Please input the name of student:",
* msg2 = "NOT FOUND!",
* msg3 = "Program EXIT";
char in_name[SIZE + 1];
BYTE score;
Data* poin;

int main()
{
initialize:
	for (int i = 3; i < N; ++i)//初始化造数据
	{
		strcpy_s(BUF[i].name, SIZE, "TempValue");
		BUF[i].a = 80, BUF[i].b = 90, BUF[i].c = 95;
	}
input:
	printf("%s\n", msg1);
	gets_s(in_name, SIZE);
	int l = strlen(in_name);
	if (l == 0)
	{
		goto input;
	}
	else if (l == 1 && in_name[0] == 'q')
	{
		goto over;
	}
	int result;
find:
	__asm
	{
		mov ecx, N;
		mov ebx, offset BUF;
	find_iterator:
		lea esi, [ebx];
		mov edi, offset in_name;
		push bx;
		push cx;
		mov cl, byte ptr l;
		xor ch, ch;
	strcmp_iterator:
		mov dl, [esi];
		cmp dl, [edi];
		jnz next;
		inc si;
		inc di;
		loop strcmp_iterator;
		jmp found;
	next:
		pop cx;
		pop bx;
		add bx, 15;
		loop find_iterator;
	not_found:
    	cmp [esi], 0
    	jnz not_found
		mov result, 0;
		jmp process;
	found:
		mov poin, ebx;
		mov result, 1;
		pop cx;
		pop bx;
	}
process:
	if (result == 0)
	{
		printf_s("%s\n", msg2);
		goto input;
	}
	__asm
	{
		mov ebx, dword ptr poin;
		xor ah, ah;
		mov al, [ebx + 11]; //A成绩
		shl ax, 1;
		add al, [ebx + 12];
		adc ah, 0; //处理1字节无法存的情况
		shl ax, 1;
		add al, [ebx + 13]; //这里相当算((((A << 1) + B) << 1) + C) / 7
		adc ah, 0;
		mov dl, 7;
		div dl;
		mov score, al;
	}
	printf("%s's score is %d\n", in_name, score);
	printf("%s's level is %c\n", in_name, LEVEL(score));
calc_avg_all:
	__asm
	{
		mov Ebx, offset BUF;
		mov ecx, N;
	calc_avg_iterator:
		xor ah, ah;
		mov al, [ebx + 11]; //A成绩
		shl ax, 1;
		add al, [ebx + 12];
		adc ah, 0; //处理1字节无法存储的情况
		shl ax, 1;
		add al, [ebx + 13]; //这里相当于算((((A << 1) + B) << 1) + C) / 7
		adc ah, 0;
		mov dl, 7;
		div dl;
		mov[ebx + 14], al;
		add bx, 15;
		loop calc_avg_iterator;
	}
	for (int i = 0; i < N; ++i)
	{
		printf("%d:\n%s's average score is %d\n", i, BUF[i].name, BUF[i].avg);
		printf("%s's level is %c\n\n", BUF[i].name, LEVEL(BUF[i].avg));
	}
over:
	printf_s("%s\n", msg3);
	return 0;
}