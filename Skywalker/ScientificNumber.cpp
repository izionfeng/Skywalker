//
//  ScientificNumber.cpp
//  Skywalker
//
//  Created by Zion on 8/9/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#include "ScientificNumber.h"
#include <math.h>

ScientificNumber ScientificNumber::Zero=ScientificNumber(0,0);

void ScientificNumber::standardize()
{
    while ((0<value&&value<1)||(-1<value&&value<0))
    {
        value*=10;
        power--;
    }
    while (value>=10||value<=-10)
    {
        value/=10;
        power++;
    }
}

ScientificNumber::ScientificNumber(double floatValue)
:value(floatValue),power(0)
{
    standardize();
}

double ScientificNumber::floatValue()const
{
    return value*pow(10, power);
}

ScientificNumber ScientificNumber::sqrt()
{
    ScientificNumber num_new(*this);
    if (1==(num_new.power&0x1))//奇数
    {
        num_new.value*=10;
        --num_new.power;
    }
    num_new.value=sqrtl(num_new.value);
    num_new.power/=2;
    num_new.standardize();
    return num_new;
}

bool ScientificNumber::operator<(const ScientificNumber &num)const
{
    return (power<num.power||(power==num.power&&value<num.value));
}

bool ScientificNumber::operator<=(const ScientificNumber &num)const
{
    return (power<num.power||(power==num.power&&value<=num.value));
}

bool ScientificNumber::operator>(const ScientificNumber &num)const
{
    return (power>num.power||(power==num.power&&value>num.value));
}

bool ScientificNumber::operator>=(const ScientificNumber &num)const
{
    return (power>num.power||(power==num.power&&value>=num.value));
}

bool ScientificNumber::operator==(const ScientificNumber &num)const
{
    return (power==num.power&&value==num.value);
}

ScientificNumber ScientificNumber::operator+(const ScientificNumber &num)const
{
    ScientificNumber num_new(*this);
    num_new+=num;
    return num_new;
}

ScientificNumber ScientificNumber::operator-(const ScientificNumber &num)const
{
    ScientificNumber num_new(*this);
    num_new-=num;
    return num_new;
}

ScientificNumber ScientificNumber::operator*(const ScientificNumber &num)const
{
    ScientificNumber num_new(*this);
    num_new*=num;
    return num_new;
}

ScientificNumber ScientificNumber::operator/(const ScientificNumber &num)const
{
    ScientificNumber num_new(*this);
    num_new/=num;
    return num_new;
}

ScientificNumber& ScientificNumber::operator+=(const ScientificNumber &num)
{
    double v_min,p_min;
    if (power<num.power)
    {
        v_min=value;
        p_min=power;
        value=num.value;
        power=num.power;
    }
    else
    {
        v_min=num.value;
        p_min=num.power;
    }
    while (p_min<power)
    {
        v_min/=10;
        ++p_min;
    }
    value+=v_min;
    standardize();
    return *this;
}

ScientificNumber& ScientificNumber::operator-=(const ScientificNumber &num)
{
    double v_min,p_min;
    if (power<num.power)
    {
        v_min=value;
        p_min=power;
        value=num.value;
        power=num.power;
    }
    else
    {
        v_min=num.value;
        p_min=num.power;
    }
    while (p_min<power)
    {
        v_min/=10;
        ++p_min;
    }
    value-=v_min;
    standardize();
    return *this;
 
}

ScientificNumber& ScientificNumber::operator*=(const ScientificNumber &num)
{
    value*=num.value;
    power+=num.power;
    standardize();
    return *this;
}

ScientificNumber& ScientificNumber::operator/=(const ScientificNumber &num)
{
    value/=num.value;
    power-=num.power;
    standardize();
    return *this;
}



