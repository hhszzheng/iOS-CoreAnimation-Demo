//
//  AliPayAnimationViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/4.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "AliPayAnimationViewController.h"
#import "XLPaymentSuccessHUD.h"
#import "XLPaymentLoadingHUD.h"
@interface AliPayAnimationViewController ()

@end

@implementation AliPayAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    startButton.frame = CGRectMake(50, 100, 70, 50);
//    startButton.backgroundColor = [UIColor orangeColor];
//    [startButton setTitle:@"start" forState:UIControlStateNormal];
//    [startButton addTarget:self action:@selector(showLoadingAnimation) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:startButton];
//    
//    
//    
//    UIButton *successButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    successButton.frame = CGRectMake(150, 100, 100, 50);
//    [successButton setTitle:@"success" forState:UIControlStateNormal];
//    successButton.backgroundColor = [UIColor orangeColor];
//    [successButton addTarget:self action:@selector(showSuccessAnimation) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:successButton];
    
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"开始支付" style:UIBarButtonItemStylePlain target:self action:@selector(showLoadingAnimation)];
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"支付完成" style:UIBarButtonItemStylePlain target:self action:@selector(showSuccessAnimation)];

    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showLoadingAnimation];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showSuccessAnimation];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [XLPaymentSuccessHUD hideIn:self.view];
            });
        });

    });

    
    

    
}
-(void)showLoadingAnimation{
    
    self.title = @"正在付款...";
    
    //隐藏支付完成动画
    [XLPaymentSuccessHUD hideIn:self.view];
    //显示支付中动画
    [XLPaymentLoadingHUD showIn:self.view];
}

-(void)showSuccessAnimation{
    
    self.title = @"付款完成";
    
    //隐藏支付中成动画
    [XLPaymentLoadingHUD hideIn:self.view];
    //显示支付完成动画
    [XLPaymentSuccessHUD showIn:self.view];
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
