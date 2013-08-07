//
//  Galaxy.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "Galaxy.h"

@interface PlanetShell : NSObject

@property (nonatomic, assign) Planet *planet;

@end

@implementation PlanetShell
@end

@interface Galaxy ()

@property (nonatomic, strong) NSMutableArray *planetShellList;

@end

@implementation Galaxy

-(Galaxy *)galaxy
{
    Galaxy *g=[[Galaxy alloc] init];
    return g;
}

-(void)addPlanet:(Planet *)planet
{
    
}

-(void)removePlanet:(Planet *)planet
{
    
}

-(NSArray *)planets
{
    NSMutableArray *list=[[NSMutableArray alloc] initWithCapacity:[_planetShellList count]];
    for (PlanetShell *ps in _planetShellList)
    {
        [list addObject:ps.planet];
    }
    
}

@end
