//
//  OpenCV.h
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/6/12.
//  Copyright © 2018年 catch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCV : NSObject

+ (UIImage *)gray:(UIImage *)image;

+ (UIImage *)mask:(UIImage *)image;

+ (UIImage *)filter2D:(UIImage *)image;

+ (UIImage *)cutout:(UIImage *)image;

+ (UIImage *)add:(UIImage *)image image2:(UIImage *)image2;

+ (UIImage *)addWeighted:(UIImage *)image image2:(UIImage *)image2 alpha:(double)alpha gamma:(double)gamma;

+ (UIImage *)add:(UIImage *)image
      alphaExist:(BOOL)alphaExist
              on:(UIImage *)anotherImage
      atPosition:(CGPoint)position
           alpha:(CGFloat)alpha
            beta:(CGFloat)beta
           gamma:(CGFloat)gamma;

+ (UIImage *)transform:(UIImage *)image alpha:(double)alpha beta:(double)beta;

+ (UIImage *)blur:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY;

+ (UIImage *)gaussianblur:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY;

+ (UIImage *)medianBlur:(UIImage *)image size:(int)size;

@end
