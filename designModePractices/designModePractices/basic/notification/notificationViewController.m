//
//  notificationViewController.m
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "notificationViewController.h"
#import "notifyManager.h"
#import "notifyWorker.h"

@interface notificationViewController ()

@end

@implementation notificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    notifyManager *manager = [[notifyManager alloc] init];
    notifyWorker *worker = [[notifyWorker alloc] init];
    [manager beginPrintTask];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
