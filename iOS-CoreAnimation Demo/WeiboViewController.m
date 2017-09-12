//
//  WeiboViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/9/12.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "WeiboViewController.h"
#import "SendWeiboViewController.h"
@interface WeiboViewController ()

@end

@implementation WeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:bottomButton];
    bottomButton.backgroundColor = [UIColor cyanColor];
    [bottomButton setTitle:@"发送" forState:UIControlStateNormal];
    [bottomButton addTarget:self action:@selector(sendAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [bottomButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.width.height.mas_equalTo(60);
    }];
    
}

- (void)sendAction:(UIButton *)sender{
    
    
    SendWeiboViewController * publishVC = [[SendWeiboViewController alloc]init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:publishVC animated:YES completion:nil];
    
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
