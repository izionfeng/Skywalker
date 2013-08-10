//
//  Galaxy.m
//  Skywalker
//
//  Created by Zion on 13-8-10.
//  Copyright (c) 2013年 Zion. All rights reserved.
//

#import "Galaxy.h"
#import "ObjectView.h"
#import "MassObject.h"

@implementation Galaxy

-(void)updateForceFor:(ObjectView *)objView
{
    CGPoint outPoint=objView.center;
    Vector dir;
    objView.massObj->forceVector=Vector::Zero;
    [self beginEnumeration];
    ObjectView *member=[self nextMember];
    do
    {
        dir=Vector(member.center.x-outPoint.x,member.center.y-outPoint.y);
        if ([member viewGravitationRadius]>=dir.length().floatValue())
        {
            dir.setLength(member.massObj->getGravity());
            objView.massObj->forceVector+=dir;
        }
        member=[self nextMember];
    }while (nil!=member);
    
}

@end
