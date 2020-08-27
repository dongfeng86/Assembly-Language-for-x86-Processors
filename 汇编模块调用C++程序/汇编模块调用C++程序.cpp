//演示C++程序和外部汇编模块之前的函数调用
#include<iostream>
#include <iomanip>
using namespace std;

extern "C" {
	//外部asm过程
	void DisplayTable();	
	void SetTextOutColor(unsigned color);
	//局部C++函数
	int askForInteger();
	void showInt(int value, int width);
}

//程序入口
int main()
{
	SetTextOutColor(0x1e);	//蓝底黄字
	DisplayTable();			//调用asm过程
	return 0;
}

//提示用户输入一个整数
int askForInteger()
{
	int n;
	cout << "Enter an integer between 1 and 90000:";
	cin >> n;
	return n;
}

//按特定宽度显示一个有符号整数
void showInt(int value, int width)
{
	cout << setw(width) << value;
}