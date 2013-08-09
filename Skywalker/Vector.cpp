//
//  Vector.cpp
//  Skywalker
//
//  Created by Zion on 8/9/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#include "Vector.h"
#include <math.h>
#include <iostream>

Vector Vector::Zero=Vector(0,0);

Vector::~Vector()
{
    delete x;
    delete y;
    x=nullptr;
    y=nullptr;
}

const ScientificNumber Vector::length()
{
    return ((*x)*(*x)+(*y)*(*y)).sqrt();
}

void Vector::setLength(const ScientificNumber &len)
{
    ScientificNumber len_old=length();
    (*this)*=(len/len_old);
}

void Vector::addLength(const ScientificNumber &len)
{
    ScientificNumber len_old=length();
    (*this)*=((len_old+len)/len_old);
}

Vector Vector::operator+(const Vector &vec)
{
    Vector vec_new(*this);
    vec_new+=vec;
    return vec_new;
}

Vector Vector::operator-(const Vector &vec)
{
    Vector vec_new(*this);
    vec_new-=vec;
    return vec_new;
}

Vector Vector::operator*(const ScientificNumber &num)
{
    Vector vec_new(*this);
    vec_new*=num;
    return vec_new;
}

Vector Vector::operator/(const ScientificNumber &num)
{
    Vector vec_new(*this);
    vec_new/=num;
    return vec_new;
}

Vector& Vector::operator+=(const Vector &vec)
{
    (*x)+=(*vec.x);
    (*y)+=(*vec.y);
    return *this;
}

Vector& Vector::operator-=(const Vector &vec)
{
    (*x)-=(*vec.x);
    (*y)-=(*vec.y);
    return *this;
}

Vector& Vector::operator*=(const ScientificNumber &num)
{
    (*x)*=num;
    (*y)*=num;
    return *this;
}

Vector& Vector::operator/=(const ScientificNumber &num)
{
    (*x)/=num;
    (*y)/=num;
    return *this;
}








