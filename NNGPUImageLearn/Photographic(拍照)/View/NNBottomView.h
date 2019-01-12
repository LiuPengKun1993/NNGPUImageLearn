//
//  NNBottomView.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNBottomViewDelegate<NSObject>
@optional

/** 点击cell改变滤镜 */
- (void)changeFilterWithType:(NSInteger)type;
- (void)takePhoto;
- (void)imageButtonClick;

@end

@interface NNBottomView : UIView

@property (nonatomic, weak) id<NNBottomViewDelegate> bottomViewDelegate;

@end
