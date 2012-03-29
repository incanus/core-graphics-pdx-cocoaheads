//
//  DrawRectView.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "DrawRectView.h"

@implementation DrawRectView

- (void)drawRect:(CGRect)rect
{
    // get the current context
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // fill the background
    //
    CGContextSetFillColorWithColor(context, [[UIColor orangeColor] CGColor]);
    CGContextFillRect(context, rect);

    // draw a basic path
    //
    CGContextSetStrokeColorWithColor(context, [[UIColor purpleColor] CGColor]);
    CGContextSetLineWidth(context, 3.0);
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextStrokePath(context);
    
    // add a bezier curve
    //
    UIBezierPath *roundRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(120, 120, 50, 30) 
                                                    byRoundingCorners:UIRectCornerAllCorners
                                                          cornerRadii:CGSizeMake(20, 20)];

    roundRect.lineWidth = 3.0;
    
    [roundRect stroke];
    
    CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
    
    [roundRect fill];
    
    // add an image-filled polygon
    //
    CGRect imageRect = CGRectMake(10, 180, self.bounds.size.width - 20, self.bounds.size.height - 190);
    
    CGContextClipToRect(context, imageRect);
    
    UIImage *dots = [UIImage imageNamed:@"dots.jpg"];
    
    CGContextDrawTiledImage(context, CGRectMake(0, 0, dots.size.width, dots.size.height), [dots CGImage]);
}

@end