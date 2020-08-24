int arraySum(int array[], int count);

int main()
{
	//long arError[1000000] = { 0 };	//这一句，会造成堆栈溢出
	int ar[] = { 1,2,3,4 };
	int sum = arraySum(ar, 4);

	return 0;
}