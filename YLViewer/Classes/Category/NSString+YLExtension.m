//
//  NSString+YLExtension.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/16.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "NSString+YLExtension.h"

@implementation NSString (YLExtension)

+ (NSString *)yl_stringWithFileSize:(NSUInteger)fileSize {
    if (fileSize >= 1024 * 1024 * 1024) {
        return [NSString stringWithFormat:@"%.1fG", (float)fileSize / (1024 * 1024 * 1024)];
    }
    else if (fileSize >= 1024 * 1024) {
        return [NSString stringWithFormat:@"%.1fMB", (float)fileSize / (1024 * 1024)];
    }
    else if (fileSize >= 1024) {
        return [NSString stringWithFormat:@"%.1fKB", (float)fileSize / 1024];
    }
    else {
        return [NSString stringWithFormat:@"%dB", (int)fileSize];
    }
}

@end
