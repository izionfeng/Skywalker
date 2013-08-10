//
//  Planet.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "Planet.h"

#define LengthFactor (ScientificNumber(5,5))

@implementation Planet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(CGFloat)viewRadius
{
    return (self.massObj->getRadius()/LengthFactor).floatValue();
}

-(CGFloat)viewGravitationRadius
{
    return (self.massObj->getGravitationRadius()/LengthFactor).floatValue();
}

-(UIColor*)colorWithMass:(ScientificNumber)mass radius:(ScientificNumber)radius
{
    return [UIColor whiteColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
