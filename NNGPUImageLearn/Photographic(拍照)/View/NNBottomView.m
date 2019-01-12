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
    UIButton *imageButton = [self buttonWithFrame:CGRectMake(self.width/2.0-25, self.height/2.0-25, 50, 50) imageName:@"picture"];
    imageButton.tag = 1;
    [self addSubview:imageButton];
    
    UIButton *filterButton = [self buttonWithFrame:CGRectMake((self.width-CGRectGetMaxX(imageButton.frame))/2-15, self.height/2.0-15, 30, 30) imageName:@"filter"];
    filterButton.tag = 2;
    [self addSubview:filterButton];
}

/** 拍照 */
- (void)takePicture:(UIButton *)sender {
    if (sender.tag == 1) {
        if (self.bottomViewDelegate && [self.bottomViewDelegate respondsToSelector:@selector(takePhoto)]) {
            [self.bottomViewDelegate takePhoto];
        }
    } else {
        NNHeaderImageView *headerImageView = [[NNHeaderImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        headerImageView.selectBlock = ^(NSInteger index) {
            if (self.bottomViewDelegate && [self.bottomViewDelegate respondsToSelector:@selector(changeFilterWithType:)]) {
                [self.bottomViewDelegate changeFilterWithType:index];
            }
        };
        [headerImageView show];
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
