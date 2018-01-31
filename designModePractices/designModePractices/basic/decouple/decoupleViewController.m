//
//  decoupleViewController.m
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "decoupleViewController.h"
#import "Manager.h"

@interface decoupleViewController ()

@end

@implementation decoupleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    Manager *manager = [[Manager alloc] init];
    [manager beginPrintTask];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
