//
//  TheTime.h
//  iSpinWheel
//
//  Created by Zion on 5/31/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TimeRunDelegate <NSObject>

@required
- (void)displayUpdate:(NSTimeInterval)passed;
    
@end

@interface TheTime : NSObject

@property (nonatomic, assign) id<TimeRunDelegate> delegate;

+(TheTime*)time;
- (void)startDisplayTimer;
- (void)stopDisplayTimer;

@end
