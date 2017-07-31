//
//  LottieViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/8.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "LottieViewController.h"
#import <lottie/Lottie.h>

@interface LottieViewController ()<UITableViewDelegate,UITableViewDataSource>



@property (nonatomic, strong) UITableView *lottieTableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation LottieViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"lottie";
    
    
    [self.view addSubview:self.lottieTableView];
    [self.lottieTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    self.dataArray = @[@{@"name" : @"Animated lottieLogo",
                         @"vc" : @"LottieLogoViewController"},
                       @{@"name" : @"Animation Explorer",
                         @"vc" : @"AnimationExplorerViewController"},
                       @{@"name" : @"Animated Refresh Demo",
                         @"vc" : @"RefreshViewController"},
                       @{@"name" : @"Animated Transitions Demo",
                         @"vc" : @"AnimationTransitionViewController"},
                       @{@"name" : @"Lottie MostStarAnimation Demo",
                         @"vc" : @"LottieMostStarAnimationViewController"}];
    
    
}



- (UITableView *)lottieTableView{
    if (!_lottieTableView) {
        _lottieTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _lottieTableView.delegate = self;
        _lottieTableView.dataSource = self;
    }
    return _lottieTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.row][@"name"];
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *vcClassName = self.dataArray[indexPath.row][@"vc"];
    Class vcClass = NSClassFromString(vcClassName);
    if (vcClass) {
        UIViewController *vc = [[vcClass alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
