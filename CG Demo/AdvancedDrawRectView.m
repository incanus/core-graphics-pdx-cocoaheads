//
//  AdvancedDrawRectView.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "AdvancedDrawRectView.h"

@implementation AdvancedDrawRectView

- (void)drawRect:(CGRect)rect
{
    // get the context
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // fill background
    //
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, rect);
    
    // draw a line with rounded ends
    //
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 20.0);
    CGContextSetStrokeColorWithColor(context, [[UIColor orangeColor] CGColor]);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 300, 50);
    CGContextStrokePath(context);

    // fill masked image shape with another image
    //
    CGContextSaveGState(context);
    
    UIImage *star = [UIImage imageNamed:@"star.png"];
    
    CGRect starRect = CGRectMake(30, 70, star.size.width, star.size.height);
    
    CGContextClipToMask(context, starRect, [star CGImage]);
    
    CGContextDrawTiledImage(context, starRect, [[UIImage imageNamed:@"dots.jpg"] CGImage]);
    
    // colorize an image
    //
    CGContextRestoreGState(context);
    
    UIImage *face = [UIImage imageNamed:@"monalisa.jpg"];

    CGRect faceRect = CGRectMake(100, 280, face.size.width, face.size.height);
    
    CGContextDrawImage(context, faceRect, [face CGImage]);
    
    CGContextSetBlendMode(context, kCGBlendModeColor);
    
    CGContextAddRect(context, faceRect);
    CGContextSetFillColorWithColor(context, [[UIColor blueColor] CGColor]);
    CGContextFillPath(context);
}

@end