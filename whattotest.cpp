// whattotest.cpp
#include <math.h>
#include<iostream>
using namespace std;

double squareRoot(const double a) {
    double b = sqrt(a);
    if(b != b) { // nan check
        return -1.0;
    }else{
        return sqrt(a);
    }
}
