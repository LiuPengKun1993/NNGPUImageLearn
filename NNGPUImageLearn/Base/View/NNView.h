//
//  NNView.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/12.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NNViewDelegate<NSObject>
@optional
- (void)buttonClickWithType:(NSInteger)type;
@end

@interface NNView : UIView

@property (nonatomic, weak) id<NNViewDelegate> delegate;

@end
