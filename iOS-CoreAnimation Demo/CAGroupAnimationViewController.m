//
//  CAGroupAnimationViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/27.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "CAGroupAnimationViewController.h"

@interface CAGroupAnimationViewController ()
@property (nonatomic , strong) UIView *demoView;

@end

@implementation CAGroupAnimationViewController

-(void)initView{
    [super initView];
    
    _demoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50,50,50)];
    _demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_demoView];
    
}

-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"同时",@"连续", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self groupAnimation1];
            break;
        case 1:
            [self groupAnimation2];
            break;
        default:
            break;
    }
}
-(void)groupAnimation1{
    
    //1.位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anima1.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)].CGPath;
    
    //2.缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    
    //3.旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];

    
    //组动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:anima1,anima2,anima3, nil];
    groupAnimation.duration = 4.0f;
    
    [_demoView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    
    
}


//顺序执行的  必须要写beginTime这个属性  
- (void)groupAnimation2{
    CFTimeInterval currentTime = CACurrentMediaTime();
    //位移动画
    CABasicAnimation *anima1 = [CABasicAnimation animationWithKeyPath:@"position"];
    anima1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
    anima1.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2-75)];
    anima1.beginTime = currentTime;
    anima1.duration = 1.0f;
    anima1.fillMode = kCAFillModeForwards;
    anima1.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima1 forKey:@"aa"];
    
    //缩放动画
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    anima2.fromValue = [NSNumber numberWithFloat:0.8f];
    anima2.toValue = [NSNumber numberWithFloat:2.0f];
    anima2.beginTime = currentTime+1.0f;
    anima2.duration = 1.0f;
    anima2.fillMode = kCAFillModeForwards;
    anima2.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima2 forKey:@"bb"];
    
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat:M_PI*4];
    anima3.beginTime = currentTime+2.0f;
    anima3.duration = 1.0f;
    anima3.fillMode = kCAFillModeForwards;
    anima3.removedOnCompletion = NO;
    [_demoView.layer addAnimation:anima3 forKey:@"cc"];
    
    
}

-(NSString *)controllerTitle{
    return @"组动画";
}


@end
