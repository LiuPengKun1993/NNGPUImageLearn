//
//  UIColor+extension.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2019/1/12.
//  Copyright © 2019 刘朋坤. All rights reserved.
//

#import "UIColor+extension.h"

@implementation UIColor (extension)

/** 背景色 */
+ (UIColor *)nn_backgroundColor {
    return [UIColor whiteColor];
}

+ (UIColor *)nn_grayColor {
    return [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.5];
}

@end
