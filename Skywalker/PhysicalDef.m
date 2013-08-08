//
//  PhysicalDef.m
//  Skywalker
//
//  Created by Zion on 8/8/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "PhysicalDef.h"

Vector addVector(Vector vecA,Vector vecB)
{
    return VectorMake(vecA.x+vecB.x,vecA.y+vecB.y);
}

Vector minusVector(Vector vecA,Vector vecB)
{
    return VectorMake(vecA.x-vecB.x,vecA.y-vecB.y);
}

Vector multiplyFactor(Vector vecA,CGFloat factor)
{
    return VectorMake(vecA.x*factor,vecA.y*factor);
}

CGFloat vectorLength(Vector vec)
{
    return sqrtf(vec.x*vec.x+vec.y*vec.y);
}

Vector addLength(Vector vec,CGFloat len)
{
    CGFloat len_old=vectorLength(vec);
    CGFloat len_new=len_old+len;
    return VectorMake(len_new*vec.x/len_old,len_new*vec.y/len_old);
}

Vector setLength(Vector vec,CGFloat len)
{
    CGFloat len_old=vectorLength(vec);
    return VectorMake(len*vec.x/len_old,len*vec.y/len_old);
    
}
