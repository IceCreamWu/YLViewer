//
//  YLIndexCell.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/16.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLIndexCell.h"
#import "YLIndexModel.h"
#import "NSString+YLExtension.h"

#define kYLIndexCellSpace   (10.f)

@interface YLIndexCell()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *sizeLabel;
@property (nonatomic, strong) UILabel *recordLabel;

@end

@implementation YLIndexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self.contentView addSubview:self.coverImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.sizeLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat contentW = self.contentView.width;
    CGFloat contentH = self.contentView.height;
    CGFloat coverImageH = contentH - kYLIndexCellSpace * 2;
    CGFloat coverImageW = coverImageH * 12.f / 7.f;
    
    self.coverImageView.size = CGSizeMake(coverImageW, coverImageH);
    self.coverImageView.left = kYLIndexCellSpace;
    self.coverImageView.centerY = contentH / 2;
    
    self.nameLabel.width = MAX(0, (contentW - kYLIndexCellSpace) - (self.coverImageView.right + kYLIndexCellSpace));
    self.nameLabel.left = self.coverImageView.right + kYLIndexCellSpace;
    self.nameLabel.top = self.coverImageView.top;
    
    self.sizeLabel.width = coverImageW;
    self.sizeLabel.left = self.nameLabel.left;
    self.sizeLabel.bottom = self.coverImageView.bottom;
}

#pragma mark - Setter
- (void)setModel:(YLIndexModel *)model {
    _model = model;
    self.coverImageView.image = model.image;
    self.nameLabel.text = model.name;
    self.sizeLabel.text = [NSString yl_stringWithFileSize:model.size];
}

//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
//    [super setHighlighted:highlighted animated:animated];
//    if (highlighted) {
//        self.contentView.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
//    }
//    else {
//        self.contentView.backgroundColor = [UIColor whiteColor];
//    }
//}

#pragma mark - Getter
- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.backgroundColor = [UIColor blackColor];
    }
    return _coverImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14.f];
        _nameLabel.textColor = UIColorHex(333333);
        _nameLabel.text = @"demo";
        [_nameLabel sizeToFit];
    }
    return _nameLabel;
}

- (UILabel *)sizeLabel {
    if (!_sizeLabel) {
        _sizeLabel = [[UILabel alloc] init];
        _sizeLabel.font = [UIFont systemFontOfSize:12.f];
        _sizeLabel.textColor = UIColorHex(999999);
        _sizeLabel.text = @"0M";
        [_sizeLabel sizeToFit];
    }
    return _sizeLabel;
}

@end
