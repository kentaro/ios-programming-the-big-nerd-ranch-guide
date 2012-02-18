//
//  HypnosisView.m
//  Hypnosister
//
//  Created by 栗林健太郎 on 1/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

@synthesize xShift, yShift;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        stripeColor = [[UIColor lightGrayColor] retain];
    }
    
    return self;
}

- (BOOL)canBecomeFirstResponder 
{
    return YES;
}

- (void)drawRect:(CGRect)rect
{
    CGRect bounds = [self bounds];

    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width  / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);
    
    [stripeColor setStroke];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        center.x += xShift;
        center.y += yShift;

        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
    
    NSString *text = @"You are getting sleepy.";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width  / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    [text drawInRect:textRect withFont:font];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"shake started");
        float r, g, b;
        
        r = random() % 256 / 256.0;
        g = random() % 256 / 256.0;
        b = random() % 256 / 256.0;

        [stripeColor release];
        stripeColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
        [stripeColor retain];
        [self setNeedsDisplay];
    }
}

- (void) dealloc
{
    [stripeColor release];
    [super dealloc];
}

@end
