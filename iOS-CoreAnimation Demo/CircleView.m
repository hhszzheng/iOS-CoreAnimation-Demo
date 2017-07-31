
//
//  CircleView.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/28.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    
//    CAShapeLayer *circel = [CAShapeLayer layer];
//    circel.bounds = CGRectMake(0, 0, 100, 100);
//    circel.position = self.center;
//    [self.layer addSublayer:circel];
//    
//    circel.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)].CGPath;
//    circel.strokeColor = [UIColor cyanColor].CGColor;
//    circel.fillColor = [UIColor orangeColor].CGColor;
//    circel.lineWidth = 10;
//    circel.lineCap = @"round";
//    circel.strokeEnd = 0.75;
    
    
    
    
//    CAShapeLayer * circle = [CAShapeLayer layer];
//    circle.bounds = CGRectMake(0, 0, 100, 100);
//    circle.position = self.center;
//    [self.layer addSublayer:circle];
//    circle.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)].CGPath;
//    circle.strokeColor = [UIColor redColor].CGColor;
//    circle.fillColor = [UIColor yellowColor].CGColor;
//    circle.lineWidth = 10;
//    circle.lineCap = @"round";
//    circle.strokeEnd = 0.75;
    
    
    
    
    CGRect rect = CGRectMake(0, 0, 100, 100);
    UIBezierPath * rectP = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5];
    UIBezierPath * circleP = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 80, 80)];
    [rectP appendPath:circleP];
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = self.center;
    layer.path = rectP.CGPath;
    layer.fillColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    layer.fillRule = kCAFillRuleEvenOdd;
    [self.layer addSublayer:layer];
    
    
    
    
    
    
    
    
    
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:self.center
                                                         radius:40
                                                     startAngle:0
                                                       endAngle:90
                                                      clockwise:YES];

    aPath.lineWidth = 5.0;
    aPath.lineCapStyle = kCGLineCapRound;  //线条拐角
    aPath.lineJoinStyle = kCGLineCapRound;  //终点处理
    
    [aPath stroke];
    
    
        CAShapeLayer *bancircle = [CAShapeLayer layer];
        bancircle.bounds = CGRectMake(10, 10, 80, 80);
        bancircle.lineWidth = 40;
        bancircle.path = aPath.CGPath;
        bancircle.position = self.center;
        bancircle.fillColor = [UIColor cyanColor].CGColor;
        bancircle.fillRule = kCAFillRuleEvenOdd;
        bancircle.strokeStart = 0;
        bancircle.strokeEnd = 0.75;
        [self.layer addSublayer:bancircle];

    
}


@end
