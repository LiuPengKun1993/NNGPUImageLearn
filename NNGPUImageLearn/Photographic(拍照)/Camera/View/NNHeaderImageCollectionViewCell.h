//
//  NNHeaderImageCollectionViewCell.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NNHeaderImageCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) GPUImageFilter *filter;

@property (nonatomic, strong) UILabel *titleLabel;

@end
