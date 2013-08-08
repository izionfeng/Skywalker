//
//  MassObject.h
//  Skywalker
//
//  Created by Zion on 8/8/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhysicalDef.h"

@interface MassObject : NSObject<NSCopying>

@property (nonatomic, assign) CGFloat mass;//kg
@property (nonatomic, assign) CGFloat radius;//m
@property (nonatomic, assign) Vector forceVector;
@property (nonatomic, assign) Vector velocityVector;

@end
