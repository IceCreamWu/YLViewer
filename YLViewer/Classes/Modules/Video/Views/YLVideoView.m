//
//  YLVideoView.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/14.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLVideoView.h"
#import <AVKit/AVKit.h>

@interface YLVideoView()

@property (nonatomic, strong) AVPlayer      *player;
@property (nonatomic, strong) AVPlayerItem  *playerItem;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@end

@implementation YLVideoView

- (void)playWithURL:(NSURL *)url {
    if (self.playerLayer) {
        [self.playerLayer removeFromSuperlayer];
    }
    self.player = [[AVPlayer alloc] initWithURL:url];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = self.bounds;
    [self.layer addSublayer:self.playerLayer];
    [self.player play];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.playerLayer.frame = self.bounds;
}

@end
