//
//  Cluster.h
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cluster : NSObject

-(NSArray*)memberList;
-(void)addMember:(id)member;
-(void)removeMember:(id)member;

@end
