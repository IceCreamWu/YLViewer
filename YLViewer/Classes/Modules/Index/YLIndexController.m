//
//  YLIndexController.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/15.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLIndexController.h"
#import "YLVideoController.h"

@interface YLIndexController ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YLIndexController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    self.view.backgroundColor = YLBgColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.titleLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.navigationController pushViewController:[[YLVideoController alloc] init] animated:YES];
}

#pragma mark - Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:18.f];
        _titleLabel.textColor = YLMainColor;
        _titleLabel.text = @"测试小应用";
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

@end
