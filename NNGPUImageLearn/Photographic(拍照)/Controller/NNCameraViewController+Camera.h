//
//  NNCameraViewController+Camera.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/12.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNCameraViewController.h"

@interface NNCameraViewController (Camera)

/** 更换前后摄像头 */
- (void)createdGPUImageCamera:(BOOL)isFanZhuan;
/** 重制闪光灯模式 */
- (void)resetFlashMode:(BOOL)isOpen;

@end
