//
//  TiledViewController.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "TiledViewController.h"

#import "TiledView.h"

@implementation TiledViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator   = NO;
    
    scrollView.minimumZoomScale = 0.25;
    scrollView.maximumZoomScale = 4.0;
    
    scrollView.delegate = self;
    
    [self.view addSubview:scrollView];
    
    UIImage *bigImage = [UIImage imageNamed:@"nintendo.jpg"];
    
    TiledView *tiledView = [[TiledView alloc] initWithFrame:CGRectMake(0, 0, bigImage.size.width, bigImage.size.height)];
    
    tiledView.tiledImage = bigImage;
    
    [scrollView addSubview:tiledView];
    
    scrollView.contentSize = tiledView.bounds.size;
}

#pragma mark -

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews objectAtIndex:0];
}

@end