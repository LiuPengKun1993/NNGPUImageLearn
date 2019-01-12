//
//  NNView.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/12.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNView.h"

@implementation NNView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self creatChildViews];
    }
    return self;
}

#pragma mark - 布局区域
/** 创建子视图 */
- (void)creatChildViews {
    [self creatBackgroundImage];
    [self creatButtons];
}

/** 背景图 */
- (void)creatBackgroundImage {
    GPUImageGaussianBlurFilter *filter = [[GPUImageGaussianBlurFilter alloc] init];
    filter.texelSpacingMultiplier = 3;
    UIImage *image = [UIImage imageNamed:@"lufei"];
    [filter forceProcessingAtSize:image.size];
    GPUImagePicture *picture = [[GPUImagePicture alloc] initWithImage:image];
    [picture addTarget:filter];
    [picture processImage];
    [filter useNextFrameForImageCapture];
    UIImage *newImage = [filter imageFromCurrentFramebuffer];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:newImage];
    [self addSubview:backgroundImage];
    [backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

/** 两个按钮 */
- (void)creatButtons {
    UIButton *photoButton = [self creatButtonWithimageName:@"photo" title:@"美颜相机"];
    photoButton.tag = 1;
    
    UIButton *videoButton = [self creatButtonWithimageName:@"video" title:@"美颜视频"];
    videoButton.tag = 2;
    
    NSMutableArray *masonryArray = [NSMutableArray array];
    [masonryArray addObject:photoButton];
    [masonryArray addObject:videoButton];
    
    [masonryArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:30 tailSpacing:30];
    [masonryArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
}

/** 创建按钮 */
- (UIButton *)creatButtonWithimageName:(NSString *)imageName title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.nn_acceptEventInterval = 1;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor yellowColor];
    CGFloat imageWith = button.imageView.intrinsicContentSize.width;
    CGFloat imageHeight = button.imageView.intrinsicContentSize.height;
    CGFloat labelWidth = button.titleLabel.intrinsicContentSize.width;
    CGFloat labelHeight = button.titleLabel.intrinsicContentSize.height;
    
    button.imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - 10/2.0, 0, 0, -labelWidth-10);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith + 10/2, -imageHeight-10/2.0, 0);
    [self addSubview:button];
    return button;
}

#pragma mark - 事件处理区域
- (void)buttonClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(buttonClickWithType:)]) {
        [self.delegate buttonClickWithType:sender.tag];
    }
}

@end
