//
//  NNPictureEditView.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2019/1/12.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import "NNPictureEditView.h"
#import "NNHeaderImageView.h"

@interface NNPictureEditView()

/** 索引 */
@property (nonatomic, assign) NSInteger integer;

@end

@implementation NNPictureEditView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.integer = 0;
        self.backgroundColor = [UIColor nn_backgroundColor];
        [self creatChildViews];
    }
    return self;
}

#pragma mark - 布局区域
/** 创建子视图 */
- (void)creatChildViews {
    UIButton *backButton = [self buttonWithImageName:@"photo_reset"];
    backButton.tag = 1;
    [self addSubview:backButton];
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.height.width.mas_equalTo(30);
        make.centerY.mas_equalTo(self);
    }];
    
    UIButton *downButton = [self buttonWithImageName:@"down"];
    downButton.tag = 2;
    [self addSubview:downButton];
    [downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.width.height.mas_equalTo(backButton);
    }];
    
    UIButton *filterButton = [self buttonWithImageName:@"filter"];
    filterButton.tag = 3;
    [self addSubview:filterButton];
    [filterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.width.height.mas_equalTo(backButton);
    }];
}

/** 拍照 */
- (void)takePicture:(UIButton *)sender {
    switch (sender.tag) {
        case 1: {
            if (self.bottomViewDelegate && [self.bottomViewDelegate respondsToSelector:@selector(back)]) {
                [self.bottomViewDelegate back];
            }
        }
            break;
        case 2: {
            if (self.bottomViewDelegate && [self.bottomViewDelegate respondsToSelector:@selector(downImage)]) {
                [self.bottomViewDelegate downImage];
            }
        }
            break;
        case 3: {
            NNHeaderImageView *headerImageView = [[NNHeaderImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            headerImageView.selectBlock = ^(NSInteger index) {
                self.integer = index;
                if (self.bottomViewDelegate && [self.bottomViewDelegate respondsToSelector:@selector(changeFilterWithType:)]) {
                    [self.bottomViewDelegate changeFilterWithType:index];
                }
            };
            [headerImageView showWithIndex:self.integer];
        }
            break;
            
        default:
            break;
    }
}

- (UIButton *)buttonWithImageName:(NSString *)imageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.nn_acceptEventInterval = 1;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
