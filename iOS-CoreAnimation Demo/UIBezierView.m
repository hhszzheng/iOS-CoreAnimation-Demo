//
//  UIBezierView.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/2.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "UIBezierView.h"

@implementation UIBezierView


- (void)drawRect:(CGRect)rect{
    
    
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(200, 80)];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path stroke];
    
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
