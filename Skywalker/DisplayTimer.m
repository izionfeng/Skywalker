//
//  DisplayTimer.m
//  iSpinWheel
//
//  Created by Zion on 5/31/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "DisplayTimer.h"

static DisplayTimer *defaultInstance;

@interface DisplayTimerObserverShell:NSObject
@property (nonatomic, assign, readonly) id<DisplayTimerDelegate>  observer;
- (id)initWithObserver:(id<DisplayTimerDelegate>)observer;
@end

@implementation DisplayTimerObserverShell

-(id)initWithObserver:(id<DisplayTimerDelegate>)observer
{
    self=[super init];
    if (self)
    {
        NSAssert([observer conformsToProtocol:@protocol(DisplayTimerDelegate)], @"observer must conform to protocal DisplayTimerDelegate");
        _observer=observer;
        
    }
    return self;
}

-(BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[DisplayTimerObserverShell class]])
    {
        if (((DisplayTimerObserverShell*)object).observer==_observer)
        {
            return YES;
        }
    }
    return NO;
}

@end

@interface DisplayTimer()

@property (nonatomic, strong)   NSDate * lastTimerDate;
@property (nonatomic, strong)   CADisplayLink * displayTimer;
@property (nonatomic, strong)   NSMutableArray *displayList;

@end

@implementation DisplayTimer
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

+ (DisplayTimer*)defaultDisplayTimer
{
    @synchronized([self class])
    {
        if (nil==defaultInstance)
        {
            defaultInstance=[[DisplayTimer alloc] init];
        }
    }
    return defaultInstance;
}

- (void)addDisplayObserver:(id<DisplayTimerDelegate>)obsr
{
    DisplayTimerObserverShell *obsrShell=[[DisplayTimerObserverShell alloc] initWithObserver:obsr];
    if (NO==[self.displayList containsObject:obsrShell])
    {
        [self.displayList addObject:obsrShell];
        [self startDisplayTimer];
    }
}

- (void)removeDisplayObserver:(id<DisplayTimerDelegate>)obsr
{
    for (DisplayTimerObserverShell *obsrShell in self.displayList)
    {
        if (obsrShell.observer==obsr)
        {
            [self.displayList removeObject:obsrShell];
            break;
        }
    }
    if (0==[self.displayList count])
    {
        [self stopDisplayTimer];
    }
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

    for (id <DisplayTimerDelegate> d in self.displayList )
    {
        [d displayUpdate:passed];
    }
    
    self.lastTimerDate = newDate;
}

@end
