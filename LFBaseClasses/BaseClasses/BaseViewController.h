//
//  BaseViewController.h
//  propertyMaster
//
//  Created by 希洋 on 2017/11/2.
//  Copyright © 2017年 希洋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
- (instancetype) initWithTitle:(NSString *)title;

/**
 *  是否添加导航栏用户头像Item
 */
@property (nonatomic, assign) BOOL addAvatarItem;


/**
 *  强制旋转屏幕
 *
 *  @param interfaceOrientation 方向
 */
- (void)forceChangeToOrientation:(UIInterfaceOrientation)interfaceOrientation;

/**
 *  push一个vc
 *
 *  @param vc vc
 */
- (void)push:(UIViewController*)vc;

/**
 *  当前正在显示的vc
 *
 *  @return vc
 */
+ (UIViewController *)presentingViewController;

/**
 *  推出模态窗口
 *
 *  @param viewController vc
 */
+ (void)presentViewController:(UIViewController *)viewController leftTitle:(NSString *)title;
@end
