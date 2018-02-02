//
//  MVPViewController.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "MVPViewController.h"
#import "Presenter.h"
#import "MVPView.h"
#import "MVPModel.h"

@interface MVPViewController ()

@property (nonatomic, strong) MVPView*    mvpView;
@property (nonatomic, strong) MVPModel*    mvpModel;
@property (nonatomic, strong) Presenter*    presenter;

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.presenter = [Presenter new];
    
    self.mvpView = [MVPView new];
    self.mvpView.frame = self.view.bounds;
    [self.view addSubview:self.mvpView];
    self.mvpView.viewDelegate = self.presenter;
    
    self.mvpModel = [MVPModel new];
    
    self.presenter.mvpModel = self.mvpModel;
    self.presenter.mvpView = self.mvpView;
    self.mvpModel.contentString = @"2333";
    [self.presenter doPrintWork];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
