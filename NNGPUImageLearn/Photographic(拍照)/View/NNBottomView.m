//
//  NNBottomView.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNBottomView.h"
#import "NNHeaderImageView.h"

@interface NNBottomView()

@end

@implementation NNBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor nn_backgroundColor];
        [self creatChildViews];
    }
    return self;
}

#pragma mark - 布局区域
/** 创建子视图 */
- (void)creatChildViews {
    UIButton *imageButton = [self buttonWithFrame:CGRectMake(self.width/2.0-25, self.height/2.0-25, 50, 50) imageName:@"photo_unselect"];
    imageButton.hidden = YES;
    imageButton.tag = 1;
    [self addSubview:imageButton];
    [imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(60);
        make.height.mas_equalTo(36);
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(self);
    }];
    
    UIButton *takePhotoButton = [self buttonWithFrame:CGRectMake((self.width-CGRectGetMaxX(imageButton.frame))/2-15, self.height/2.0-15, 30, 30) imageName:@"photo_unselect"];
    takePhotoButton.tag = 2;
    [self addSubview:takePhotoButton];
    [takePhotoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(50);
        make.center.mas_equalTo(self);
    }];
    
    UIButton *filterButton = [self buttonWithFrame:CGRectMake((self.width-CGRectGetMaxX(imageButton.frame))/2-15, self.height/2.0-15, 30, 30) imageName:@"filter"];
    filterButton.tag = 3;
    [self addSubview:filterButton];
    [filterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(40);
        make.right.mas_equalTo(-20);
        make.centerY.mas_equalTo(imageButton);
    }];
}

/** 拍照 */
- (void)takePicture:(UIButton *)sender {
    switch (sender.tag) {
        case 1: {
            if (self.bottomViewDelegate && [self.bottomViewDelegate respondsToSelector:@selector(imageButtonClick)]) {
                [self.bottomViewDelegate imageButtonClick];
            }
        }
            break;
        case 2: {
            if (self.bottomViewDelegate && [self.bottomViewDelegate respondsToSelector:@selector(takePhoto)]) {
                [self.bottomViewDelegate takePhoto];
            }
        }
            break;
        case 3: {
            NNHeaderImageView *headerImageView = [[NNHeaderImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            headerImageView.selectBlock = ^(NSInteger index) {
                if (self.bottomViewDelegate && [self.bottomViewDelegate respondsToSelector:@selector(changeFilterWithType:)]) {
                    [self.bottomViewDelegate changeFilterWithType:index];
                }
            };
            [headerImageView show];
        }
            break;
        default:
            break;
    }
}

- (UIButton *)buttonWithFrame:(CGRect)frame imageName:(NSString *)imageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.nn_acceptEventInterval = 1;
    button.frame = frame;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
