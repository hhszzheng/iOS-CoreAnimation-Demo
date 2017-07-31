//
//  LottieLogoViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/8.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "LottieLogoViewController.h"

@interface LottieLogoViewController ()
@property (nonatomic, strong) LOTAnimationView *lottieLogo;
@end

@implementation LottieLogoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.lottieLogo = [LOTAnimationView animationNamed:@"LottieLogo1"];
    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.lottieLogo];

    self.lottieLogo.frame = self.view.bounds;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.lottieLogo play];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.lottieLogo pause];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect lottieRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height * 0.3);
    self.lottieLogo.frame = lottieRect;
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
