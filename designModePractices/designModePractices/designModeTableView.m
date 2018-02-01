//
//  designModeTableView.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/1.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "designModeTableView.h"

@implementation designModeTableView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.dataSource = self;
    self.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"耦合";
            break;
        case 1:
            cell.textLabel.text = @"delegate";
            break;
        case 2:
            cell.textLabel.text = @"notification";
            break;
        case 3:
            cell.textLabel.text = @"MVC";
            break;
        case 4:
            cell.textLabel.text = @"MVP";
            break;
        case 5:
            cell.textLabel.text = @"MVVM";
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableViewDelegate designModeTableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
