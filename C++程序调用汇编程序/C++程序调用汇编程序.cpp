#include<iostream>
#include <time.h>
#include "indexof.h"

using namespace std;

int main()
{
	const unsigned ARRAY_SIZE = 100000;
	const unsigned LOOP_SIZE = 100000;
	const char* boolstr[] = { "false","true" };

	long array[ARRAY_SIZE];
	for (unsigned i = 0; i < ARRAY_SIZE; i++)
	{
		array[i] = rand();
	}

	long searchVal;
	time_t startTime, endTime;
	cout << "enter an integer value to find:";
	cin >> searchVal;
	cout << "Please vait...\n";

	//测试汇编函数
	time(&startTime);
	int count = 0;

	for (unsigned n = 0; n < LOOP_SIZE; n++)
		count = IndexOf(searchVal, array, ARRAY_SIZE);

	bool found = count != -1;

	time(&endTime);
	cout << "Elapsed asm time:" << long(endTime - startTime)
		<< " seconds. Found= " << boolstr[found] << endl;

	return 0;
}