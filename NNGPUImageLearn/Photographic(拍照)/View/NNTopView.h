//
//  NNTopView.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/12.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NNTopViewDelegate<NSObject>
@optional
- (void)buttonClicked:(UIButton *)sender;
@end

@interface NNTopView : UIView

@property (nonatomic, weak) id<NNTopViewDelegate> topViewDelegate;

@end
