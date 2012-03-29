//
//  ResponsiveDrawRectView.m
//  CG Demo
//
//  Created by Justin Miller on 3/28/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "ResponsiveDrawRectView.h"

@interface ResponsiveDrawRectView ()

@property (nonatomic, strong) NSMutableArray *activeTouches;

@end

#pragma mark -

@implementation ResponsiveDrawRectView

@synthesize activeTouches;

- (id)initWithFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    
    if (self)
    {
        activeTouches = [NSMutableArray array];

        self.multipleTouchEnabled = YES;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.activeTouches addObjectsFromArray:[touches allObjects]];
    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.activeTouches removeObjectsInArray:[touches allObjects]];
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.activeTouches removeObjectsInArray:[touches allObjects]];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    // get the current context
    //
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set the drawing properties
    //
    CGContextSetFillColorWithColor(context, [[UIColor yellowColor] CGColor]);
    CGContextSetStrokeColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextSetLineWidth(context, 3.0);
    
    // fill with background color
    //
    CGContextFillRect(context, rect);
    
    // draw lines for active touches
    //
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    
    for (UITouch *touch in self.activeTouches)
    {
        CGContextMoveToPoint(context, center.x, center.y);
        CGContextAddLineToPoint(context, [touch locationInView:self].x, [touch locationInView:self].y);
        CGContextStrokePath(context);
    }
}

@end