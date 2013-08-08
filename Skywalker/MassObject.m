//
//  MassObject.m
//  Skywalker
//
//  Created by Zion on 8/8/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "MassObject.h"

@implementation MassObject

-(id)copyWithZone:(NSZone *)zone
{
    MassObject *copyer=[[MassObject alloc] init];
    if (copyer)
    {
        copyer.mass=_mass;
        copyer.radius=_radius;
        copyer.velocityVector=_velocityVector;
        copyer.forceVector=_forceVector;
    }
    return copyer;
}

-(Vector)velocityAfterTimeInterval:(NSTimeInterval)timeInterval
{
    return setLength(_forceVector, timeInterval*vectorLength(_forceVector)/_mass);
}

-(void)updateVelocityAfterTimeInterval:(NSTimeInterval)timeInterval
{
    _velocityVector=[self velocityAfterTimeInterval:timeInterval];
}

-(MassObject*)collideWithMassObject:(MassObject*)colObj
{
    return [MassObject massObjectCollidedByMassObject:self and:colObj];
}

+(MassObject*)massObjectCollidedByMassObject:(MassObject*)colObj0 and:(MassObject*)colObj1
{
    
    //质量相加，体积以最大为准
    MassObject *obj_new=[[MassObject alloc] init];
    obj_new.mass=colObj0.mass+colObj1.mass;
    obj_new.radius=MAX(colObj0.radius,colObj1.radius);
    obj_new.forceVector=colObj0.forceVector;//都一样
    obj_new.velocityVector=multiplyFactor(addVector(multiplyFactor(colObj0.velocityVector, colObj0.mass),multiplyFactor(colObj1.velocityVector, colObj1.mass)),1/obj_new.mass);
    
    return obj_new;
    
}

@end
