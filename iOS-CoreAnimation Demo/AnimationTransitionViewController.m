//
//  AnimationTransitionViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/8.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "AnimationTransitionViewController.h"
#import "ToTransitionViewController.h"
@interface AnimationTransitionViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIButton *goButton;


@end

@implementation AnimationTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.goButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.goButton setTitle:@"go" forState:UIControlStateNormal];
    [self.goButton setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [self.goButton addTarget:self action:@selector(gobuttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.goButton];
    self.goButton.frame = CGRectMake(0, 0, 100, 100);
    self.goButton.center = self.view.center;
    
    
    
}

- (void)gobuttonAction{
    
    
    
    ToTransitionViewController *vc = [[ToTransitionViewController alloc] init];
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:NULL];

//    [self.navigationController pushViewController:vc animated:YES];
    
    
}
#pragma mark -- View Controller Transitioning

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    LOTAnimationTransitionController *animationController = [[LOTAnimationTransitionController alloc] initWithAnimationNamed:@"vcTransition1"
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
