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
int l, result;

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
	l = strlen(in_name);
	if (l == 0)
	{
		goto input;
	}
	else if (l == 1 && in_name[0] == 'q')
	{
		goto over;
	}
find:
	find();
process:
	if (result == 0)
	{
		printf_s("%s\n", msg2);
		goto input;
	}
	calc_avg();
	printf("%s's score is %d\n", in_name, score);
	printf("%s's level is %c\n", in_name, LEVEL(score));
	printf("\nPress any key to print ALL students' scores and levels...\n");
	getch();
calc_avg_all:
	calc_avg_all();
	for (int i = 0; i < N; ++i)
	{
		printf("%d:\n%s's average score is %d\n", i, BUF[i].name, BUF[i].avg);
		printf("%s's level is %c\n\n", BUF[i].name, LEVEL(BUF[i].avg));
	}
over:
	printf_s("%s\n", msg3);
	return 0;
}