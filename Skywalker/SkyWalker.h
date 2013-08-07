//
//  SkyWalker.h
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkyWalker : UIView

@property (nonatomic, assign, readonly) CGFloat mass;//kg
@property (nonatomic, assign)   CGPoint direction;
@property (nonatomic, assign)   CGFloat velocity;

+(id)defaultSkyWalker;

@end
