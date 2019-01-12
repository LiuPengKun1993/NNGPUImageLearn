//
//  ViewController.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/3.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "ViewController.h"
#import "NNView.h"

@interface ViewController ()<NNViewDelegate>

@property (nonatomic, strong) NNView *baseView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.baseView];
}

#pragma mark - 代理区域
- (void)buttonClickWithType:(NSInteger)type {
    if (type == 1) { // 美颜相机
        [self presentViewController:[NSClassFromString(@"NNCameraViewController") new] animated:NO completion:nil];
    } else { // 美颜相机
        NSLog(@"444444");
    }
}

#pragma mark - 懒加载区域
- (NNView *)baseView {
    if (!_baseView) {
        _baseView = [[NNView alloc] initWithFrame:self.view.frame];
        _baseView.delegate = self;
    }
    return _baseView;
}

@end
