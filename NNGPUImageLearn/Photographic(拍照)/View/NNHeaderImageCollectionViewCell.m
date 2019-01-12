//
//  NNHeaderImageCollectionViewCell.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNHeaderImageCollectionViewCell.h"

@interface NNHeaderImageCollectionViewCell()

@property (nonatomic, strong) GPUImagePicture *picture;

@property (nonatomic, strong) UIImageView *headerImageView;

@end

@implementation NNHeaderImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self creatChildViews];
    }
    return self;
}

#pragma mark - 布局区域
/** 创建子视图 */
- (void)creatChildViews {
    _filter = [[GPUImageFilter alloc] init];
    UIImage *image = [UIImage imageNamed:@"header"];
    [_filter forceProcessingAtSize:image.size];

    _picture = [[GPUImagePicture alloc] initWithImage:image];
    [_picture addTarget:_filter];
    [_picture processImage];
    [_filter useNextFrameForImageCapture];
    UIImage *newImage = [_filter imageFromCurrentFramebuffer];
    
    _headerImageView = [[UIImageView alloc] init];
    _headerImageView.frame = CGRectMake(0, 0, self.width, self.height);
    [self addSubview:_headerImageView];
    [_headerImageView setImage:newImage];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height-20, self.width, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"滤镜";
    label.textColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:10];
    [self addSubview:label];
}

- (void)setFilter:(GPUImageFilter *)filter {
    [_picture removeAllTargets];
    [_picture addTarget:filter];
}

@end
