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

+ (UIImage *)add:(UIImage *)image on:(UIImage *)anotherImage atPosition:(CGPoint)position alpha:(CGFloat)alpha gamma:(CGFloat)gamma;

@end
