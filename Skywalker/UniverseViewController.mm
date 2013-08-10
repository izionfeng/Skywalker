//
//  UniverseViewController.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "UniverseViewController.h"
#import "TheTime.h"
#import "Planet.h"
#import "SkyWalker.h"
#import "Galaxy.h"

@interface UniverseViewController ()<TimeRunDelegate>

@property (nonatomic, strong) TheTime *universeTimer;
@property (nonatomic, strong) Galaxy *galaxy;//this universe has only one galaxy.
@property (nonatomic, assign) SkyWalker *skyWalker;

@end

@implementation UniverseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self=[super init];
    if (self)
    {
        _universeTimer=[TheTime time];
        _universeTimer.delegate=self;
        _galaxy=[[Galaxy alloc] init];
    }
    return self;
}

-(void)dealloc
{
    [_universeTimer stopDisplayTimer];
    _universeTimer.delegate=nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    Planet *p=[[Planet alloc] initWithMass:3000000000 radius:16400000];
    p.center=CGPointMake(200, 300);
    [self addObjectToGalaxy:p];
    
    p=[[Planet alloc] initWithMass:10 radius:16400000];
    p.center=CGPointMake(100, 300);
    [self addObjectToGalaxy:p];
    
    p=[[Planet alloc] initWithMass:10 radius:16400000];
    p.center=CGPointMake(200, 450);
    [self addObjectToGalaxy:p];
    
    p=[[Planet alloc] initWithMass:10 radius:16400000];
    p.center=CGPointMake(200, 600);
    [self addObjectToGalaxy:p];
    
    SkyWalker *sw=[[SkyWalker alloc] initWithMass:1000 radius:3];//a spaceship?
    sw.massObj->velocityVector=Vector(0,5);
    sw.center=CGPointMake(260, -10);
    [self.view addSubview:sw];
    _skyWalker=sw;
    
    [_universeTimer startDisplayTimer];
    
    
}

- (void)addObjectToGalaxy:(ObjectView*)objView
{
    [self.view addSubview:objView];
    [_galaxy addMember:objView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TimeRunDelegate -
-(void)displayUpdate:(NSTimeInterval)passed
{
    [_skyWalker updateVelocityAndPosition:passed];
    [_galaxy updateForceFor:_skyWalker];
    
}
- (IBAction)resetButtonClick:(id)sender
{
    _skyWalker.center=CGPointMake(260, -10);
    _skyWalker.massObj->velocityVector=Vector((rand()%40-30)/10,2);
}

@end
