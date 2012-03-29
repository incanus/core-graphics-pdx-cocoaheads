//
//  AppDelegate.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "AppDelegate.h"

#import "TableViewController.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[TableViewController alloc] init]];
    
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end