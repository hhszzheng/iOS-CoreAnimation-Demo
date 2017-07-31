//
//  XianYuViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/28.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "XianYuViewController.h"
#import "pushView.h"
@interface XianYuViewController ()
@property(strong,nonatomic)pushView *myPushView;
@end

@implementation XianYuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"咸鱼";
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeBack"]];
    imageview.frame=CGRectMake(0, 0, ScreenWidth, ScreenHeight-64);
    
    [self.view addSubview:imageview];
    
    
    pushView *myview=[pushView new];
    
    self.myPushView=myview;
    
    
    
    
    UIButton *addbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [addbtn setImage:[UIImage imageNamed:@"post_animate_add"] forState:UIControlStateNormal];
    [addbtn sizeToFit];
    
    [self.view addSubview:addbtn];
    
    addbtn.center=CGPointMake(ScreenWidth/2, ScreenHeight-44-64);
    
    [addbtn addTarget:self action:@selector(pushClick) forControlEvents:UIControlEventTouchUpInside];
    //[myview pushButton];
    
    
}

//出现动画
-(void)pushClick
{
    
    [self.view addSubview:self.myPushView];
    [self.myPushView pushButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
