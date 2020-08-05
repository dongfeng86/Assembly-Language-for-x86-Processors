int add(int x, int y);

int main()
{
	int x = 5;
	int y = 6;
	int m = add(x, y);
	return 0;
}

int add(int x, int y)
{
	int m = 2 * x;
	int n = 3 * y;
	return m + n;
}