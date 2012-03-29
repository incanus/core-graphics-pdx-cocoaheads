//
//  TiledView.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "TiledView.h"

#import <QuartzCore/QuartzCore.h>

@implementation TiledView

@synthesize tiledImage;

+ (Class)layerClass
{
    return [CATiledLayer class];
}

- (void)drawRect:(CGRect)rect
{
    // get context
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // get desired tile clip & apply to context
    //
    CGRect clip = CGContextGetClipBoundingBox(context);
    CGContextClipToRect(context, CGRectMake(clip.origin.x, clip.origin.y, 256, 256));
    
    // flip image rightside-up
    //
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0, -self.tiledImage.size.height);
    
    // draw image tile
    //
    CGContextDrawImage(context, CGRectMake(0, 0, self.tiledImage.size.width, self.tiledImage.size.height), [self.tiledImage CGImage]);
}

@end