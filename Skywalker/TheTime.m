//
//  TheTime.m
//  iSpinWheel
//
//  Created by Zion on 5/31/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "TheTime.h"

@interface TheTime()

@property (nonatomic, strong)   NSDate * lastTimerDate;
@property (nonatomic, strong)   CADisplayLink * displayTimer;
@property (nonatomic, strong)   NSMutableArray *displayList;

@end

@implementation TheTime
@synthesize lastTimerDate;
@synthesize displayTimer;
@synthesize displayList;

- (id)init
{
    self=[super init];
    if (self)
    {
        self.displayList=[[NSMutableArray alloc] initWithCapacity:3];
    }
    return self;
}

+(TheTime *)time
{
    TheTime *t=[[TheTime alloc] init];
    return t;
}

- (void)startDisplayTimer
{
    if (self.displayTimer)
    {
        return;
    }
    self.lastTimerDate = nil;
    self.displayTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(animationTimer:)];
    [self.displayTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopDisplayTimer
{
    if (!self.displayTimer)
    {
        return;
    }
    [self.displayTimer invalidate];
    self.displayTimer = nil;
}

- (void)animationTimer:(id)sender
{
    NSDate * newDate = [NSDate date];
    if (!self.lastTimerDate)
    {
        self.lastTimerDate = newDate;
        return;
    }
    
    NSTimeInterval passed = [newDate timeIntervalSinceDate:self.lastTimerDate];

    [_delegate displayUpdate:passed];
    
    self.lastTimerDate = newDate;
}

@end
