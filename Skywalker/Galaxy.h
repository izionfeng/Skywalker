//
//  Galaxy.h
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Planet;
@interface Galaxy : NSObject

-(NSArray*)planets;
-(void)addPlanet:(Planet*)planet;
-(void)removePlanet:(Planet*)planet;

-(Galaxy*)galaxy;

@end
