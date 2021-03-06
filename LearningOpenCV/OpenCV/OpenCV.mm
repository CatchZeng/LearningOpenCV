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

+ (int)cols:(UIImage *)image {
    Mat mat;
    UIImageToMat(image, mat);
    return mat.cols;
}

+ (int)rows:(UIImage *)image {
    Mat mat;
    UIImageToMat(image, mat);
    return mat.rows;
}

+ (UIImage *)gray:(UIImage *)image {
    Mat mat;
    UIImageToMat(image, mat);
    
    Mat grayMat;
    cvtColor(mat, grayMat, CV_BGR2GRAY);
    
    UIImage* result = MatToUIImage(grayMat);
    return result;
}

+ (UIImage *)threshold:(UIImage *)image thresh:(double)thresh {
    Mat mat;
    UIImageToMat(image, mat);
    
    Mat dst;
    threshold(mat, dst, thresh, 255, THRESH_BINARY);
    
    UIImage* result = MatToUIImage(dst);
    return result;
}

+ (UIImage *)negation:(UIImage *)image {
    Mat mat;
    UIImageToMat(image, mat);
    
    UIImage* result = MatToUIImage(~mat);
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

+ (UIImage *)cutout:(UIImage *)image {
    Mat src;
    UIImageToMat(image, src);
    
    Mat mask = Mat::zeros(src.size(), CV_8UC1);
    
    Rect2i r = Rect2i(120, 80, 100, 100);
    mask(r).setTo(255);
    
    Mat dst;
    src.copyTo(dst, mask);
    
    UIImage* result = MatToUIImage(dst);
    return result;
}

+ (UIImage *)add:(UIImage *)image image2:(UIImage *)image2 {
    Mat src;
    Mat src2;
    UIImageToMat(image, src);
    UIImageToMat(image2, src2);
    
    Mat dst;
    dst = src + src2;
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)addWeighted:(UIImage *)image image2:(UIImage *)image2 alpha:(double)alpha gamma:(double)gamma {
    Mat src;
    Mat src2;
    UIImageToMat(image, src);
    UIImageToMat(image2, src2);
    
    Mat dst;
    addWeighted(src, alpha, src2, gamma, 0, dst);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)add:(UIImage *)image alphaExist:(BOOL)alphaExist on:(UIImage *)anotherImage atPosition:(CGPoint)position alpha:(CGFloat)alpha beta:(CGFloat)beta gamma:(CGFloat)gamma {
    Mat src;
    Mat dst;
    UIImageToMat(anotherImage, src);
    UIImageToMat(image, dst, alphaExist);
    
    //ROI
    short x = position.x;
    short y = position.y;
    Mat imageRoi;
    imageRoi = src(cv::Rect(x, y, dst.cols, dst.rows));
    
    //add image
    addWeighted(imageRoi, alpha, dst, beta, gamma, imageRoi);
    
    UIImage* result = MatToUIImage(src);
    
    return result;
}

+(UIImage *)transform:(UIImage *)image alpha:(double)alpha beta:(double)beta {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst = Mat(src.size(), src.type());
    
    int rows = src.rows;
    int cols = src.cols;
    Mat m;
    src.convertTo(m, CV_32F);
    for (int row = 0; row < rows; row++) {
        for (int col = 0; col < cols; col++) {
            if(src.channels() == 1) {//单通道
                float v = m.at<Vec3f>(row, col)[0];
                dst.at<uchar>(row, col) = saturate_cast<uchar>(v*alpha + beta);
            } else if (src.channels() == 3) { //3通道
                for (int i=0; i< src.channels(); i++) {
                    float v = m.at<Vec3f>(row, col)[i];
                    dst.at<Vec3b>(row, col)[i] = saturate_cast<uchar>(v*alpha + beta);
                }
            }  else if (src.channels() == 4) { //4通道
                for (int i=0; i< src.channels(); i++) {
                    float v = m.at<Vec4f>(row, col)[i];
                    dst.at<Vec4b>(row, col)[i] = saturate_cast<uchar>(v*alpha + beta);
                }
            }
        }
    }
    UIImage* result = MatToUIImage(dst);
    return result;
}

+ (UIImage *)blur:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    blur(src, dst, cv::Size(sizeX, sizeY));
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)gaussianblur:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    GaussianBlur(src, dst, cv::Size(sizeX, sizeY), 11);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)medianBlur:(UIImage *)image size:(int)size {
    Mat src;
    UIImageToMat(image, src);
    
    int finalSize = size;
    if (size%2 == 0) {
        finalSize = size + 1;
    }
    Mat dst;
    medianBlur(src, dst, finalSize);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)bilateralFilter:(UIImage *)image
                           d:(int)d
                  sigmaColor:(double)sigmaColor
                  sigmaSpace:(double)sigmaSpace {
    Mat src;
    UIImageToMat(image, src);
    
    if (src.channels() == 4) {
        cvtColor(src, src, CV_BGRA2BGR);
    }
    
    Mat dst;
    bilateralFilter(src, dst, d, sigmaColor, sigmaSpace);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)dilate:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    Mat kernel = getStructuringElement(MORPH_RECT, cv::Size(sizeX, sizeY));
    dilate(src, dst, kernel);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)erode:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    Mat kernel = getStructuringElement(MORPH_RECT, cv::Size(sizeX, sizeY));
    erode(src, dst, kernel);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)open:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    Mat kernel = getStructuringElement(MORPH_RECT, cv::Size(sizeX, sizeY));
    morphologyEx(src, dst, MORPH_OPEN, kernel);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)close:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    Mat kernel = getStructuringElement(MORPH_RECT, cv::Size(sizeX, sizeY));
    morphologyEx(src, dst, MORPH_CLOSE, kernel);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)gradient:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    Mat kernel = getStructuringElement(MORPH_RECT, cv::Size(sizeX, sizeY));
    morphologyEx(src, dst, MORPH_GRADIENT, kernel);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)topHat:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    Mat kernel = getStructuringElement(MORPH_RECT, cv::Size(sizeX, sizeY));
    morphologyEx(src, dst, MORPH_TOPHAT, kernel);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

+ (UIImage *)blackHat:(UIImage *)image sizeX:(int)sizeX sizeY:(int)sizeY {
    Mat src;
    UIImageToMat(image, src);
    
    Mat dst;
    Mat kernel = getStructuringElement(MORPH_RECT, cv::Size(sizeX, sizeY));
    morphologyEx(src, dst, MORPH_BLACKHAT, kernel);
    
    UIImage* result = MatToUIImage(dst);
    
    return result;
}

@end
