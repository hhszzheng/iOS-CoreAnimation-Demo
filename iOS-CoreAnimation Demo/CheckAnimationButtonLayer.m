//
//  CheckAnimationButtonLayer.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/27.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "CheckAnimationButtonLayer.h"

static NSString * const kCornerRadiusAnimationKey = @"cornerRadiusAnimation";
static NSString * const kCheckAnimationKey = @"kCheckAnimationKey";
static const CGFloat kButtonWidth = 100;
static const CGFloat kButtonHeight = 100;


@interface CheckAnimationButtonLayer ()<CAAnimationDelegate>
/** 对号 */
@property (nonatomic, strong) CAShapeLayer *shapeLayer;
/** 对号 */
@property (nonatomic, strong) CABasicAnimation *shapeLayerAnimation;

/** 动画进行标识 */
@property (nonatomic, assign) BOOL isAnimation;

@end


@implementation CheckAnimationButtonLayer


#pragma mark - Life Circle

- (instancetype)init {
    if (self = [super init]) {
        [self config];
    }
    return self;
}

-(void)layoutSubviews {
    self.layer.cornerRadius=self.frame.size.height/2;
}

#pragma mark - Outer Method

- (void)resetView {
    if (self.isAnimation) {
        return;
    }
    self.frame = CGRectMake(100, 100, 130, 50);
    [self.shapeLayer removeFromSuperlayer];
    self.backgroundColor = [UIColor colorWithRed:0.98 green:0.81 blue:0.84 alpha:1];
}

#pragma mark - UI Build

- (void)config {
    // 1、设置self背景色
    self.backgroundColor = [UIColor colorWithRed:0.98 green:0.81 blue:0.84 alpha:1];
    // 2、添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
}

- (void)showCheckAnimation {
    // 1、添加对号
    [self.layer addSublayer:self.shapeLayer];
    // 2、给对号设置动画
    [self.shapeLayer addAnimation:self.shapeLayerAnimation forKey:kCheckAnimationKey];
}

#pragma mark - Event

- (void)tap:(UITapGestureRecognizer *)tapGesture {
    if (self.isAnimation) {
        return;
    }
    self.layer.cornerRadius = kButtonHeight * 0.5;
    // 设置动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.delegate = self;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.4;
    animation.fromValue = @(self.frame.size.height * 0.5);
    [self.layer addAnimation:animation forKey:kCornerRadiusAnimationKey];
}

#pragma mark - Animation Delegate

- (void)animationDidStart:(CAAnimation *)anim {
    if ([self.layer animationForKey:kCornerRadiusAnimationKey]) {
        // 1、动画进行标识设置
        self.isAnimation = YES;
        // 2、动画设置bounds和背景色
        [UIView animateWithDuration:0.6f delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.bounds = CGRectMake(0, 0, kButtonWidth, kButtonHeight);
            self.backgroundColor = [UIColor colorWithRed:1 green:0.8 blue:0.6 alpha:1];
        } completion:^(BOOL finished) {
            //[self.layer removeAnimationForKey:@"kCornerRadiusAnimationKey"];
            [self showCheckAnimation];
        }];
    } else if([self.shapeLayer animationForKey:kCheckAnimationKey]) {
        self.isAnimation = YES;
    }
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.layer.animationKeys.count == 0 && self.shapeLayer.animationKeys.count == 0) {
        self.isAnimation = NO;
    }
}

#pragma mark - Property

- (CABasicAnimation *)shapeLayerAnimation {
    if (!_shapeLayerAnimation) {
        _shapeLayerAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        _shapeLayerAnimation.delegate = self;
        _shapeLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        _shapeLayerAnimation.duration = 0.4f;
        _shapeLayerAnimation.fromValue = @(0.0f);
        _shapeLayerAnimation.toValue = @(1.0f);
    }
    return _shapeLayerAnimation;
}

- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        // 1、获取宽高
        CGFloat viewWidth = self.frame.size.width;
        CGFloat viewHeitht = self.frame.size.height;
        // 2、创建path
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(viewWidth / 4, viewHeitht / 2)];
        [path addLineToPoint:CGPointMake(viewWidth / 2, viewWidth / 4 * 3)];
        [path addLineToPoint:CGPointMake(viewWidth / 4 * 3, viewWidth / 3)];
        // 3、创建ShapLayer
        CAShapeLayer *shapLayer = [CAShapeLayer layer];
        shapLayer.lineWidth = 16;
        shapLayer.fillColor = [UIColor clearColor].CGColor;
        shapLayer.strokeColor = [UIColor colorWithRed:0.75 green:0.9 blue:0.9 alpha:1].CGColor;
        shapLayer.path = path.CGPath;
        shapLayer.lineCap = kCALineCapRound;
        shapLayer.lineJoin = kCALineJoinRound;
        _shapeLayer = shapLayer;
    }
    return _shapeLayer;
}

@end
