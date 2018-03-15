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
    [self setup];
}

- (void)setup {
    self.navigationBar.barStyle = UIBarStyleBlack;
}

@end
