//
//  NNTopView.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/12.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNTopView.h"

@implementation NNTopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self creatChildViews];
    }
    return self;
}

#pragma mark - 布局区域
/** 创建子视图 */
- (void)creatChildViews {
    UIButton *backButton = [self creatButtonWithNormalImageName:@"返回" selectedImageName:@"返回"];
    backButton.tag = 1;
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(10);
        make.height.width.mas_equalTo(30);
    }];
    
    UIButton *flashButton = [self creatButtonWithNormalImageName:@"闪光灯未点亮" selectedImageName:@"闪光灯 点亮"];
    flashButton.tag = 2;
    [flashButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.centerY.mas_equalTo(backButton);
        make.centerX.mas_equalTo(self);
    }];
    
    UIButton *reverseCameraButton = [self creatButtonWithNormalImageName:@"photo_switch" selectedImageName:@"photo_switch"];
    
    reverseCameraButton.tag = 3;
    [reverseCameraButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.centerY.mas_equalTo(backButton);
        make.right.mas_equalTo(-10);
    }];
}

/** 点击事件方法 */
- (void)buttonClick:(UIButton *)sender {
    if (self.topViewDelegate && [self.topViewDelegate respondsToSelector:@selector(buttonClicked:)]) {
        [self.topViewDelegate buttonClicked:sender];
    }
}

/** 私有方法，创建按钮 */
- (UIButton *)creatButtonWithNormalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.nn_acceptEventInterval = 1;
    [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [self addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
