//
//  UIColor+ColorCategory.h
//  MyDropListViewDemo
//
//  Created by stevenlfg on 15/3/5.
//  Copyright (c) 2015年 stevenlfg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorCategory)
+ (UIColor *) colorWithHex:(long)hexColor;
+ (UIColor *) colorWithHex:(long)hexColor alpha:(float)opacity;
+ (UIColor *) colorWithHexString:(NSString *)color;
@end
