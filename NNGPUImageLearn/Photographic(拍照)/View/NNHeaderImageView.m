//
//  NNHeaderImageView.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNHeaderImageView.h"
#import "NNHeaderImageCollectionView.h"

@interface NNHeaderImageView()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NNHeaderImageCollectionView *headerImageCollectionView;

@end

@implementation NNHeaderImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self creatChildViews];
    }
    return self;
}

#pragma mark - 布局区域
- (void)creatChildViews {
    [self addSubview:self.headerImageCollectionView];
    UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    dismissTap.delegate = self;
    [self addGestureRecognizer:dismissTap];
}

- (void)show {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    [window addSubview:self];
    NNWeakSelf
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [weakSelf.headerImageCollectionView setTransform:CGAffineTransformMakeTranslation(0, -120)];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss {
    NNWeakSelf
    [UIView animateWithDuration:0.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        weakSelf.headerImageCollectionView.transform = CGAffineTransformIdentity;
        weakSelf.backgroundColor = [UIColor clearColor];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isDescendantOfView:self.headerImageCollectionView]) {
        return NO;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark - 懒加载区域
- (NNHeaderImageCollectionView *)headerImageCollectionView {
    if (!_headerImageCollectionView) {
        NNWeakSelf
        _headerImageCollectionView = [NNHeaderImageCollectionView initNNHeaderImageCollectionView:CGRectMake(0, self.height, kScreen_width, 120) clicked:^(NSInteger type) {
            if (weakSelf.selectBlock) {
                weakSelf.selectBlock(type);
            }
        }];
    }
    return _headerImageCollectionView;
}

@end
