//
//  ViewController.m
//  Skywalker
//
//  Created by Zion on 8/7/13.
//  Copyright (c) 2013 Zion. All rights reserved.
//

#import "ViewController.h"
#import "UniverseViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)letsGo:(id)sender
{
    UniverseViewController *uvsViewCtrl=[[UniverseViewController alloc] init];
    [self.navigationController pushViewController:uvsViewCtrl animated:YES];
}

@end
