//
//  NNHeaderImageCollectionView.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>
//typedef void (^NNSelectBlock)(NSString *string, NSInteger index);

@interface NNHeaderImageCollectionView : UICollectionView

//@property (nonatomic, copy) NNSelectBlock selectBlock;

+ (instancetype)initNNHeaderImageCollectionView:(CGRect)frame clicked:(void (^)(NSInteger type))clicked;

- (void)scrollToIndex:(NSInteger)index;

@end
