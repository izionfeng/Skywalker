//
//  MassObject.h
//  Skywalker
//
//  Created by Zion on 8/8/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#include "MathDef.h"

class MassObject
{
public:
    Vector forceVector;
    Vector velocityVector;
private:
    ScientificNumber radius;
    ScientificNumber mass;
    ScientificNumber gravitationRadius;//引力半径
    ScientificNumber gravity;//重力加速度
    
    
public:
    ~MassObject();
    MassObject();
    MassObject(const MassObject &obj);
    void collideWithMassObject(const MassObject &obj);
    void setRadius(const ScientificNumber& radius);
    void setMass(const ScientificNumber& mass);
    const ScientificNumber getRadius()const;
    const ScientificNumber getMass()const;
    const ScientificNumber getGravitationRadius()const;
    const ScientificNumber getGravity()const;
    void updateVelocityAfterTimeInterval(const double timeInterval);
    
private:
    void calculateGravitationRadius();
    void calculateGravity();
};
