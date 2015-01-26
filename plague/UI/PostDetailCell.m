//
//  PostDetailCell.m
//  plague
//
//  Created by liusilan on 15/1/26.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import "PostDetailCell.h"
#import "UIViewUtils.h"

@implementation PostDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setText:(NSString *)text
{
    _text = text;
    
    _postLabel.text = text;
    
    [self setNeedsLayout];
}

- (void)setName:(NSString *)name
{
    _name = name;
    
    _nameLabel.text = name;
    
    [self setNeedsLayout];
}

- (void)setCommentCount:(NSUInteger)commentCount
{
    _commentCount = commentCount;
    
    _commentCountLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)commentCount];
    _commentLabel.text = [NSString stringWithFormat:@"%lu comments", (unsigned long)commentCount];
    
    [self setNeedsLayout];
}

- (void)setIsClicked:(BOOL)isClicked
{
    _isClicked = isClicked;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_postLabel sizeToFit];
    
    if (_isClicked)
    {
        _commentLabel.hidden = NO;
        _commentLabel.y = self.height - _commentLabel.height - 10;
        _commentCountLabel.y = _commentLabel.y - 20 - _commentLabel.height;
    }
    else
    {
        _commentLabel.hidden = YES;
        
        _commentCountLabel.y = self.height - _commentCountLabel.height - 10;
    }
    
    // 内容和名字居中
    CGFloat subHeight = _postLabel.height + _commentCountLabel.height + 20;
    
    CGFloat startY = (_commentCountLabel.y - subHeight) / 2;
    
    _postLabel.y = startY;
    _nameLabel.y = _postLabel.y + _postLabel.height + 20;
}

@end
