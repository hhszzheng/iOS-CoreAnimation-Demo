//
//  LottieMostStarAnimationViewController.m
//  iOS-CoreAnimation Demo
//
//  Created by zyf on 2017/5/8.
//  Copyright © 2017年 zyf. All rights reserved.
//

#import "LottieMostStarAnimationViewController.h"

@interface LottieMostStarAnimationViewController ()
@property (nonatomic , strong) UIView *demoView;

@property (nonatomic, strong) LOTAnimationView *lottieLogo;

@end

@implementation LottieMostStarAnimationViewController
-(void)initView{
    [super initView];
    

    self.view.backgroundColor = [UIColor cyanColor];
    
    
    
}
-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"favourite_app_icon",@"progress_bar",@"location_pin",@"progress_success",@"preloader",@"pencil_write",@"day_night_cycle", nil];
}

-(void)clickBtn : (UIButton *)btn{
    [self.lottieLogo pause];
    [self.lottieLogo removeFromSuperview];
    
    switch (btn.tag) {
        case 0:
            [self favourite_app_icon];
            break;
        case 1:
            [self progress_bar];
            break;
        case 2:
            [self location_pin];
            break;
        case 3:
            [self progress_success];
            break;
        case 4:
            [self preloader];
            break;
        case 5:
            [self pencil_write];
            break;
        case 6:
            [self day_night_cycle];
            break;
            
        default:
            break;
    }
}

- (void)favourite_app_icon{
    
    self.lottieLogo = [LOTAnimationView animationNamed:@"favourite_app_icon"];
    self.lottieLogo.loopAnimation = YES;
    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.lottieLogo];
    self.lottieLogo.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-100);
    [self.lottieLogo play];
    
    
}

- (void)progress_bar{
    self.lottieLogo = [LOTAnimationView animationNamed:@"progress_bar"];
    self.lottieLogo.loopAnimation = YES;

    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.lottieLogo];
    self.lottieLogo.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-100);
    [self.lottieLogo play];
    
}
- (void)location_pin{
    self.lottieLogo = [LOTAnimationView animationNamed:@"location_pin"];
    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    self.lottieLogo.loopAnimation = YES;

    [self.view addSubview:self.lottieLogo];
    self.lottieLogo.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-100);
    [self.lottieLogo play];
    
}

- (void)progress_success{
    self.lottieLogo = [LOTAnimationView animationNamed:@"progress_success"];
    self.lottieLogo.loopAnimation = YES;

    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.lottieLogo];
    self.lottieLogo.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-100);
    [self.lottieLogo play];
    
}
- (void)preloader{
    self.lottieLogo = [LOTAnimationView animationNamed:@"preloader"];
    self.lottieLogo.loopAnimation = YES;

    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.lottieLogo];
    self.lottieLogo.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-100);
    [self.lottieLogo play];
    
}

- (void)pencil_write{
    
    self.lottieLogo = [LOTAnimationView animationNamed:@"pencil_write"];
    self.lottieLogo.loopAnimation = YES;
    
    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.lottieLogo];
    self.lottieLogo.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-100);
    [self.lottieLogo play];
}

- (void)day_night_cycle{
    self.lottieLogo = [LOTAnimationView animationNamed:@"day_night_cycle"];
    self.lottieLogo.loopAnimation = YES;
    
    self.lottieLogo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.lottieLogo];
    self.lottieLogo.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-100);
    [self.lottieLogo play];
}







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
