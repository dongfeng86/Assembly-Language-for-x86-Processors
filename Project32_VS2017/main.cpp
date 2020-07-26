void makeArrary();
int main()
{
	int m = 3;
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