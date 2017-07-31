//
//  ToTransitionViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/8.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "ToTransitionViewController.h"

@interface ToTransitionViewController ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIButton *backButton;
@end

@implementation ToTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setTitle:@"back" forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
    [self.backButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];

    self.backButton.frame = CGRectMake(0, 0, 100, 100);
    self.backButton.center = self.view.center;


}


- (void)backButtonAction{
    
    self.transitioningDelegate = self;
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
    
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"vcTransition2"
                                                                                                              fromLayerNamed:@"outLayer"
                                                                                                                toLayerNamed:@"inLayer"];
    return animationController;
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
