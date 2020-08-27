#include <stdio.h>
#include <iostream>
//这里面存在问题，原来以为未初始化的全局变量会放在_BSS段中，可实际上是这样：
//1.如果采用C编译器编译，则未初始化和已初始化的全局变量全都放在_DATA中，但是未初始化的全局变量值全部为0000h。
//2.如果采用C++编译器编译，则未初始化的全局变量放在_BSS中，初始化的全局变量放在_DATA段中
//3.如果全局变量用static修饰，即便用C编译器，也会放在_BSS中
long m[1000];

int array[] = { 10,20,30,40,50 };

int main()
{
	char* str = "hello,world";			//字符串存在在哪？答案：CONST段中
	const int kConst = 20;				//存储在哪？创造了一个符号常量，就是宏定义了
	static int s_inner;
	long sum = 0;
	for (int i = 0; i < 10; i++)
		sum += array[i];
	sum += s_inner;
	sum += m[2] + kConst;
	return 0;
	std::cout << "helleo";
	printf(_T("helel"));
}