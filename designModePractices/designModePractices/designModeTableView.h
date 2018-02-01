//
//  designModeTableView.h
//  designModePractices
//
//  Created by pjpjpj on 2018/2/1.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol designModeTableViewDelegate <NSObject>

- (void)designModeTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface designModeTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<designModeTableViewDelegate> tableViewDelegate;

@end
