//
//  UIColor+RGB.m
//  plague
//
//  Created by liusilan on 15/1/23.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (UIColor *)colorWithRGB:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    return [UIColor colorWithRed:(red)/255.0f green:(green)/255.0f blue:(blue)/255.0f alpha:1];
}
@end
