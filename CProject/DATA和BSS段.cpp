#include <stdio.h>
#include <iostream>
//������������⣬ԭ����Ϊδ��ʼ����ȫ�ֱ��������_BSS���У���ʵ������������
//1.�������C���������룬��δ��ʼ�����ѳ�ʼ����ȫ�ֱ���ȫ������_DATA�У�����δ��ʼ����ȫ�ֱ���ֵȫ��Ϊ0000h��
//2.�������C++���������룬��δ��ʼ����ȫ�ֱ�������_BSS�У���ʼ����ȫ�ֱ�������_DATA����
//3.���ȫ�ֱ�����static���Σ�������C��������Ҳ�����_BSS��
long m[1000];

int array[] = { 10,20,30,40,50 };

int main()
{
	char* str = "hello,world";			//�ַ����������ģ��𰸣�CONST����
	const int kConst = 20;				//�洢���ģ�������һ�����ų��������Ǻ궨����
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