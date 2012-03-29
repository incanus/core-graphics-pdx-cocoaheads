//
//  AdvancedDrawRectViewController.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "AdvancedDrawRectViewController.h"

#import "AdvancedDrawRectView.h"

#import <QuartzCore/QuartzCore.h>

@implementation AdvancedDrawRectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Advanced #1";
    
    self.view = [[AdvancedDrawRectView alloc] initWithFrame:self.view.bounds];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Snapshot" 
                                                                              style:UIBarButtonItemStyleBordered 
                                                                             target:self
                                                                             action:@selector(takeSnapshot:)];
}

- (void)takeSnapshot:(id)sender
{
    UIGraphicsBeginImageContext(self.view.window.bounds.size);
    
    [self.view.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(snapshot, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
{
    [[[UIAlertView alloc] initWithTitle:@"Snapshot Saved" 
                                message:@"A snapshot was saved to the camera roll." 
                               delegate:nil 
                      cancelButtonTitle:nil 
                      otherButtonTitles:@"OK", nil] show];
}

@end