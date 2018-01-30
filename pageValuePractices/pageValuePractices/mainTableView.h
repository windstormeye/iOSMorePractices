//
//  mainTableView.h
//  pageValuePractices
//
//  Created by pjpjpj on 2018/1/30.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol mainTableViewDelegate <NSObject>

- (void)mainTableView:(UITableView *)maintableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface mainTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<mainTableViewDelegate> tableViewDelegate;
@property (nonatomic, strong) UILabel* headTitleLabel;


@end
