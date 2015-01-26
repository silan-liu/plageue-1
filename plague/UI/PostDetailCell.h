//
//  PostDetailCell.h
//  plague
//
//  Created by liusilan on 15/1/26.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostDetailCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *postLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentCountLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentLabel;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSUInteger commentCount;
@property (nonatomic, assign) BOOL isClicked;

@end
