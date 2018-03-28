//
//  NSData+SLAddition.m
//  MeetingClient
//
//  Created by likelin on 2017/6/19.
//  Copyright © 2017年 中青博联会展. All rights reserved.
//
#define kDefaultByte 1024

#import "NSData+SLAddition.h"

@implementation NSData (SLAddition)
- (NSData *)dataByResetImage:(UIImage *)sourceImage maxSize:(NSUInteger)maxSize {
    //先判断当前质量是否满足要求，不满足再进行压缩
    NSData *finalData = UIImageJPEGRepresentation(sourceImage,1.0);
    if ((finalData.length / kDefaultByte) <= maxSize) {  return finalData; }
    //先调整分辨率
    CGSize  defaultSize  = CGSizeMake(kDefaultByte, kDefaultByte);
    UIImage *resultImage = [self imageWithSize:defaultSize image:sourceImage];
    NSData  *imageData   = [self dataByCompressImage:resultImage toByte:maxSize * kDefaultByte];
    // 压缩后图片的大小仍然大于maxSize， 则修改图片的size
    while ((imageData.length / kDefaultByte) > maxSize) {
        //每次降100分辨率
        if (defaultSize.width-100 <= 0 || defaultSize.height-100 <= 0) {
            break;
        }
        defaultSize = CGSizeMake(defaultSize.width-100, defaultSize.height-100);
        UIImage *image = [self imageWithSize:defaultSize image:[UIImage imageWithData:UIImageJPEGRepresentation(resultImage,1.0)]];
        imageData      = [self dataByCompressImage:image toByte:maxSize * kDefaultByte];
    }
    return imageData;
}

#pragma mark 调整图片分辨率/尺寸（等比例缩放）
- (UIImage *)imageWithSize:(CGSize)size image:(UIImage *)sourceImage {
    CGSize  resSize = CGSizeMake(sourceImage.size.width, sourceImage.size.height);
    CGFloat tempHeight = resSize.height / size.height;
    CGFloat tempWidth  = resSize.width / size.width;
    
    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        resSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        resSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
    }
    
    UIGraphicsBeginImageContext(resSize);
    [sourceImage drawInRect:CGRectMake(0,0,resSize.width,resSize.height)];
    UIImage *resImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resImage;
}


/**
 采用二分法查找最合适的压缩比例
 当压缩图片的大小在【maxLength * 0.9， maxLength】的时候停止压缩，
 
 @param image     需要压缩的图片
 @param maxLength 需要压缩到多少字节 比如 100kb
 @return          返回最终压缩的图片大小
 */
- (NSData *)dataByCompressImage:(UIImage *)image toByte:(NSInteger)maxLength {
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return data;
    CGFloat max = 1;
    CGFloat min = 0;
    // 最多压缩 6 次，1/(2^6) = 0.015625 < 0.02，也能达到每次循环 compression 减小 0.02 的效果
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    return data;
}@end
