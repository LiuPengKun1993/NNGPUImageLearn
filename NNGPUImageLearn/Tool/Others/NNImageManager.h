//
//  NNImageManager.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2019/1/12.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNImageManager : NSObject

+ (instancetype)shareManager;

- (NSString *)storeImage:(UIImage *)image;

- (NSArray *)listImageFilePath;

- (NSString *)storePath;

- (UIImage *)loadImage:(NSString *)name;

- (BOOL)deleteImage:(NSString *)filename;

@end

NS_ASSUME_NONNULL_END
