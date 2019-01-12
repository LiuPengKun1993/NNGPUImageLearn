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
        
        // 色彩直方图，显示在图片上
        GPUImageHistogramFilter *histogramFilter = [[GPUImageHistogramFilter alloc] init];
        
        // 色彩直方图
        GPUImageHistogramGenerator *histogramGenerator = [[GPUImageHistogramGenerator alloc] init];
        
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
        
        // 像素平均色值
        GPUImageAverageColor *averageColor = [[GPUImageAverageColor alloc] init];
        
        // 纯色
        GPUImageSolidColorGenerator *solidColorGenerator = [[GPUImageSolidColorGenerator alloc] init];
        
        // 亮度平均
        GPUImageLuminosity *luminosity = [[GPUImageLuminosity alloc] init];
        
        // 像素色值亮度平均，图像黑白（有类似漫画效果）
        GPUImageAverageLuminanceThresholdFilter *averageLuminanceThresholdFilter = [[GPUImageAverageLuminanceThresholdFilter alloc] init];
        
        // lookup 色彩调整
        GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
        
        // Amatorka lookup
        GPUImageAmatorkaFilter *amatorkaFilter = [[GPUImageAmatorkaFilter alloc] init];
        
        // MissEtikate lookup
        GPUImageMissEtikateFilter *missEtikateFilter = [[GPUImageMissEtikateFilter alloc] init];
        
        // SoftElegance lookup
        GPUImageSoftEleganceFilter *softEleganceFilter = [[GPUImageSoftEleganceFilter alloc] init];
        
        
        // 十字
        GPUImageCrosshairGenerator *crosshairGenerator = [[GPUImageCrosshairGenerator alloc] init];
        
        // 线条
        GPUImageLineGenerator *lineGenerator = [[GPUImageLineGenerator alloc] init];

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

        // 高斯模糊，选择部分清晰
        GPUImageGaussianSelectiveBlurFilter *gaussianSelectiveBlurFilter = [[GPUImageGaussianSelectiveBlurFilter alloc] init];

        // 盒状模糊
        GPUImageBoxBlurFilter *boxBlurFilter = [[GPUImageBoxBlurFilter alloc] init];

        // 条纹模糊，中间清晰，上下两端模糊
        GPUImageTiltShiftFilter *tiltShiftFilter = [[GPUImageTiltShiftFilter alloc] init];

        // 中间值，有种稍微模糊边缘的效果
        GPUImageMedianFilter *medianFilter = [[GPUImageMedianFilter alloc] init];

        // 双边模糊
        GPUImageBilateralFilter *bilateralFilter = [[GPUImageBilateralFilter alloc] init];

        // 侵蚀边缘模糊，变黑白
        GPUImageErosionFilter *erosionFilter = [[GPUImageErosionFilter alloc] init];

        // RGB侵蚀边缘模糊，有色彩
        GPUImageRGBErosionFilter *RGBErosionFilter = [[GPUImageRGBErosionFilter alloc] init];

        // 扩展边缘模糊，变黑白
        GPUImageDilationFilter *dilationFilter = [[GPUImageDilationFilter alloc] init];

        // RGB扩展边缘模糊，有色彩
        GPUImageRGBDilationFilter *RGBDilationFilter = [[GPUImageRGBDilationFilter alloc] init];

        // 黑白色调模糊
        GPUImageOpeningFilter *openingFilter = [[GPUImageOpeningFilter alloc] init];

        // 彩色模糊
        GPUImageRGBOpeningFilter *RGBOpeningFilter = [[GPUImageRGBOpeningFilter alloc] init];

        // 黑白色调模糊，暗色会被提亮
        GPUImageClosingFilter *closingFilter = [[GPUImageClosingFilter alloc] init];
        
        // 彩色模糊，暗色会被提亮
        GPUImageRGBClosingFilter *RGBClosingFilter = [[GPUImageRGBClosingFilter alloc] init];
        
        // Lanczos重取样，模糊效果
        GPUImageLanczosResamplingFilter *lanczosResamplingFilter = [[GPUImageLanczosResamplingFilter alloc] init];

        // 非最大抑制，只显示亮度最高的像素，其他为黑
        GPUImageNonMaximumSuppressionFilter *nonMaximumSuppressionFilter = [[GPUImageNonMaximumSuppressionFilter alloc] init];

        // 与上相比，像素丢失更多
        GPUImageThresholdedNonMaximumSuppressionFilter *thresholdedNonMaximumSuppressionFilter = [[GPUImageThresholdedNonMaximumSuppressionFilter alloc] init];

        // Sobel边缘检测算法(白边，黑内容，有点漫画的反色效果)
        GPUImageSobelEdgeDetectionFilter *sobelEdgeDetectionFilter = [[GPUImageSobelEdgeDetectionFilter alloc] init];

        // Canny边缘检测算法（比上更强烈的黑白对比度）
        GPUImageCannyEdgeDetectionFilter *cannyEdgeDetectionFilter = [[GPUImageCannyEdgeDetectionFilter alloc] init];

        // 阈值边缘检测（效果与上差别不大）
        GPUImageThresholdEdgeDetectionFilter *thresholdEdgeDetectionFilter = [[GPUImageThresholdEdgeDetectionFilter alloc] init];

        // 普瑞维特(Prewitt)边缘检测(效果与Sobel差不多，貌似更平滑)
        GPUImagePrewittEdgeDetectionFilter *prewittEdgeDetectionFilter = [[GPUImagePrewittEdgeDetectionFilter alloc] init];

        // 素描
        GPUImageSketchFilter *sketchFilter = [[GPUImageSketchFilter alloc] init];
        
        // 黑白马赛克
        GPUImageMosaicFilter *mosaicFilter = [[GPUImageMosaicFilter alloc] init];

        // 浮雕效果，带有点3d的感觉
        GPUImageEmbossFilter *embossFilter = [[GPUImageEmbossFilter alloc] init];

        // 水晶球效果
        GPUImageGlassSphereFilter *glassSphereFilter = [[GPUImageGlassSphereFilter alloc] init];

        // 球形折射，图形倒立
        GPUImageSphereRefractionFilter *sphereRefractionFilter = [[GPUImageSphereRefractionFilter alloc] init];

        // 卡通效果（黑色粗线描边）
        GPUImageToonFilter *toonFilter = [[GPUImageToonFilter alloc] init];
        
        _filterArray = @[beautyFielter, brightnessFilter, exposureFilter, contrastFilter, saturationFilter, gammaFilter, invertFilter, sepiaFilter, levelsFilter, grayscaleFilter, histogramFilter, histogramGenerator, RGBFilter, stretchDistortionFilter, toneCurveFilter, monochromeFilter, opacityFilter, highlightShadowFilter, falseColorFilter, hueFilter, chromaKeyFilter, XYDerivativeFilter, whiteBalanceFilter, averageColor, solidColorGenerator, luminosity, averageLuminanceThresholdFilter, lookupFilter, amatorkaFilter, missEtikateFilter, softEleganceFilter, crosshairGenerator, lineGenerator, transformFilter, cropFilter, sharpenFilter, unsharpMaskFilter, gaussianBlurFilter, gaussianSelectiveBlurFilter, boxBlurFilter, tiltShiftFilter, medianFilter, bilateralFilter, erosionFilter, RGBErosionFilter, dilationFilter, RGBDilationFilter, openingFilter, RGBOpeningFilter, closingFilter, RGBClosingFilter, lanczosResamplingFilter, nonMaximumSuppressionFilter, thresholdedNonMaximumSuppressionFilter, sobelEdgeDetectionFilter, cannyEdgeDetectionFilter, thresholdEdgeDetectionFilter, prewittEdgeDetectionFilter, sketchFilter, mosaicFilter, embossFilter, glassSphereFilter, sphereRefractionFilter, toonFilter];
    }
    return _filterArray;
}

- (NSArray *)filterTitleArray {
    if (!_filterTitleArray) {
        _filterTitleArray = @[@"美颜", @"亮度", @"曝光", @"对比度", @"饱和度", @"伽马线", @"反色", @"怀旧", @"色阶", @"灰度", @"直方图", @"直方图", @"RGB", @"哈哈镜", @"曲线", @"单色", @"不透明度", @"提亮阴影", @"色彩替换", @"色度", @"色度键"];
    }
    return _filterTitleArray;
}

@end
