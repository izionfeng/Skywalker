//
//  Vector.h
//  Skywalker
//
//  Created by Zion on 8/9/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#ifndef __Skywalker__Vector__
#define __Skywalker__Vector__

#include "ScientificNumber.h"

class Vector
{
public:
    ScientificNumber x;
    ScientificNumber y;
    static Vector Zero;
    ~Vector();
    Vector():x(0),y(0){};
    Vector(const ScientificNumber &x_,const ScientificNumber &y_):x(x_),y(y_){};
    Vector(const Vector &vec):x(vec.x),y(vec.y){};
    
    const ScientificNumber length();
    void addLength(const ScientificNumber &len);
    void setLength(const ScientificNumber &len);
    
    Vector operator+(const Vector &vec)const;
    Vector operator-(const Vector &vec)const;
    Vector operator*(const ScientificNumber &num)const;
    Vector operator/(const ScientificNumber &num)const;
    Vector& operator+=(const Vector &vec);
    Vector& operator-=(const Vector &vec);
    Vector& operator*=(const ScientificNumber &num);
    Vector& operator/=(const ScientificNumber &num);
    
};


#endif /* defined(__Skywalker__Vector__) */
