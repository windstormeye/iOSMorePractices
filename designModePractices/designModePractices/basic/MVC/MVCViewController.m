//
//  MVCViewController.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/1.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "MVCViewController.h"
#import "MVCView.h"
#import "MVCModel.h"

@interface MVCViewController () <MVCViewDelegete>

@property (nonatomic, strong) MVCModel* model;
@property (nonatomic, strong) MVCView* MVCView;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.model = [[MVCModel alloc] init];
    self.model.contentString = @"MVC model";
    
    self.MVCView = [[MVCView alloc] init];
    self.MVCView.frame = self.view.bounds;
    self.MVCView.model = self.model;
    self.MVCView.viewDelegate = self;
    [self.view addSubview:self.MVCView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)MVCViewBtnClick {
    NSInteger interger = random() % 10;
    self.model.contentString = [NSString stringWithFormat:@"%ld", (long)interger];
    self.MVCView.model = self.model;
}

@end
