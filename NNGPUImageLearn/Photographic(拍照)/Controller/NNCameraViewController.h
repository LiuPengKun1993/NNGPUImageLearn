//
//  NNCameraViewController.h
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NNFilterModel.h"

@interface NNCameraViewController : UIViewController

@property (nonatomic, strong) GPUImageStillCamera *stillCamera;
@property (nonatomic, strong) GPUImageView *imageView;
@property (nonatomic, strong) GPUImageFilter *filter;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NNFilterModel *filterModel;

@end
