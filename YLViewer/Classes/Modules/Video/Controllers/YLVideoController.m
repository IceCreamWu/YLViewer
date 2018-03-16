//
//  YLVideoController.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/15.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLVideoController.h"
#import "YLVideoView.h"

@interface YLVideoController ()

@property (nonatomic, strong) NSString *videoPath;

@property (nonatomic, strong) YLVideoView *videoView;

@end

@implementation YLVideoController

- (instancetype)initWithPath:(NSString *)path {
    self = [super init];
    if (self) {
        self.videoPath = path;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.videoView];
    
    NSURL *videoURL = [NSURL fileURLWithPath:self.videoPath];
    [self.videoView playWithURL:videoURL];
}

#pragma mark - 屏幕旋转相关
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

#pragma mark - Getter
- (YLVideoView *)videoView {
    if (!_videoView) {
        _videoView = [[YLVideoView alloc] initWithFrame:self.view.bounds];
        _videoView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _videoView;
}

@end
