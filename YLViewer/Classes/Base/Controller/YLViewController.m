//
//  YLViewController.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/16.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLViewController.h"

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBase];
}

- (void)setupBase {
    self.view.backgroundColor = YLBgColor;
}

#pragma mark - 状态栏相关
- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - 屏幕旋转相关
- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

@end
