//
//  Cluster.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "Cluster.h"

@interface MemberShell : NSObject

@property (nonatomic, assign) id member;
@end

@implementation MemberShell
-(BOOL)isEqual:(id)object
{
    return ([object isKindOfClass:[MemberShell class]]&&((MemberShell*)object).member==_member);
}


@end

@implementation Cluster

-(void)addMember:(id)member
{
    
}

-(void)removeMember:(id)member
{
    
}

-(NSArray *)memberList
{
    
}

@end
