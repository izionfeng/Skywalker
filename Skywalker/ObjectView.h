//
//  ObjectView.h
//  Skywalker
//
//  Created by Zion on 13-8-10.
//  Copyright (c) 2013年 Zion. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "MassObject.h"

@interface ObjectView : UIView

@property (nonatomic) MassObject *massObj;

-(id)initWithMass:(ScientificNumber)mass radius:(ScientificNumber)radius;

//override
-(CGFloat)viewRadius;
-(CGFloat)viewGravitationRadius;
-(UIColor*)colorWithMass:(ScientificNumber)mass radius:(ScientificNumber)radius;

-(void)updateVelocityAndPosition:(NSTimeInterval)timeInterval;

@end
