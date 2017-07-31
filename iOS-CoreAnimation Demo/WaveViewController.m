//
//  WaveViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/28.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "WaveViewController.h"
#import "YDWaveLoadingView.h"
@interface WaveViewController ()
@property (nonatomic, strong) YDWaveLoadingView *loadingView;
@end

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"波浪";
    
    _loadingView = [YDWaveLoadingView loadingView];
    [self.view addSubview:_loadingView];
    _loadingView.center = self.view.center;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_loadingView startLoading];
    });

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
