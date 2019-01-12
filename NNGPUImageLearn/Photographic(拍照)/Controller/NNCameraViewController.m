//
//  NNCameraViewController.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNCameraViewController.h"
#import "NNCameraViewController+Camera.h"
#import "NNTopView.h"
#import "NNBottomView.h"

@interface NNCameraViewController ()<NNTopViewDelegate, NNBottomViewDelegate>

@property (nonatomic, strong) NNTopView *topView;
@property (nonatomic, strong) NNBottomView *bottomView;

@end

@implementation NNCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configCamera];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.bottomView];
}

/** 配置相机 */
- (void)configCamera {
    // 初始化相机
    self.stillCamera = [[GPUImageStillCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraPosition:AVCaptureDevicePositionBack];
    // 竖屏方向
    self.stillCamera.outputImageOrientation = UIInterfaceOrientationPortrait;
    self.stillCamera.horizontallyMirrorFrontFacingCamera = YES;
    
    // 初始化GPUImageView
    self.imageView = [[GPUImageView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:self.imageView];
    [self.stillCamera addTarget:self.imageView];
    [self.stillCamera startCameraCapture];
}

#pragma mark - 代理区域
/** 顶部按钮点击事件 */
- (void)buttonClicked:(UIButton *)sender {
    switch (sender.tag) {
        case 1: // 返回
            [self dismissViewControllerAnimated:NO completion:nil];
            break;
        case 2: // 闪光灯
        {
            if (self.stillCamera.cameraPosition == AVCaptureDevicePositionFront) {
                return;
            }
            sender.selected = !sender.selected;
            [self resetFlashMode:sender.selected];
        }
            break;
        case 3: // 反转摄像头
            sender.selected = !sender.selected;
            [self createdGPUImageCamera:sender.selected];
            break;
    }
}

/** 拍照 */
- (void)takePhoto {
    
}

/** 更换滤镜 */
- (void)changeFilterWithType:(NSInteger)type {
    self.type = type;
    self.filter = self.filterModel.filterArray[type];
    [self.stillCamera removeAllTargets];
    [self.stillCamera addTarget:self.filter];
    [self.filter addTarget:self.imageView];
}

#pragma mark - 懒加载区域
- (NNTopView *)topView {
    if (!_topView) {
        _topView = [[NNTopView alloc] initWithFrame:CGRectMake(0, 0, kScreen_width, 50)];
        _topView.topViewDelegate = self;
    }
    return _topView;
}

- (NNBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[NNBottomView alloc] initWithFrame:CGRectMake(0, kSafeAreaHeight-120, kScreen_width, 120)];
        _bottomView.bottomViewDelegate = self;
    }
    return _bottomView;
}

- (NNFilterModel *)filterModel {
    if (!_filterModel) {
        _filterModel = [[NNFilterModel alloc] init];
    }
    return _filterModel;
}

@end
