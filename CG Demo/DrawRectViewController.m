//
//  DrawRectViewController.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "DrawRectViewController.h"

#import "DrawRectView.h"

@implementation DrawRectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Basic #1";

    self.view = [[DrawRectView alloc] initWithFrame:self.view.bounds];
}

@end