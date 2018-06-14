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

+ (UIImage *)mask:(UIImage *)image {
    Mat src;
    UIImageToMat(image, src);
    
    int cols = (src.cols-1) * src.channels();
    int offset = src.channels();
    int rows = src.rows;
    
    Mat dst = Mat(src.size(), src.type());
    for (int row = 1; row < rows-1; row++) {
        uchar* previous = src.ptr(row-1);
        uchar* current = src.ptr(row);
        uchar* next = src.ptr(row+1);
        uchar* output = dst.ptr(row);
        for (int col = offset; col < cols; col++) {
            output[col] = saturate_cast<uchar>(5*current[col] - (current[col-offset] + current[col +offset] + previous[col] + next[col]));
        }
    }
    
    UIImage* result = MatToUIImage(dst);
    return result;
}

+ (UIImage *)filter2D:(UIImage *)image {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    Mat kernel = (Mat_<char>(3, 3) << 0, -1, 0, -1, 5, -1, 0, -1, 0);
    filter2D(src, dst, src.depth(), kernel);
    UIImage* result = MatToUIImage(dst);
    return result;
}

@end
