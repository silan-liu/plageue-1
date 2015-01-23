//
//  PostDetailCell.m
//  plague
//
//  Created by liusilan on 15/1/23.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import "PostDetailCell.h"
#import "UIViewUtils.h"

@implementation PostDetailCell

- (void)awakeFromNib {
    // Initialization code

}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_postLabel sizeToFit];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setText:(NSString *)text
{
    _text = text;
    
    _postLabel.text = text;

    [self layoutSubviews];
}

@end
