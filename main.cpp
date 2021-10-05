#include<iostream>
using namespace std;

double squareRoot(const double a);

int main()
{
  double sq,n;
  cout<<"Enter any number: ";
  cin>>n;
  sq=squareRoot(n);
  cout<<"\nSquare root of "<<n<<" is "<<sq<<"\n";
  return 0;
}