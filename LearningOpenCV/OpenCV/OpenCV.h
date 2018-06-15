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

@end
