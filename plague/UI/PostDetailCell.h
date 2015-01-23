//
//  PostDetailCell.h
//  plague
//
//  Created by liusilan on 15/1/23.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostDetailCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *postLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentLabel;

@property (nonatomic, strong) NSString *text;

@end
