//
//  ScientificNumber.h
//  Skywalker
//
//  Created by Zion on 8/9/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#ifndef __Skywalker__ScientificNumber__
#define __Skywalker__ScientificNumber__

class ScientificNumber
{
private:
    double value;
    long power;
public:
    static ScientificNumber Zero;
    ScientificNumber():value(0),power(0){};
    ScientificNumber(double value_,double power_):value(value_),power(power_){standardize();};
    ScientificNumber(const ScientificNumber &num):value(num.value),power(num.power){};
    ScientificNumber(double floatValue);
    
    double floatValue()const;
    ScientificNumber sqrt();
    
    bool operator <(const ScientificNumber &num)const;
    bool operator <=(const ScientificNumber &num)const;
    bool operator >(const ScientificNumber &num)const;
    bool operator >=(const ScientificNumber &num)const;
    bool operator ==(const ScientificNumber &num)const;
    
    ScientificNumber operator+(const ScientificNumber &num)const;
    ScientificNumber operator-(const ScientificNumber &num)const;
    ScientificNumber operator*(const ScientificNumber &num)const;
    ScientificNumber operator/(const ScientificNumber &num)const;
    ScientificNumber& operator+=(const ScientificNumber &num);
    ScientificNumber& operator-=(const ScientificNumber &num);
    ScientificNumber& operator*=(const ScientificNumber &num);
    ScientificNumber& operator/=(const ScientificNumber &num);
private:
    void standardize();
    
};

#endif /* defined(__Skywalker__ScientificNumber__) */
