//
//  NSData+SLAddition.h
//  MeetingClient
//
//  Created by likelin on 2017/6/19.
//  Copyright © 2017年 中青博联会展. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSData (SLAddition)
/**
 压缩图片：图片压缩分为质量压缩和尺寸压缩 ，此方法先进行质量压缩，如果质量压缩到最后仍然不能满足我们压缩的大小，那么就会进行尺寸压缩
 
 @param sourceImage 需要压缩的图片
 @param maxSize     要压缩的大小
 @return            压缩后图片的大小
 */
- (NSData *)dataByResetImage:(UIImage *)sourceImage maxSize:(NSUInteger)maxSize;
@end
