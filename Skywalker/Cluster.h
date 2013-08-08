//
//  Cluster.h
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cluster : NSObject

-(void)addMember:(id)member;
-(void)removeMember:(id)member;

-(void)beginEnumeration;
-(id)nextMember;

@end
