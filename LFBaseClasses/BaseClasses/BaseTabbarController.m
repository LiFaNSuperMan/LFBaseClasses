//
//  BaseTabbarController.m
//  propertyMaster
//
//  Created by 希洋 on 2017/11/2.
//  Copyright © 2017年 希洋. All rights reserved.
//

#import "BaseTabbarController.h"
#import "BaseNavController.h"

@interface BaseTabbarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.tabBar.translucent = NO;
    [self setup];
}

- (void)setup
{
          // 初始化各个控制器
}
- (void)addChildViewController:(UIViewController *)childController imageNamed:(NSString *)imageName title:(NSString *)title
{
    BaseNavController *nav = [[BaseNavController alloc] initWithRootViewController:childController];
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_pre", imageName]];
    childController.tabBarItem.title = title;
    childController.title = title;
    // 设置图片居中, 这儿需要注意top和bottom必须绝对值一样大
  //  childController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    // 设置导航栏为透明的
    //    if ([childController isKindOfClass:[ProfileController class]]) {
    //        [nav.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //        nav.navigationBar.shadowImage = [[UIImage alloc] init];
    //        nav.navigationBar.translucent = YES;
    //    }
    [self addChildViewController:nav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    // do something
    return YES;
}

@end
