//
//  PhysicalDef.h
//  Skywalker
//
//  Created by Zion on 8/8/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Vector CGPoint
#define VectorMake CGPointMake

extern Vector addVector(Vector vecA,Vector vecB);
extern Vector minusVector(Vector vecA,Vector vecB);
extern Vector multiplyFactor(Vector vecA,CGFloat factor);
extern CGFloat vectorLength(Vector vec);
extern Vector addLength(Vector vec,CGFloat len);
extern Vector setLength(Vector vec,CGFloat len);

