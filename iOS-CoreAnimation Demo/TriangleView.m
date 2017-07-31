//
//  TriangleView.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/2.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    
    CGFloat width = self.frame.size.width*0.65;
    CGFloat width2=width/(sqrt(3));
    
    CGFloat centerX =self.frame.size.width/2;
    CGFloat centerY =self.frame.size.width/2;
    
    CGPoint PointA=CGPointMake(centerX+(width*(2/3.0)), centerY);
    CGPoint PointB=CGPointMake(PointA.x-width, PointA.y-width2);
    CGPoint PointC=CGPointMake(PointB.x, PointB.y+2*width2);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:PointA];
    [path addLineToPoint:PointB];
    [path addLineToPoint:PointC];
    
    [path closePath];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor colorWithRed:0.52f green:0.76f blue:0.07f alpha:1.00f];
    [fillColor set];
    [path fill];
    
    
    // 根据我们设置的各个点连线
    [path stroke];
    
}

@end
