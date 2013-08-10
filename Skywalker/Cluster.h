//
//  Cluster.h
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ObjectView;
@interface Cluster : NSObject

@property (nonatomic, copy) NSString *name;

-(void)addMember:(ObjectView*)member;
-(void)removeMember:(ObjectView*)member;

-(void)beginEnumeration;
-(id)nextMember;

@end
