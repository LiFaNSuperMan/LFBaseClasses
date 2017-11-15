//
//  BaseViewController.m
//  propertyMaster
//
//  Created by 希洋 on 2017/11/2.
//  Copyright © 2017年 希洋. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavController.h"

@interface BaseViewController ()<UINavigationControllerDelegate>

@end

@implementation BaseViewController

- (instancetype) initWithTitle:(NSString *)title {
    self = [super init];
    if(self){
        self.title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
 //   [self bk_removeAllBlockObservers];
    //    NSLog(@" %@ 控制器被销毁", self);
}
#pragma mark - 自定义方法



//push vc
- (void)push:(UIViewController*)vc{
    [self.navigationController pushViewController:vc animated:YES];
}

//不可自动旋转
- (BOOL)shouldAutorotate{
    return NO;
}

//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

// 强制横/竖屏
- (void)forceChangeToOrientation:(UIInterfaceOrientation)interfaceOrientation{
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:interfaceOrientation] forKey:@"orientation"];
}

//当前显示的ViewController
+ (UIViewController *)presentingViewController{
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result topViewController];
    }
    return result;
}

//推出模态VC
+ (void)presentViewController:(UIViewController *)viewController leftTitle:(NSString *)title{
    UINavigationController *nav = [[BaseNavController alloc] initWithRootViewController:viewController];
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                       initWithTitle:(title == nil ? @"关闭" : title)
                                                       style:UIBarButtonItemStylePlain
                                                       target:viewController
                                                       action:@selector(dismissModalViewControllerAnimated:)];
    [[self presentingViewController] presentViewController:nav animated:YES completion:nil];
}
@end
