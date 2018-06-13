//
//  OpenCV.m
//  LearningOpenCV
//
//  Created by CatchZeng on 2018/6/12.
//  Copyright © 2018年 catch. All rights reserved.
//

//!!!opencv的头文件引入必须在其他头文件之前
#import <opencv2/opencv.hpp>
#import <opencv2/imgproc/types_c.h>
#import <opencv2/imgcodecs/ios.h>
#import <opencv2/core/core_c.h>
#import "OpenCV.h"
using namespace cv;

@interface OpenCV() {
}

@end

@implementation OpenCV

+ (UIImage *)gray:(UIImage *)image {
    Mat mat;
    UIImageToMat(image, mat);
    
    Mat grayMat;
    cvtColor(mat, grayMat, CV_BGR2GRAY);
    
    UIImage* result = MatToUIImage(grayMat);
    return result;
}

@end
