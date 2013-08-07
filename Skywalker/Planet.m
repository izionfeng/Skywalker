//
//  Planet.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "Planet.h"

@implementation Planet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)__init
{
    self.layer.cornerRadius=_radius;
}

-(id)initWithMass:(CGFloat)mass radius:(CGFloat)radius
{
    self=[super initWithFrame:CGRectMake(0, 0, radius*2, radius*2)];
    if (self)
    {
        _mass=mass;
        _radius=radius;
        [self __init];
    }
    return self;
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
