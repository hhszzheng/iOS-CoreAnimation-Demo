//
//  RootViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/4/27.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "RootViewController.h"
#import "CAShapeLayerViewController.h"
#import "UIBezierPathViewController.h"
#import "CABasicAnimationViewController.h"
#import "CAkeyFrameAnimationViewController.h"
#import "CAGroupAnimationViewController.h"
#import "CATransitionAnimationViewController.h"
#import "WaveViewController.h"
#import "GifViewController.h"
#import "XianYuViewController.h"
#import "DrawlineViewController.h"
#import "AliPayAnimationViewController.h"
#import "LottieViewController.h"
@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *rootTableView;

@property (nonatomic, strong) NSArray *dateSourceArr;



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画";
    
    
    
    
    
    [self.view addSubview:self.rootTableView];
    
}
- (NSArray *)dateSourceArr{
    if (!_dateSourceArr) {
        _dateSourceArr = [NSArray array];
        _dateSourceArr = @[@"CAShapeLayer",@"贝塞尔曲线",@"基础动画",@"关键帧动画",@"组动动画",@"转场动画",@"波浪",@"Gif",@"咸鱼",@"画线",@"支付宝动画",@"Lottie动画"];
    }
    return _dateSourceArr;
}



- (UITableView *)rootTableView{
    if (!_rootTableView) {
        _rootTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _rootTableView.delegate = self;
        _rootTableView.dataSource = self;
        
    }
    return _rootTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dateSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell_id"];
    }
    cell.textLabel.text = _dateSourceArr[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIViewController *viewController;
    
    switch (indexPath.row) {
        case 0:
            viewController = [[CAShapeLayerViewController alloc] init];
            break;
        case 1:
            viewController = [[UIBezierPathViewController alloc] init];
            break;
        case 2:
            viewController = [[CABasicAnimationViewController alloc] init];
            break;
        case 3:
            viewController = [[CAkeyFrameAnimationViewController alloc] init];
            break;
        case 4:
            viewController = [[CAGroupAnimationViewController alloc] init];
            break;
        case 5:
            viewController = [[CATransitionAnimationViewController alloc] init];
            break;
        case 6:
            viewController = [[WaveViewController alloc] init];
            break;
        case 7:
            viewController = [[GifViewController alloc] init];
            break;
        case 8:
            viewController = [[XianYuViewController alloc] init];
            break;
        case 9:
            viewController = [[DrawlineViewController alloc] init];
            break;
        case 10:
            viewController = [[AliPayAnimationViewController alloc] init];
            break;
        case 11:
            viewController = [[LottieViewController alloc] init];
            break;


        default:
            break;
    }
    //调用pushFrontViewController进行页面切换
    [self.navigationController pushViewController:viewController animated:YES];
    
    
}









@end
