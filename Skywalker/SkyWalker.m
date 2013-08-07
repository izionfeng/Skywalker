//
//  SkyWalker.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "SkyWalker.h"

static SkyWalker *defaultInstance;

@implementation SkyWalker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init
{
    self=[super init];
    if (self)
    {
        self.bounds=CGRectMake(0, 0, 5, 5);
        self.backgroundColor=[UIColor yellowColor];
        _mass=80;
    }
    return self;
}

+(id)defaultSkyWalker
{
    @synchronized([self class])
    {
        if (nil==defaultInstance)
        {
            defaultInstance=[[SkyWalker alloc] init];
        }
    }
    return defaultInstance;
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
