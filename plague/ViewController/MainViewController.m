//
//  MainViewController.m
//  plague
//
//  Created by liusilan on 15/1/21.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

#import "MainViewController.h"
#import "CustomHeaderView.h"
#import "UIViewUtils.h"
#import "ShadowedTableView.h"
#import "PostDetailCell.h"
#import "UIColor+RGB.h"

#define TopViewHeight       30
#define BottomViewHeight    30
#define ScrollViewOffset    30

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
{
    CustomHeaderView *_topView;
    CustomHeaderView *_bottomView;
    ShadowedTableView *_detailView;
    BOOL _isClicked;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _isClicked = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _topView = [[CustomHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, TopViewHeight)];
    
    [self updateTopView:YES];
    
    [self.view addSubview:_topView];

    _detailView = [[ShadowedTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _detailView.backgroundColor = [UIColor clearColor];
    _detailView.showsVerticalScrollIndicator = NO;
    _detailView.dataSource = self;
    _detailView.delegate = self;
    _detailView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _detailView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _detailView.width, TopViewHeight)];
    _detailView.tableHeaderView.backgroundColor = [UIColor clearColor];
    _detailView.isNeedShadow = !_isClicked;
    
    [self.view addSubview:_detailView];
    
    UINib *nib = [UINib nibWithNibName:@"PostDetailCell" bundle:[NSBundle mainBundle]];
    
    [_detailView registerNib:nib forCellReuseIdentifier:@"PostDetailCell"];
    
    _bottomView = [[CustomHeaderView alloc] initWithFrame:CGRectMake(0, self.view.height - BottomViewHeight, self.view.frame.size.width, BottomViewHeight)];
    
    [self updateBottomView:YES];
    
    [self.view addSubview:_bottomView];
    
    [self.view bringSubviewToFront:_detailView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollView Delegate

 - (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint contentOffset = _detailView.contentOffset;
    
    CGFloat offsetY = contentOffset.y;
    if (scrollView.isDragging)
    {
        if (offsetY >= 0)
        {
            if (offsetY >= ScrollViewOffset)
            {
                [self updateBottomView:NO];
            }
            else
            {
                [self updateBottomView:YES];
            }
            
            _topView.y =  - offsetY / 2;
            
            _bottomView.y = self.view.height - BottomViewHeight - offsetY;
            _bottomView.height = BottomViewHeight + offsetY;
        }
        else
        {
            if (offsetY <= -ScrollViewOffset)
            {
                [self updateTopView:NO];
            }
            else
            {
                [self updateTopView:YES];
            }
            
            _topView.height = TopViewHeight - offsetY;
            
            _bottomView.y = self.view.height - BottomViewHeight - offsetY;
            _bottomView.height = BottomViewHeight + offsetY;
        }
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self endAction];
}

- (void)endAction
{
    CGPoint contentOffset = _detailView.contentOffset;
    
    CGFloat offsetY = contentOffset.y;
    
    // infect
    if (offsetY >= ScrollViewOffset)
    {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _detailView.y -= self.view.height;
            
        } completion:^(BOOL finished) {
            [self reset];
            
        }];
    }
    // skip
    else if (offsetY <= -ScrollViewOffset)
    {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            _detailView.y = self.view.height;

        } completion:^(BOOL finished) {
            [self reset];

        }];
    }
    else
    {
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0.4 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self reset];

        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)reset
{
    _topView.y = 0;
    _topView.height = TopViewHeight;
    
    _detailView.contentOffset = CGPointZero;
    _detailView.y = 0;
    
    _bottomView.y = self.view.height - BottomViewHeight;
    
    _bottomView.height = BottomViewHeight;
    
    [self updateBottomView:YES];
    [self updateTopView:YES];
}

- (void)updateTopView:(BOOL)isReset
{
    if (isReset)
    {
        _topView.backgroundColor = RGBCOLOR(22, 90, 237);
        _topView.text = @"SPREAD";
    }
    else
    {
        _topView.backgroundColor = RGBCOLOR(184, 185, 184);
        _topView.text = @"RELEASE TO SKIP";
    }
}

- (void)updateBottomView:(BOOL)isReset
{
    if (isReset)
    {
        _bottomView.backgroundColor = RGBCOLOR(184, 185, 184);
        _bottomView.text = @"SKIP";
    }
    else
    {
        _bottomView.backgroundColor = RGBCOLOR(22, 90, 237);
        _bottomView.text = @"RELEASE TO INFECT PEOPLE";
    }
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PostDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostDetailCell"];

    cell.text = @"test";
    cell.backgroundColor = [UIColor whiteColor];
    cell.commentCount = 0;
    cell.name = @"silan";
    cell.isClicked = _isClicked;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_isClicked)
    {
        return tableView.height - TopViewHeight - BottomViewHeight;
    }
    else
    {
        return self.view.height - 100 - 50;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_isClicked)
    {
        [UIView animateWithDuration:0.3 animations:^{

            _detailView.y = -TopViewHeight;
            _topView.alpha = 0;
            _bottomView.alpha = 0;
            _detailView.tableHeaderView = nil;

        } completion:^(BOOL finished) {
        } ];
    }
    else
    {
        [UIView animateWithDuration:0.3 animations:^{

            _detailView.y = 0;
            _topView.alpha = 1;
            _bottomView.alpha = 1;
            
            _detailView.tableHeaderView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, _detailView.width, TopViewHeight)];;

        } completion:^(BOOL finished) {
        } ];
    }
    
    _isClicked = !_isClicked;
    
    [tableView reloadData];
    
    _detailView.isNeedShadow = !_isClicked;
}
@end
