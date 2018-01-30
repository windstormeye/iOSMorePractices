//
//  mainTableView.m
//  pageValuePractices
//
//  Created by pjpjpj on 2018/1/30.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "mainTableView.h"

@interface mainTableView()
@end

@implementation mainTableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self initView];
    return self;
}

- (UILabel *)headTitleLabel {
    if (!_headTitleLabel) {
        _headTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
        self.headTitleLabel.textAlignment = NSTextAlignmentCenter;
        self.headTitleLabel.font = [UIFont systemFontOfSize:25];
        self.headTitleLabel.text = @"2333";
    }
    return _headTitleLabel;
}

- (void)initView {
    self.delegate = self;
    self.dataSource = self;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 100)];
    [headerView addSubview:self.headTitleLabel];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 50)];
    [cell addSubview:titleLabel];
    switch (indexPath.row) {
        case 0:
            titleLabel.text = @"属性传值";
            break;
        case 1:
            titleLabel.text = @"单例传值";
            break;
        case 2:
            titleLabel.text = @"NSUserDefault传值";
            break;
        case 3:
            titleLabel.text = @"代理传值";
            break;
        case 4:
            titleLabel.text = @"block传值";
            break;
        case 5:
            titleLabel.text = @"通知传值";
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = false;
    [_tableViewDelegate mainTableView:self didSelectRowAtIndexPath:indexPath];
}


@end
