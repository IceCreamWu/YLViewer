//
//  YLIndexModel.m
//  YLViewer
//
//  Created by wuyonglin on 2018/3/16.
//  Copyright © 2018年 IceCreamWu. All rights reserved.
//

#import "YLIndexModel.h"
#import <AVFoundation/AVFoundation.h>

@implementation YLIndexModel

+ (void)fetchLocalDataWithCompletion:(void (^)(NSArray<YLIndexModel *> *))completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableArray *models = [[NSMutableArray alloc] init];
        NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSArray *fileNames = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentPath error:nil];
        for (NSString *fileName in fileNames) {
            if ([YLVideoFormats containsObject:fileName.pathExtension.lowercaseString]) {
                YLIndexModel *indexModel = [[YLIndexModel alloc] init];
                indexModel.name = fileName;
                indexModel.path = [documentPath stringByAppendingPathComponent:fileName];
                indexModel.size = [[NSFileManager defaultManager] attributesOfItemAtPath:indexModel.path error:nil].fileSize;
                [indexModel updateWithVideoPath:indexModel.path];
                [models addObject:indexModel];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(models);
            }
        });
    });
}

- (void)updateWithVideoPath:(NSString *)videoPath {
    NSURL *videoURL = [NSURL fileURLWithPath:videoPath];
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:videoURL options:nil];
    
    // 获取视频长度
    NSTimeInterval videoDuration = asset.duration.value / asset.duration.timescale;
    self.videoDuration = videoDuration;
    
    // 默认取第5分钟的视频截图，如果视频长度小于5分钟，则取视频长度的一半
    NSTimeInterval frameTime = 300;
    if (frameTime >= videoDuration) {
        frameTime = videoDuration / 2;
    }
    
    AVAssetImageGenerator *generator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    generator.appliesPreferredTrackTransform = YES;
    generator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    NSError *error = nil;
    CGImageRef imageRef = [generator copyCGImageAtTime:CMTimeMakeWithSeconds(frameTime, asset.duration.timescale) actualTime:NULL error:&error];
    if (error) {
        self.image = nil;
    }
    else {
        self.image = imageRef ? [[UIImage alloc] initWithCGImage:imageRef] : nil;
    }
}

@end
