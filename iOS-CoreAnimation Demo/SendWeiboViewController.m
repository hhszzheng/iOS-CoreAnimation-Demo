//
//  SendWeiboViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/9/12.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "SendWeiboViewController.h"
#import <POP.h>
#import "UIView+Extension.h"
static CGFloat const animationDelay = 0.1;


@interface Sendbutton :UIButton


@end

@implementation Sendbutton

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.height;
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    
    // 设置文字居中
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end





@interface SendWeiboViewController ()

@end

@implementation SendWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:bottomButton];
    bottomButton.backgroundColor = [UIColor cyanColor];
    [bottomButton setImage:[UIImage imageNamed:@"shareButtonCancel"] forState:UIControlStateNormal];
    [bottomButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-100);
    }];
    

    [self addWeibo];
    
}

- (void)addWeibo{
    
    
    // 1.让控制器的view不能点击
    self.view.userInteractionEnabled = NO;
    
    // 2. 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];

    // 3.设置中间的按钮 这里是6个 当然也可以是服务器返回的数量 但是计算方法都一样
    int maxCols = 3;  // 一排最多三个
    CGFloat btnW = 72;
    CGFloat btnH = btnW + 38;
    CGFloat btnStartY = (SCREEN_HEIGHT - 2 * btnH) * 0.5;
    CGFloat btnStartX = 20;
    CGFloat xMargin = (SCREEN_WIDTH - 2 * btnStartX - maxCols * btnW) / (maxCols - 1);

    
    for (int i = 0; i <images.count; i++) {
        
        Sendbutton *button = [Sendbutton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        
        int row = i / maxCols;//所在行
        int col = i % maxCols;//所在列
        CGFloat buttonX = btnStartX + col*(xMargin + btnW);
        CGFloat buttonEndY = btnStartY + row * btnH;
        CGFloat buttonBeginY = SCREEN_HEIGHT + buttonEndY;
        
        //给按钮添加弹簧动画

        POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        animation.fromValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonBeginY, btnW, btnH)];
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(buttonX, buttonEndY, btnW, btnH)];
        animation.springSpeed = 10;//springSpeed为弹簧速度 速度越快 动画时间越短 取值范围[0,20], 默认为12 和springBounciness一起决定弹簧动画效果
        animation.springBounciness = 10;//springBounciness为弹簧弹力 取值范围为【0，20】， 默认为4

        animation.beginTime = CACurrentMediaTime()+animationDelay * i;
        [button pop_addAnimation:animation forKey:nil];
        [animation setCompletionBlock:^(POPAnimation *anim,BOOL finished){
            self.view.userInteractionEnabled = YES;
        }];
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
/**
 * 按钮点击事件
 */
- (void)buttonAction:(UIButton *)button{
    
    [self cancelWithCompletionBlock:^{
        
        switch (button.tag) {
                case 0:
                NSLog(@"发视屏");
                break;
                case 1:
                NSLog(@"发图片");
                break;
                case 2:
                NSLog(@"发段子");
                break;
                case 3:
                NSLog(@"发声音");
                break;
                case 4:
                NSLog(@"发连接");
                break;
                case 5:
                NSLog(@"音乐相册");
                break;
            default:
                break;
        }
    }];
}

- (void)backAction:(UIButton *)sender{
    [self cancelWithCompletionBlock:nil];
}


/**
 * 先执行退出动画 动画执行完毕再执行completionBlock - 微博
 */
- (void)cancelWithCompletionBlock:(void(^)())completionBlock{
    
    // 让控制器的view不能点击
    self.view.userInteractionEnabled = NO;
    
    int index = 0; // 索引 用来设置按钮动画的延迟时间
    
    for ( int i = (int)self.view.subviews.count - 1; i > 0; i--) {
        
        UIView * subview = self.view.subviews[i];
        
        // 基本动画
        POPBasicAnimation * anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
        CGFloat centerY = subview.centerY + SCREEN_HEIGHT;
        
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(subview.centerX, centerY)];
        anim.beginTime = CACurrentMediaTime() + index * animationDelay;
        
        index ++;
        
        [subview pop_addAnimation:anim forKey:nil];
        
        // 监听最后一个动画
        if (i == 1) {
            [anim setCompletionBlock:^(POPAnimation *anim, BOOL finished){
                
                [self dismissViewControllerAnimated:NO completion:nil];
                
                !completionBlock ? : completionBlock();
            }];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
