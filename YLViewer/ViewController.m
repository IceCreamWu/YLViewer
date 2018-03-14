//
//  ViewController.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/14.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "ViewController.h"
#import "YLVideoView.h"

@interface ViewController ()

@property (nonatomic, strong) YLVideoView *videoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)setup {
    [self.view setBackgroundColor:[UIColor whiteColor]];;
    [self.view addSubview:self.videoView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"mp4"];
    NSURL *videoURL = [NSURL fileURLWithPath:path];
    [self.videoView playWithURL:videoURL];
}

#pragma mark - Getter
- (YLVideoView *)videoView {
    if (!_videoView) {
        _videoView = [[YLVideoView alloc] initWithFrame:CGRectMake(0, 44, self.view.width, self.view.width * 0.75)];
        _videoView.backgroundColor = [UIColor blackColor];
    }
    return _videoView;
}

@end
