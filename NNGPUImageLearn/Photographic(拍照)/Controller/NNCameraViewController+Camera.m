//
//  NNCameraViewController+Camera.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/12.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNCameraViewController+Camera.h"
#import "NNCameraViewController.h"

@implementation NNCameraViewController (Camera)

/** 更换前后摄像头 */
- (void)createdGPUImageCamera:(BOOL)isFanZhuan {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.stillCamera != nil) {
            [self.filter removeAllTargets];
            [self.stillCamera removeAllTargets];
        }
        if (isFanZhuan) {
            self.stillCamera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionFront];
        } else {
            self.stillCamera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionBack];
        }
        self.stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
        self.stillCamera.horizontallyMirrorFrontFacingCamera = YES;
        self.filter = self.filterModel.filterArray[self.type];
        [self.stillCamera addTarget:self.filter];
        [self.filter addTarget:self.imageView];
        [self.stillCamera startCameraCapture];
    });
}

/** 重制闪光灯模式 */
- (void)resetFlashMode:(BOOL)isOpen {
    AVCaptureTorchMode mode;
    if (isOpen) {
        mode = AVCaptureTorchModeOn;
    } else {
        mode = AVCaptureTorchModeOff;
    }
    [self.stillCamera.inputCamera lockForConfiguration:nil];
    [self.stillCamera.inputCamera setTorchMode:mode];
    [self.stillCamera.inputCamera unlockForConfiguration];
}

@end
