//
//  Cluster.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "Cluster.h"

@interface MemberShell : NSObject

@property (nonatomic, assign, readonly) id member;
@end

@implementation MemberShell

-(id)initWithMember:(id)member
{
    self=[super init];
    if (self)
    {
        _member=member;
    }
    return self;
}

-(BOOL)isEqual:(id)object
{
    return ([object isKindOfClass:[MemberShell class]]&&((MemberShell*)object).member==_member);
}


@end

@interface Cluster ()

@property (nonatomic, strong) NSMutableArray *memberShellList;
@property (nonatomic, assign) NSInteger iterator;

@end

@implementation Cluster

-(id)init
{
    self=[super init];
    if (self)
    {
        _memberShellList=[[NSMutableArray alloc] initWithCapacity:3];
    }
    return self;
}

-(void)addMember:(id)member
{
    MemberShell *shell=[[MemberShell alloc] initWithMember:member];
    if (NO==[_memberShellList containsObject:shell])
    {
        [_memberShellList addObject:shell];
    }
    
}

-(void)removeMember:(id)member
{
    for (MemberShell *shell in _memberShellList)
    {
        if (shell.member==member)
        {
            [_memberShellList removeObject:shell];
        }
    }
    
}

-(void)beginEnumeration
{
    _iterator=0;
}

-(id)nextMember
{
    if (_iterator<[_memberShellList count])
    {
        return ((MemberShell*)_memberShellList[_iterator++]).member;
    }
    return nil;
}

@end
