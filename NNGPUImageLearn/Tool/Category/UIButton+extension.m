//
//  UIButton+extension.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/12.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "UIButton+extension.h"
#import <objc/runtime.h>

@interface UIButton ()

/*! 临时变量 */
@property (nonatomic, assign) NSTimeInterval temp_acceptEventInterval;

@end

@implementation UIButton (extension)
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *nn_temp_acceptEventInterval = "nn_temp_acceptEventInterval";


+ (void)load {
    SEL originM = @selector(sendAction:to:forEvent:);
    Method beforeMethod = class_getInstanceMethod(self, originM);
    
    SEL customM = @selector(nn_sendAction:to:forEvent:);
    Method lastMethod = class_getInstanceMethod(self, customM);
    
    BOOL isExist = class_addMethod(self, originM, method_getImplementation(lastMethod), method_getTypeEncoding(lastMethod));
    
    if (isExist) {
        class_replaceMethod(self, customM, method_getImplementation(beforeMethod), method_getTypeEncoding(beforeMethod));
    } else {
        method_exchangeImplementations(beforeMethod, lastMethod);
    }
}

- (void)nn_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSTimeInterval date = [NSDate date].timeIntervalSince1970;
    if (date - self.temp_acceptEventInterval < self.nn_acceptEventInterval) {
        NSLog(@"1s之内不允许连续点击");
        return;
    }
    
    if (self.nn_acceptEventInterval > 0) {
        self.temp_acceptEventInterval = date;
    }
    
    [self nn_sendAction:action to:target forEvent:event];
}

/** 关联属性, 临时变量 */
- (void)setTemp_acceptEventInterval:(NSTimeInterval)temp_acceptEventInterval {
    objc_setAssociatedObject(self, nn_temp_acceptEventInterval, @(temp_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)temp_acceptEventInterval {
    return [objc_getAssociatedObject(self, nn_temp_acceptEventInterval) doubleValue];
}

- (void)setNn_acceptEventInterval:(NSTimeInterval)nn_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(nn_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)nn_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

@end
