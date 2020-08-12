void makeArrary();
int main()
{
	int m = 3;
	int* p = new int;
	*p = 8;
	delete p;
	makeArrary();
	return 0;
}

void makeArrary()
{
	char myString[30];
	for (int i = 0; i < 30; i++)
	{
		myString[i] = '*';
	}
}