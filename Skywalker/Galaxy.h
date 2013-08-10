//
//  Galaxy.h
//  Skywalker
//
//  Created by Zion on 13-8-10.
//  Copyright (c) 2013年 Zion. All rights reserved.
//

#import "Cluster.h"

@class ObjectView;
@interface Galaxy : Cluster

-(void)updateForceFor:(ObjectView*)objView;

@end
