//
//  UIView+UIViewGeometry.h
//  YY2
//
//  Created by Kai on 13-8-6.
//  Copyright (c) 2013年 YY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIViewGeometryHelper)

@property(assign, nonatomic) CGFloat width;
@property(assign, nonatomic) CGFloat height;
@property(assign, nonatomic) CGFloat x;
@property(assign, nonatomic) CGFloat y;
@property(readonly, nonatomic) CGFloat bottom;
@end