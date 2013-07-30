//
//  UITypingIndicator.m
//  TypingIndicator
//
//  Created by Sérgio Vieira on 7/30/13.
//  Copyright (c) 2013 Bravo Inovação. All rights reserved.
//

#import "UITypingIndicator.h"


static const CGSize kDefaultIndicatorSize = {18.f, 8.f};
static const CGRect kDefaultIndicatorFrame = {{0.f, 0.f}, {18.f, 8.f}};
static const CGFloat kRadius = 3.f;

@implementation UITypingIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (id)init
{
    self = [super initWithFrame:kDefaultIndicatorFrame];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGRect frame = self.frame;
    
    frame.size = kDefaultIndicatorSize;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y + kRadius);
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + rect.size.height - kRadius);
    CGContextAddArc(context, rect.origin.x + kRadius, rect.origin.y + rect.size.height - kRadius, kRadius, M_PI, M_PI / 2, 1);
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width - kRadius, rect.origin.y + rect.size.height);
    CGContextAddArc(context, rect.origin.x + rect.size.width - kRadius, rect.origin.y + rect.size.height - kRadius, kRadius, M_PI / 2, 0.0f, 1);
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + kRadius);
    CGContextAddArc(context, rect.origin.x + rect.size.width - kRadius, rect.origin.y + kRadius, kRadius, 0.0f, -M_PI / 2, 1);
    CGContextAddLineToPoint(context, rect.origin.x + kRadius, rect.origin.y);
    CGContextAddArc(context, rect.origin.x + kRadius, rect.origin.y + kRadius, kRadius, -M_PI / 2, M_PI, 1);
    
    /** draw 3 dots **/
    CGRect rectangle = CGRectMake(rect.origin.x + 2, rect.origin.y + 2, 4, 4);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);

    for (int i = 0; i < 3; i++)
    {
        CGContextAddEllipseInRect(context, rectangle);
        rectangle.origin.x += 5;
    }
    
    CGContextFillPath(context);
}

- (void)show
{
    if (self.hidden)
    {
        [UIView transitionWithView:self duration:0.3f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.hidden = NO;
        } completion:NULL];
    }
}

- (void)hide
{
    if (!self.hidden)
    {
        [UIView transitionWithView:self duration:0.3f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.hidden = YES;
        } completion:NULL];
    }
}

#pragma mark - Private Methods
- (void)initialize
{
    [self setBackgroundColor:[UIColor clearColor]];
}

@end
