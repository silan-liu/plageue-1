//
//  CustomHeaderView.m
//  plague
//
//  Created by liusilan on 15/1/21.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import "CustomHeaderView.h"

@interface CustomHeaderView ()
{
    UILabel *_label;
}
@end

@implementation CustomHeaderView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _label = [[UILabel alloc] init];
        
        _label.backgroundColor = [UIColor clearColor];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.textColor = [UIColor whiteColor];
        
        [self addSubview:_label];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _label.frame = self.bounds;
}

- (void)setText:(NSString *)text
{
    _text = text;
    
    _label.text = text;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    
    _label.textColor = textColor;
}

@end
