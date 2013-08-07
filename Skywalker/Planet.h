//
//  Planet.h
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Planet : UIView

@property (nonatomic, assign, readonly) CGFloat mass;//kg
@property (nonatomic, assign, readonly) CGFloat radius;//m

//optional
//近地气体阻尼
//形状

- initWithMass:(CGFloat)mass radius:(CGFloat)radius;

@end
