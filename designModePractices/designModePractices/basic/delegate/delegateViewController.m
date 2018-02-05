//
//  delegateViewController.m
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "delegateViewController.h"
#import "delelgateManager.h"

@interface delegateViewController ()

@end

@implementation delegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    delelgateManager *manager = [[delelgateManager alloc] init];
    [manager beginPrintTask];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
