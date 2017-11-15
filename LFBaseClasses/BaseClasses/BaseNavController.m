//
//  BaseNavController.m
//  propertyMaster
//
//  Created by 希洋 on 2017/11/2.
//  Copyright © 2017年 希洋. All rights reserved.
//

#import "BaseNavController.h"


@interface BaseNavController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavController

+ (void)initialize
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    navigationBarAppearance.tintColor = [UIColor blackColor];
    [navigationBarAppearance setTintColor:[UIColor blackColor]];// 返回按钮的箭头颜色
    [navigationBarAppearance setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16],NSForegroundColorAttributeName:[UIColor blackColor]}];
//    [navigationBarAppearance setBackgroundImage:nil] forBarMetrics:UIBarMetricsDefault];
    [navigationBarAppearance setBarStyle:UIBarStyleDefault];
//    [navigationBarAppearance setShadowImage:[UIImage imageWithColor:UIColorFromHex(0xf1f1f1)]];
    //    毛玻璃效果 NO时下部View的起始Y值是navibar的底部，不设置是默认情况，起始点是navibar顶部，所以设置了他就要去设置相关界面的布局起始Y ，这个效果仅对bar有效，如果使用背景图片了，毛玻璃不会影响图片
    //    navigationBarAppearance.translucent = NO;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count) { // 隐藏导航栏
        viewController.hidesBottomBarWhenPushed = YES;
        // 自定义返回键
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setImage:[UIImage imageNamed:@"a_btn_join-1"] forState:UIControlStateNormal];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];

        // 如果自定义返回按钮后, 滑动返回可能失效, 需要添加下面的代码
        __weak typeof(viewController)Weakself = viewController;
        self.interactivePopGestureRecognizer.delegate = (id)Weakself;
    }
    [super pushViewController:viewController animated:animated];
}
- (void)back
{
    // 判断两种情况: push 和 present
    if ((self.presentedViewController || self.presentingViewController) && self.childViewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
        [self popViewControllerAnimated:YES];
}

@end
