//
//  DrawlineViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/2.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "DrawlineViewController.h"
#import "DrawlineView.h"
@interface DrawlineViewController ()

@end

@implementation DrawlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DrawlineView *drawline = [[DrawlineView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    drawline.center = self.view.center;
    [self.view addSubview:drawline];

    
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
