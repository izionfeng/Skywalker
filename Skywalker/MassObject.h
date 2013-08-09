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
    Vector *forceVector;
    Vector *velocityVector;
private:
    ScientificNumber *radius;
    ScientificNumber *mass;
    ScientificNumber *gravitationRadius;//引力半径
    ScientificNumber *gravity;//重力加速度
    
    
public:
    ~MassObject();
    MassObject();
    MassObject(const MassObject &obj);
    void collideWithMassObject(const MassObject &obj);
    void setRadius(ScientificNumber *radius);
    void setMass(ScientificNumber *mass);
    const ScientificNumber& getRadius();
    const ScientificNumber& getMass();
    const ScientificNumber& getGravitationRadius();
    const ScientificNumber& getGravity();
    
private:
    void updateVelocityAfterTimeInterval(const double timeInterval);
    void calculateGravitationRadius();
    void calculateGravity();
};
