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
    delete radius;
    delete mass;
    delete gravitationRadius;
    delete gravity;
    delete velocityVector;
    delete forceVector;
    radius=nullptr;
    mass=nullptr;
    gravity=nullptr;
    gravitationRadius=nullptr;
    velocityVector=nullptr;
    forceVector=nullptr;
}

MassObject::MassObject()
:radius(nullptr),
mass(nullptr),
gravitationRadius(nullptr),
gravity(nullptr),
velocityVector(nullptr),
forceVector(nullptr)
{
    
}

MassObject::MassObject(const MassObject &obj)
:radius(new ScientificNumber(*obj.radius)),
mass(new ScientificNumber(*obj.mass)),
gravitationRadius(new ScientificNumber(*obj.gravitationRadius)),
gravity(new ScientificNumber(*obj.gravity)),
velocityVector(new Vector(*obj.velocityVector)),
forceVector(new Vector(*obj.forceVector))
{
    
}

void MassObject::setMass(ScientificNumber *m)
{
    if (mass)
    {
        delete mass;
    }
    mass=m;
    calculateGravity();
}

void MassObject::setRadius(ScientificNumber *r)
{
    if (radius)
    {
        delete radius;
    }
    radius=r;
    calculateGravitationRadius();
    calculateGravity();
}

const ScientificNumber& MassObject::getMass()
{
    return *mass;
}

const ScientificNumber& MassObject::getRadius()
{
    return *radius;
}

const ScientificNumber& MassObject::getGravitationRadius()
{
    return *gravitationRadius;
}

const ScientificNumber& MassObject::getGravity()
{
    return *gravity;
}

void MassObject::calculateGravitationRadius()
{
    if (nullptr==gravitationRadius)
    {
        gravitationRadius=new ScientificNumber(0);
    }
    *gravitationRadius=(*radius)*2;
}

void MassObject::calculateGravity()
{
    
    
}

void MassObject::updateVelocityAfterTimeInterval(const double timeInterval)
{
    *velocityVector+=((*forceVector)/(*mass))*timeInterval;
}

void MassObject::collideWithMassObject(const MassObject &obj)
{
    if (*radius<*obj.radius)
    {
        *radius=*obj.radius;
    }
    *velocityVector=((*velocityVector)*(*mass)+(*obj.velocityVector)*(*obj.mass))/((*mass)+(*obj.mass));
    *mass+=(*obj.mass);
}
