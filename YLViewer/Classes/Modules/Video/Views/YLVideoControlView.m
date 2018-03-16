//
//  YLVideoControlView.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/16.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLVideoControlView.h"

@interface YLVideoControlView()

@property (nonatomic, strong) UIView    *topBar;
@property (nonatomic, strong) UIView    *bottomBar;
@property (nonatomic, strong) UISlider  *slider;
@property (nonatomic, strong) UILabel   *nowTimeLabel;
@property (nonatomic, strong) UILabel   *allTimeLabel;

@end

@implementation YLVideoControlView

#pragma mark - Event Response
- (void)didSliderTouchUpInside {
    
}

- (void)didSliderValueChanged {
    
}

#pragma mark - Getter
- (UISlider *)slider {
    if (!_slider) {
        UIImage *thumbIcon = [UIImage imageWithColor:YLTintColor size:CGSizeMake(10, 10)];
        thumbIcon = [thumbIcon imageByRoundCornerRadius:5];
        UISlider *slider = [[UISlider alloc] init];
        slider.minimumValue = 0.f;
        [slider setThumbImage:thumbIcon forState:UIControlStateNormal];
        [slider addTarget:self action:@selector(didSliderTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
        [slider addTarget:self action:@selector(didSliderValueChanged) forControlEvents:UIControlEventValueChanged];
        [slider setMinimumTrackTintColor:YLTintColor];
        [slider setMaximumTrackTintColor:UIColorHex(000000)];
        _slider = slider;
    }
    return _slider;
}

- (UILabel *)nowTimeLabel {
    if (!_nowTimeLabel) {
        _nowTimeLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:10];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"00:00:00";
            [label sizeToFit];
            label;
        });
    }
    return _nowTimeLabel;
}

- (UILabel *)allTimeLabel {
    if (!_allTimeLabel) {
        _allTimeLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.textColor = [UIColor whiteColor];
            label.font = [UIFont systemFontOfSize:10];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"00:00:00";
            [label sizeToFit];
            label;
        });
    }
    return _allTimeLabel;
}

@end
