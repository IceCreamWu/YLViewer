//
//  YLNavigationController.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/15.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLNavigationController.h"

@interface YLNavigationController ()

@end

@implementation YLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBase];
}

- (void)setupBase {
    [UINavigationBar appearance].barTintColor = YLNavigationColor;
}

#pragma mark - 状态栏相关
- (BOOL)prefersStatusBarHidden {
    return self.topViewController.prefersStatusBarHidden;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.topViewController.preferredStatusBarStyle;
}

#pragma mark - 屏幕旋转相关
- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.topViewController.preferredInterfaceOrientationForPresentation;
}

@end
