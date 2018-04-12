//
//  CCMiniteCircleSlider.m
//  CCTimePickerDemo
//
//  Created by eHome on 17/3/30.
//  Copyright © 2017年 Bref. All rights reserved.
//

#import "CCMiniteCircleSlider.h"

@interface CCMiniteCircleSlider()

@property (nonatomic, assign) CGFloat rotation;
@property (nonatomic) CGAffineTransform currentTransform;

@end

@implementation CCMiniteCircleSlider


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setup];
}


- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    
    self.currentTransform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
    self.unselectColor = [UIColor colorWithRed:0.78 green:0.78 blue:0.78 alpha:1];
    self.selectColor = self.unselectColor;
    self.indicatorColor = [UIColor colorWithRed:30/255.f green:140/255.f blue:220/255.f alpha:1];
    
    self.lineWidth = 20;
    self.contextPadding = 20;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGFloat lineOffset = self.lineWidth / 2;
    CGSize contextSize = CGSizeMake(rect.size.width - self.contextPadding, rect.size.height - self.contextPadding);
    CGFloat center = rect.size.width / 2;
    CGFloat radius = contextSize.width / 2 - lineOffset;
    
    CGContextRef context= UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, self.unselectColor.CGColor);
    CGContextAddArc(context, center, center, radius, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSetStrokeColorWithColor(context, self.unselectColor.CGColor);
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextAddArc(context, center, center, radius, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGPoint centerPoint = CGPointMake(center - lineOffset, center - lineOffset);
    CGPoint dotPoint;
    dotPoint.y = round(centerPoint.x + (centerPoint.y - self.contextPadding / 2) * sin(self.rotation));
    dotPoint.x = round(centerPoint.x + (centerPoint.x - self.contextPadding / 2) * cos(self.rotation));
    
    [self.indicatorColor set];
    
    CGContextFillEllipseInRect(context, CGRectMake(dotPoint.x, dotPoint.y, self.lineWidth, self.lineWidth));
    
    CGContextSetStrokeColorWithColor(context, self.indicatorColor.CGColor);
    CGContextSetLineWidth(context, 1.f);
    CGContextMoveToPoint(context, center, center);
    CGContextAddLineToPoint(context, dotPoint.x + self.lineWidth / 2, dotPoint.y + self.lineWidth / 2);
    CGContextStrokePath(context);
    
    //显示字符 0~60
    for (float i = 0; i < 12; i ++) {
        CGFloat timeNumberRotation = (i * 30.f - 90) / 360 * 2.f * M_PI;
        CGPoint timeNumberPoint;
        timeNumberPoint.y = round(centerPoint.x + (centerPoint.y - self.contextPadding / 2) * sin(timeNumberRotation));
        timeNumberPoint.x = round(centerPoint.x + (centerPoint.x - self.contextPadding / 2) * cos(timeNumberRotation));
        
        CGContextSetLineWidth(context, 1.f);
        NSString *timeNumber = [NSString stringWithFormat:@"%.0f",i * 5];
        CGSize stringSize = [timeNumber sizeWithAttributes:@{
                                                             NSFontAttributeName : [UIFont systemFontOfSize:12]
                                                             }];
        
        [timeNumber drawInRect:CGRectMake(timeNumberPoint.x + self.lineWidth / 2 - stringSize.width / 2, timeNumberPoint.y + self.lineWidth / 2 - stringSize.height / 2, self.lineWidth, self.lineWidth)
                withAttributes:@{
                                 NSFontAttributeName : [UIFont systemFontOfSize:12],
                                 NSForegroundColorAttributeName : [UIColor whiteColor]
                                 }];
    }
}

#pragma mark - Event
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGPoint starTouchPoint = [[touches anyObject] locationInView:self];
    CGFloat rotation = atan2f(starTouchPoint.y - center.y, starTouchPoint.x - center.x);
    
    NSInteger angle = rotation / M_PI * 180;
    NSInteger newAngle = round(angle / 30.f) * 30;
    
    CGFloat newRotation = (CGFloat)newAngle / 180.f * M_PI;
    
    CGAffineTransform transform = CGAffineTransformRotate(_currentTransform, newRotation);
    
    [self changeAngleWithTransform:transform rotation:newRotation];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super continueTrackingWithTouch:touch withEvent:event];
    
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidX(self.bounds));
    CGPoint starTouchPoint = [touch locationInView:self];
    CGPoint endTouchPoint = [touch previousLocationInView:self];
    
    CGFloat rotation = atan2f(starTouchPoint.y - center.y, starTouchPoint.x - center.x) - atan2f(endTouchPoint.y - center.y, endTouchPoint.x - center.x);
    CGAffineTransform transform = CGAffineTransformRotate(_currentTransform, rotation);
    
    CGFloat starRotation = atan2f(starTouchPoint.y - center.y, starTouchPoint.x - center.x);
    
    NSInteger angle = starRotation / M_PI * 180;
    NSInteger newAngle = round(angle / 6.f) * 6;
    
    CGFloat newRotation = (CGFloat)newAngle / 180.f * M_PI;
    
    [self changeAngleWithTransform:transform rotation:newRotation];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super endTrackingWithTouch:touch withEvent:event];
    
    [self sendActionsForControlEvents:UIControlEventEditingDidEnd];
}

- (void)changeAngleWithTransform:(CGAffineTransform)transform rotation:(CGFloat)rotation
{
    _currentTransform = transform;
    _rotation = rotation;
    self.angle = round(_rotation / M_PI * 180.f);
    
    [self setNeedsDisplay];
}

- (NSInteger)minite
{
    NSInteger angle = self.angle + 180;
    NSInteger minite;
    if (angle >= 0 && angle <= 90) {
        minite = angle / 6 + 45;
    }else{
        minite = angle / 6 - 15;
    }
    if (minite == 60) {
        minite = 0;
    }
    
    return minite;
}

- (void)setMinite:(NSInteger)minite
{
    NSInteger angle;
    
    if (angle >= 45 && angle <= 60) {
        angle = (minite - 45) * 6;
    }else
    {
        angle = (minite + 15) * 6;
    }
    
    self.angle = angle - 180;
    self.rotation = (CGFloat)self.angle / 180.f * M_PI;

    [self setNeedsDisplay];
}



@end
