//
//  RootTabbarController.m
//  ManagementSystem
//
//  Created by JCong on 16/2/27.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "RootTabbarController.h"
#import "HomeViewController.h"
#import "ClassifyViewController.h"
#import "MessageViewController.h"
#import "InfoViewController.h"
#import "LoginViewController.h"
@interface RootTabbarController ()

@end

@implementation RootTabbarController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.tabBar setTintColor:RGB(53, 182, 169)];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"]];
    [self setTabBarController];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];

//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"] forBarMetrics:UIBarMetricsDefault];
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
#pragma mark TabBarView
- (void)setTabBarController{
    
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self setUpOneChildViewController:homeVC Homepage:[UIImage imageNamed:@"home"] Selected:[UIImage imageNamed:@""] title:@"首页"];
    ClassifyViewController *classifyVC = [[ClassifyViewController alloc] init];
        [self setUpOneChildViewController:classifyVC Homepage:[UIImage imageNamed:@"category"] Selected:[UIImage imageNamed:@""] title:@"分类"];
    
    MessageViewController *messageVC = [[MessageViewController alloc] init];
        [self setUpOneChildViewController:messageVC Homepage:[UIImage imageNamed:@"message"] Selected:[UIImage imageNamed:@""] title:@"消息"];
    
    InfoViewController *infoVC = [[InfoViewController alloc] init];
        [self setUpOneChildViewController:infoVC Homepage:[UIImage imageNamed:@"me"] Selected:[UIImage imageNamed:@""] title:@"我的"];
    
    
}

#pragma mark 快速创建TabBarView模板
- (void)setUpOneChildViewController:(UIViewController *)viewController Homepage:(UIImage *)homepage Selected:(UIImage *)selectedImage title:(NSString *)title{

    
    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:viewController];
//        navC.title = title; // 标题
    //    navC.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[homepage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]selectedImage:selectedImage];
    
    navC.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:homepage selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"] forBarMetrics:UIBarMetricsDefault];    //设置tabbar的背景图片
//    [navC.navigationBar setTranslucent:NO];  // 不透明
    [self addChildViewController:navC];
}

@end
