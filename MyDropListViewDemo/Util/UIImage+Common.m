//
//  UIImage+Common.m
//  MyDropListViewDemo
//
//  Created by stevenlfg on 15/3/5.
//  Copyright (c) 2015年 stevenlfg. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)

+(UIImage *)imageWithColor:(UIColor *)aColor
{
    return [UIImage imageWithColor:aColor withFrame:CGRectMake(0, 0, 1, 1)];

}
+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame
{
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    CGContextFillRect(context, aFrame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;

}
@end
