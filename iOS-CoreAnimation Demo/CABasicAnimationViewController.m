//
//  CABasicAnimationViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/27.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()
@property (nonatomic , strong) UIView *demoView;
@end

@implementation CABasicAnimationViewController

-(void)initView{
    [super initView];
    
    
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, SCREEN_HEIGHT/2-100,100 ,100 )];
    _demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_demoView];
    
}
-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAniamtion];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            [self backgroundAnimation];
            break;
            
        default:
            break;
    }
}

-(NSString *)controllerTitle{
    return @"基础动画";
}

/**
 *  位移动画演示
 */
-(void)positionAnimation{
    //使用CABasicAnimation创建基础动画
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-75)];
    anima.duration = 1.0f;
    //如果fillMode=kCAFillModeForwards和removedOnComletion=NO，那么在动画执行完毕后，图层会保持显示动画执行后的状态。但在实质上，图层的属性值还是动画执行前的初始值，并没有真正被改变。
    
    //    kCAFillModeRemoved 这个是默认值，也就是说当动画开始前和动画结束后，动画对layer都没有影响，动画结束后，layer会恢复到之前的状态。
    //    kCAFillModeForwards 当动画结束后，layer会一直保持着动画最后的状态。
    //    kCAFillModeBackwards 这个和 kCAFillModeForwards 是相对的，就是在动画开始前，你只要将动画加入了一个layer，layer便立即进入动画的初始状态并等待动画开始。你可以这样设定测试代码，将一个动画加入一个layer的时候延迟5秒执行。然后就会发现在动画没有开始的时候，只要动画被加入了 layer , layer 便处于动画初始状态， 动画结束后，layer 也会恢复到之前的状态。
    //    kCAFillModeBoth 理解了上面两个，这个就很好理解了，这个其实就是上面两个的合成。动画加入后立即开始，layer便处于动画初始状态，动画结束后layer保持动画最后的状态。
    
    
    
    //anima.fillMode = kCAFillModeForwards;
    //anima.removedOnCompletion = NO;
    anima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_demoView.layer addAnimation:anima forKey:@"positionAnimation"];
    
    
    //使用UIView Animation 代码块调用
    //    _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
    //    [UIView animateWithDuration:1.0f animations:^{
    //        _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    //    } completion:^(BOOL finished) {
    //        _demoView.frame = CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50, 50, 50);
    //    }];
    //
    //使用UIView [begin,commit]模式
    //    _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDuration:1.0f];
    //    _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    //    [UIView commitAnimations];
}

/**
 *  透明度动画
 */
-(void)opacityAniamtion{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anima.fromValue = [NSNumber numberWithFloat:1.0f];
    anima.toValue = [NSNumber numberWithFloat:0.2f];
    anima.duration = 1.0f;
    [_demoView.layer addAnimation:anima forKey:@"opacityAniamtion"];
}

/**
 *  缩放动画
 */
-(void)scaleAnimation{
    //    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"bounds"];
    //    anima.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    //    anima.duration = 1.0f;
    //    [_demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
    
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//同上
    anima.toValue = [NSNumber numberWithFloat:2.0f];
    anima.duration = 1.0f;
    [_demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
    
    //    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    //    anima.toValue = [NSNumber numberWithFloat:0.2f];
    //    anima.duration = 1.0f;
    //    [_demoView.layer addAnimation:anima forKey:@"scaleAnimation"];
}

/**
 *  旋转动画
 */
-(void)rotateAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//绕着z轴为矢量，进行旋转(@"transform.rotation.z"==@@"transform.rotation")
    anima.toValue = [NSNumber numberWithFloat:M_PI];
    anima.duration = 1.0f;
    [_demoView.layer addAnimation:anima forKey:@"rotateAnimation"];
    
    //    //valueWithCATransform3D作用与layer
    //    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform"];
    //    anima.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];//绕着矢量（x,y,z）旋转
    //    anima.duration = 1.0f;
    //    //anima.repeatCount = MAXFLOAT;
    //    [_demoView.layer addAnimation:anima forKey:@"rotateAnimation"];
    
    //    //CGAffineTransform作用与View
    //    _demoView.transform = CGAffineTransformMakeRotation(0);
    //    [UIView animateWithDuration:1.0f animations:^{
    //        _demoView.transform = CGAffineTransformMakeRotation(M_PI);
    //    } completion:^(BOOL finished) {
    //
    //    }];
}

/**
 *  背景色变化动画
 */
-(void)backgroundAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) [UIColor greenColor].CGColor;
    anima.duration = 1.0f;
    [_demoView.layer addAnimation:anima forKey:@"backgroundAnimation"];
}






@end
