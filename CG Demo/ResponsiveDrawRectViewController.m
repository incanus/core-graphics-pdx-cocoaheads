//
//  ResponsiveDrawRectViewController.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "ResponsiveDrawRectViewController.h"

#import "ResponsiveDrawRectView.h"

@implementation ResponsiveDrawRectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Basic #2";
    
    self.view = [[ResponsiveDrawRectView alloc] initWithFrame:self.view.bounds];
}

@end