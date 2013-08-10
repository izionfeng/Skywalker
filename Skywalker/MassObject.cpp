//
//  MassObject.cpp
//  Skywalker
//
//  Created by Zion on 8/8/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#include "MassObject.h"
#include <algorithm>

MassObject::~MassObject()
{

}

MassObject::MassObject()
:radius(0),
mass(0),
gravitationRadius(0),
gravity(0),
velocityVector(Vector::Zero),
forceVector(Vector::Zero)
{
    
}

MassObject::MassObject(const MassObject &obj)
:radius(obj.radius),
mass(obj.mass),
gravitationRadius(obj.gravitationRadius),
gravity(obj.gravity),
velocityVector(obj.velocityVector),
forceVector(obj.forceVector)
{
    
}

void MassObject::setMass(const ScientificNumber &m)
{
    mass=m;
    calculateGravity();
}

void MassObject::setRadius(const ScientificNumber &r)
{
    radius=r;
    calculateGravitationRadius();
    calculateGravity();
}

const ScientificNumber MassObject::getMass() const
{
    return mass;
}

const ScientificNumber MassObject::getRadius() const
{
    return radius;
}

const ScientificNumber MassObject::getGravitationRadius()const
{
    return gravitationRadius;
}

const ScientificNumber MassObject::getGravity()const
{
    return gravity;
}

void MassObject::calculateGravitationRadius()
{
    gravitationRadius=(radius)*4;
}

void MassObject::calculateGravity()
{
    gravity=10000;
}

void MassObject::updateVelocityAfterTimeInterval(const double timeInterval)
{
    velocityVector+=((forceVector)/(mass))*timeInterval;
}

void MassObject::collideWithMassObject(const MassObject &obj)
{
    if (radius<obj.radius)
    {
        radius=obj.radius;
    }
    velocityVector=((velocityVector)*(mass)+(obj.velocityVector)*(obj.mass))/((mass)+(obj.mass));
    mass+=(obj.mass);
}
