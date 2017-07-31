//
//  GifViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/28.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "GifViewController.h"
#import "UIImageView+DWGifTool.h"
@interface GifViewController ()
@property (nonatomic) UIImageView * gif;
@end

@implementation GifViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Gif";
    
    UIImageView * gif = [[UIImageView alloc] initWithGifPathString:[[NSBundle mainBundle] pathForResource:@"duizhang" ofType:@"gif"] repeatCount:MAXFLOAT];
    [self.view addSubview:gif];
    gif.contentMode = UIViewContentModeScaleAspectFit;
    
    self.gif = gif;
    
    UIButton * btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [btn setFrame:CGRectMake(0, 0, 100, 100)];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

-(void)btnAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.gif suspendGif];
    }
    else
    {
        [self.gif resumeGif];
    }
}

@end
