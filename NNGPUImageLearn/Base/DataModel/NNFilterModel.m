//
//  NNFilterModel.m
//  NNGPUImageLearn
//
//  Created by 刘朋坤 on 2018/9/4.
//  Copyright © 2018年 刘朋坤. All rights reserved.
//

#import "NNFilterModel.h"
#import "GPUImageBeautifyFilter.h"

@implementation NNFilterModel

- (NSArray *)filterArray {
    if (!_filterArray) {
        // 美颜
        GPUImageBeautifyFilter *beautyFielter = [[GPUImageBeautifyFilter alloc] init];
        
        // 亮度
        GPUImageBrightnessFilter *brightnessFilter = [[GPUImageBrightnessFilter alloc] init];

        // 曝光
        GPUImageExposureFilter *exposureFilter = [[GPUImageExposureFilter alloc] init];
        
        // 对比度
        GPUImageContrastFilter *contrastFilter = [[GPUImageContrastFilter alloc] init];
        
        // 饱和度
        GPUImageSaturationFilter *saturationFilter = [[GPUImageSaturationFilter alloc] init];
        
        // 伽马线
        GPUImageGammaFilter *gammaFilter = [[GPUImageGammaFilter alloc] init];
        
        // 反色
        GPUImageColorInvertFilter *invertFilter = [[GPUImageColorInvertFilter alloc] init];
        
        // 怀旧
        GPUImageSepiaFilter *sepiaFilter = [[GPUImageSepiaFilter alloc] init];
        
        // 色阶
        GPUImageLevelsFilter *levelsFilter = [[GPUImageLevelsFilter alloc] init];
        
        // 灰度
        GPUImageGrayscaleFilter *grayscaleFilter = [[GPUImageGrayscaleFilter alloc] init];
        
        // RGB
        GPUImageRGBFilter *RGBFilter = [[GPUImageRGBFilter alloc] init];
        
        // 哈哈镜效果
        GPUImageStretchDistortionFilter *stretchDistortionFilter = [[GPUImageStretchDistortionFilter alloc] init];

        // 色调曲线
        GPUImageToneCurveFilter *toneCurveFilter = [[GPUImageToneCurveFilter alloc] init];
        
        // 单色
        GPUImageMonochromeFilter *monochromeFilter = [[GPUImageMonochromeFilter alloc] init];
        
        // 不透明度
        GPUImageOpacityFilter *opacityFilter = [[GPUImageOpacityFilter alloc] init];
        
        // 提亮阴影
        GPUImageHighlightShadowFilter *highlightShadowFilter = [[GPUImageHighlightShadowFilter alloc] init];
        
        // 色彩替换
        GPUImageFalseColorFilter *falseColorFilter = [[GPUImageFalseColorFilter alloc] init];
        
        // 色度
        GPUImageHueFilter *hueFilter = [[GPUImageHueFilter alloc] init];
        
        // 色度键
        GPUImageChromaKeyFilter *chromaKeyFilter = [[GPUImageChromaKeyFilter alloc] init];
        
        // 边缘检测
        GPUImageXYDerivativeFilter *XYDerivativeFilter = [[GPUImageXYDerivativeFilter alloc] init];
        
        // 白平横
        GPUImageWhiteBalanceFilter *whiteBalanceFilter = [[GPUImageWhiteBalanceFilter alloc] init];
        
        // 像素色值亮度平均，图像黑白（有类似漫画效果）
        GPUImageAverageLuminanceThresholdFilter *averageLuminanceThresholdFilter = [[GPUImageAverageLuminanceThresholdFilter alloc] init];
        
        // Amatorka lookup
        GPUImageAmatorkaFilter *amatorkaFilter = [[GPUImageAmatorkaFilter alloc] init];
        
        // MissEtikate lookup
        GPUImageMissEtikateFilter *missEtikateFilter = [[GPUImageMissEtikateFilter alloc] init];
        
        // SoftElegance lookup
        GPUImageSoftEleganceFilter *softEleganceFilter = [[GPUImageSoftEleganceFilter alloc] init];

        // 形状变化
        GPUImageTransformFilter *transformFilter = [[GPUImageTransformFilter alloc] init];

        // 剪裁
        GPUImageCropFilter *cropFilter = [[GPUImageCropFilter alloc] init];

        // 锐化
        GPUImageSharpenFilter *sharpenFilter = [[GPUImageSharpenFilter alloc] init];

        // 反遮罩锐化
        GPUImageUnsharpMaskFilter *unsharpMaskFilter = [[GPUImageUnsharpMaskFilter alloc] init];

        // 高斯模糊
        GPUImageGaussianBlurFilter *gaussianBlurFilter = [[GPUImageGaussianBlurFilter alloc] init];

        // 素描
        GPUImageSketchFilter *sketchFilter = [[GPUImageSketchFilter alloc] init];

        // 浮雕效果，带有点3d的感觉
        GPUImageEmbossFilter *embossFilter = [[GPUImageEmbossFilter alloc] init];

        // 水晶球效果
        GPUImageGlassSphereFilter *glassSphereFilter = [[GPUImageGlassSphereFilter alloc] init];

        // 球形折射，图形倒立
        GPUImageSphereRefractionFilter *sphereRefractionFilter = [[GPUImageSphereRefractionFilter alloc] init];

        // 卡通效果（黑色粗线描边）
        GPUImageToonFilter *toonFilter = [[GPUImageToonFilter alloc] init];
        
        _filterArray = @[beautyFielter, brightnessFilter, exposureFilter, contrastFilter, saturationFilter, gammaFilter, invertFilter, sepiaFilter, levelsFilter, grayscaleFilter, RGBFilter, stretchDistortionFilter, toneCurveFilter, monochromeFilter, opacityFilter, highlightShadowFilter, falseColorFilter, hueFilter, chromaKeyFilter, XYDerivativeFilter, whiteBalanceFilter, averageLuminanceThresholdFilter, amatorkaFilter, missEtikateFilter, softEleganceFilter, transformFilter, cropFilter, sharpenFilter, unsharpMaskFilter, gaussianBlurFilter, sketchFilter, embossFilter, glassSphereFilter, sphereRefractionFilter, toonFilter];
    }
    return _filterArray;
}

- (NSArray *)filterTitleArray {
    if (!_filterTitleArray) {
        _filterTitleArray = @[@"原图", @"亮度", @"曝光", @"对比度", @"饱和度", @"伽马线", @"反色", @"怀旧", @"色阶", @"灰度", @"RGB", @"哈哈镜", @"曲线", @"单色", @"不透明", @"亮阴影", @"色彩", @"色度", @"色度键", @"边缘", @"白平横", @"像素", @"Amatorka", @"MissEtikate", @"SoftElegance", @"形状", @"剪裁", @"锐化", @"反遮罩", @"模糊", @"素描", @"浮雕", @"水晶球", @"球形", @"卡通"];
    }
    return _filterTitleArray;
}

@end
