//
//  NNPictureEditController.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2019/1/12.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import "NNPictureEditController.h"
#import "NNPictureEditView.h"
#import "NNImageManager.h"
#import <Photos/Photos.h>

@interface NNPictureEditController ()<NNPictureEditViewDelegate>

/** 底部视图 */
@property (nonatomic, strong) NNPictureEditView *bottomView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation NNPictureEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.imageView];
}

#pragma mark - 代理区域
/** 返回拍照界面 */
- (void)back {
    [self dismissViewControllerAnimated:NO completion:nil];
}

/** 保存图片 */
- (void)downImage {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:self.presentImage];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD showMBPAlertView:@"保存图片成功😁" withSecond:2];
                [self back];
            });
        }
    }];
}

/** 更改滤镜 */
- (void)changeFilterWithType:(NSInteger)type {
    
}

#pragma mark - 懒加载区域
- (NNPictureEditView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[NNPictureEditView alloc] initWithFrame:CGRectMake(0, kSafeAreaHeight-120, kScreen_width, 120)];
        _bottomView.bottomViewDelegate = self;
    }
    return _bottomView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreen_width, kSafeAreaHeight-120)];
        _imageView.image = self.presentImage;
    }
    return _imageView;
}

@end
