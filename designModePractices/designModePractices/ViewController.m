//
//  ViewController.m
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"
#import "decoupleViewController.h"
#import "delegateViewController.h"
#import "notificationViewController.h"
#import "MVCViewController.h"
#import "designModeTableView.h"

@interface ViewController () <designModeTableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    designModeTableView *tableView = [[designModeTableView alloc] init];
    tableView.frame = self.view.bounds;
    tableView.tableViewDelegate = self;
    [self.view addSubview:tableView];
}

- (void)designModeTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self showDecouple];
            break;
        case 1:
            [self showDelegate];
            break;
        case 2:
            [self showNotification];
            break;
        case 3:
            [self showMVC];
            break;
        case 4:
            [self showMVP];
            break;
        case 5:
            [self showMVVM];
            break;
    }
}

- (void)showDecouple {
    decoupleViewController *dvc = [[decoupleViewController alloc] init];
    [self presentViewController:dvc animated:true completion:^{
    }];
}

- (void)showDelegate {
    delegateViewController *vc = [[delegateViewController alloc] init];
    [self presentViewController:vc animated:true completion:^{
    }];
}

- (void)showNotification {
    notificationViewController *vc = [[notificationViewController alloc] init];
    [self presentViewController:vc animated:true completion:^{
    }];
}

- (void)showMVC {
    MVCViewController *vc = [[MVCViewController alloc] init];
    [self presentViewController:vc animated:true completion:^{
    }];
}

- (void)showMVP {
    
}

- (void)showMVVM {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
