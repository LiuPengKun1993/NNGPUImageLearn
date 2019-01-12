//
//  NNPictureEditView.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2019/1/12.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNPictureEditViewDelegate <NSObject>

@optional
/** 点击cell改变滤镜 */
- (void)changeFilterWithType:(NSInteger)type;
/** 下载图片 */
- (void)downImage;
/** 返回 */
- (void)back;

@end

NS_ASSUME_NONNULL_BEGIN

@interface NNPictureEditView : UIView

@property (nonatomic, weak) id<NNPictureEditViewDelegate> bottomViewDelegate;

@end

NS_ASSUME_NONNULL_END
