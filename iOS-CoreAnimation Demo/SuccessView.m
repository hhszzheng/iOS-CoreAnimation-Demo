//
//  SuccessView.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/27.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "SuccessView.h"

@implementation SuccessView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    
    CGFloat viewWidth = self.frame.size.width;
    CGFloat viewHeitht = self.frame.size.height;
    // 1、创建path
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(viewWidth / 4, viewHeitht / 2)];
    [path addLineToPoint:CGPointMake(viewWidth / 2, viewHeitht / 4 * 3)];
    [path addLineToPoint:CGPointMake(viewWidth / 4 * 3, viewWidth / 3)];
    // 2、创建ShapLayer
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.lineWidth = 16;
    shapLayer.fillColor = [UIColor clearColor].CGColor;
    shapLayer.strokeColor = [UIColor brownColor].CGColor;
    shapLayer.path = path.CGPath;
    shapLayer.lineCap = kCALineCapRound;
    shapLayer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:shapLayer];
    

    
}


@end
