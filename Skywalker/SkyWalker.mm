//
//  SkyWalker.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "SkyWalker.h"

@implementation SkyWalker

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
    return 10;
}

-(CGFloat)viewGravitationRadius
{
    return 0;
}

-(UIColor*)colorWithMass:(ScientificNumber)mass radius:(ScientificNumber)radius
{
    return [UIColor yellowColor];
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
