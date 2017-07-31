//
//  DrawlineView.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/2.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "DrawlineView.h"
#import "TriangleView.h"



#define  NSTimeInterval 1;
@interface DrawlineView ()<CAAnimationDelegate>

@property(nonatomic,strong)CAShapeLayer * maskLayer;

@property (nonatomic, strong) TriangleView *centerImageView;

@end

@implementation DrawlineView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    
    TriangleView *centerImageView=[TriangleView new];
    self.centerImageView =centerImageView;
    centerImageView.backgroundColor = [UIColor clearColor];
    centerImageView.frame=CGRectMake(0,0, self.bounds.size.width*0.5, self.bounds.size.width*0.5);
    centerImageView.center=CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2);
    
    [self addSubview:centerImageView];

    
    
    
    
    
    
    //画一个圆
    
    CGPoint centerPoint = CGPointMake(CGRectGetWidth(self.bounds) / 2.0, CGRectGetWidth(self.bounds) / 2.0);
    
    UIBezierPath *path = [UIBezierPath new];
    [path addArcWithCenter:centerPoint radius:50 startAngle:-M_PI / 2.0 endAngle:M_PI * 2  - M_PI / 2.0 clockwise:YES];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillColor=[UIColor clearColor].CGColor;
    //将路径赋值给CAShapeLayer
    maskLayer.path = path.CGPath;
    
    //设置路径的颜色
    maskLayer.strokeColor=[UIColor colorWithRed:0.52f green:0.76f blue:0.07f alpha:1.00f].CGColor;
    //设置路径的宽度
    maskLayer.lineWidth=1;
    maskLayer.lineCap=kCALineCapRound;
    
    [self.layer addSublayer:maskLayer];
    self.maskLayer=maskLayer;
    
    [self animationOne];

    
}
- (void)animationOne{
    
    
    
    CABasicAnimation *basicAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation.duration = NSTimeInterval;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    basicAnimation.fromValue = @0;
    basicAnimation.toValue = @1;
    basicAnimation.autoreverses = NO;

    basicAnimation.delegate = self;
    basicAnimation.fillMode = kCAFillModeForwards;
    basicAnimation.removedOnCompletion = NO;

    
    [basicAnimation setValue:@"BasicAnimationEnd" forKey:@"animationName"];
    [self.maskLayer addAnimation:basicAnimation forKey:@"BasicAnimationEnd"];
    
}


-(void)animationTwo
{

    CABasicAnimation *BasicAnimation=[CABasicAnimation animationWithKeyPath:@"strokeStart"];
    BasicAnimation.fromValue=@(0);
    BasicAnimation.toValue = @1;
    BasicAnimation.duration= NSTimeInterval;
    BasicAnimation.autoreverses = NO;
//    BasicAnimation.repeatCount = MAXFLOAT;
    BasicAnimation.fillMode = kCAFillModeForwards;
    BasicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    BasicAnimation.removedOnCompletion = NO;
    BasicAnimation.delegate=self;
    [BasicAnimation setValue:@"BasicAnimationStart" forKey:@"animationName"];
    [self.maskLayer addAnimation:BasicAnimation forKey:@"BasicAnimationStart"];
}



-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    
    if([[anim valueForKey:@"animationName"] isEqualToString:@"BasicAnimationEnd"])
    {
        
        //当画圆的动画完成后同时开始三角形旋转和开始圆消失的动画
        
        //开始三角形旋转
        CABasicAnimation *BasicAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        
        BasicAnimation.toValue=@(M_PI*2);
        BasicAnimation.duration=NSTimeInterval;
        
        BasicAnimation.delegate=self;
        [BasicAnimation setValue:@"BasicAnimationRotation" forKey:@"animationName"];
        [self.centerImageView.layer addAnimation:BasicAnimation forKey:@"BasicAnimationRotation"];
        
        //开始圆消失的动画
        [self animationTwo];
    }
    else if([[anim valueForKey:@"animationName"] isEqualToString:@"BasicAnimationStart"])
    {
        
        //当圆消失动画完成后，清除所有动画从新开始画圆动画
        [self.maskLayer removeAllAnimations];
//        [self.centerImage.layer removeAllAnimations];
        [self animationOne];
    }
    
    
}





@end
