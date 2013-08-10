//
//  ObjectView.m
//  Skywalker
//
//  Created by Zion on 13-8-10.
//  Copyright (c) 2013年 Zion. All rights reserved.
//

#import "ObjectView.h"

@implementation ObjectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithMass:(ScientificNumber)mass radius:(ScientificNumber)radius
{
    self=[super init];
    if (self)
    {
        _massObj=new MassObject();
        _massObj->setMass(mass);
        _massObj->setRadius(radius);
        [self setframeWithRadius:radius];
        [self setColor];
        
    }
    return self;
}

-(void)setframeWithRadius:(ScientificNumber)radius
{
    CGPoint center=self.center;
    CGFloat vr=[self viewRadius];
    self.frame=CGRectMake(center.x-vr, center.y-vr, vr*2, vr*2);
}

-(CGFloat)viewRadius
{
    return 5;
}

-(void)setColor
{
    self.backgroundColor=[self colorWithMass:_massObj->getMass() radius:_massObj->getRadius()];
    
}

-(UIColor*)colorWithMass:(ScientificNumber)mass radius:(ScientificNumber)radius
{
    return [UIColor whiteColor];
}

-(CGFloat)viewGravitationRadius
{
    return 10;
}

-(void)updateVelocityAndPosition:(NSTimeInterval)timeInterval
{
    CGPoint center=self.center;
    center.x+=_massObj->velocityVector.x.floatValue();
    center.y+=_massObj->velocityVector.y.floatValue();
    self.center=center;
    _massObj->updateVelocityAfterTimeInterval(timeInterval);
    
}

-(void)dealloc
{
    delete _massObj;
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
