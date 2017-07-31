//
//  CAShapeLayerViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/27.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "CAShapeLayerViewController.h"
#import "SuccessView.h"
#import "CheckAnimationButtonLayer.h"
#import "CircleView.h"



@interface CAShapeLayerViewController ()

@property (nonatomic, strong) CheckAnimationButtonLayer *checkLayer;

@end


#if 0
//  路径
@property(nullable) CGPathRef path;
// 填充色
@property(nullable) CGColorRef fillColor;
// 描边色
@property(nullable) CGColorRef strokeColor;
// path路径开始位置  0 - 1
@property CGFloat strokeStart;
// path路径结束位置 0 - 1
@property CGFloat strokeEnd;
// 线条宽度
@property CGFloat lineWidth;
// 线条首尾外观
@property(copy) NSString *lineCap;
// 线条交接处外观
@property(copy) NSString *lineJoin;


#endif

@implementation CAShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"CAShapeLayer";
    
    
//    SuccessView *success = [[SuccessView alloc] initWithFrame:CGRectMake(50, 50, self.view.frame.size.width/2 - 25, 100)];
//    [self.view addSubview:success];
    

    
    
    CheckAnimationButtonLayer *checkview = [[CheckAnimationButtonLayer alloc] init];
    checkview.frame = CGRectMake(100, 100, 130, 50);
    self.checkLayer = checkview;
    [self.view addSubview:checkview];
    
    
//    CircleView *circel = [[CircleView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    circel.center = self.view.center;
//    [self.view addSubview:circel];
    
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.checkLayer resetView];
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
