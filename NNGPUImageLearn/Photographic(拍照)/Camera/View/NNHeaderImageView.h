//
//  NNHeaderImageView.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NNSelectBlock)(NSInteger index);

@interface NNHeaderImageView : UIView

@property (nonatomic, copy) NNSelectBlock selectBlock;

- (void)showWithIndex:(NSInteger)index;

@end
