//
//  YLIndexModel.h
//  YLViewer
//
//  Created by wuyonglin on 2018/3/16.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLIndexModel : NSObject

@property (nonatomic, copy  ) NSString  *name;          // 文件名
@property (nonatomic, copy  ) NSString  *path;          // 文件路径
@property (nonatomic, assign) NSInteger size;           // 文件大小（单位：字节）
@property (nonatomic, assign) NSInteger videoDuration;  // 视频长度（单位：秒）
@property (nonatomic, strong) UIImage   *image;         // 视频缩略图

+ (void)fetchLocalDataWithCompletion:(void (^)(NSArray<YLIndexModel *> *models))completion;

@end
