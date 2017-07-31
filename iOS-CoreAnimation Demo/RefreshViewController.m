//
//  RefreshViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/8.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "RefreshViewController.h"

@interface RefreshViewController ()
@property (nonatomic, strong) LOTAnimationView *refreshView;
@end

@implementation RefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    MaterialLoading
    self.refreshView = [LOTAnimationView animationNamed:@"MaterialLoading"];
    self.refreshView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.refreshView];
    
    self.refreshView.frame = self.view.bounds;
    
    self.refreshView.loopAnimation = YES;
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.refreshView play];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.refreshView pause];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect lottieRect = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.refreshView.frame = lottieRect;
}

@end
