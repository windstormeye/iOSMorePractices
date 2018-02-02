//
//  MVVMViewController.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMViewModel.h"
#import "MVVMModel.h"
#import "MVVMView.h"

@interface MVVMViewController ()

@property (nonatomic, strong) MVVMViewModel*    viewModel;
@property (nonatomic, strong) MVVMView*    mvvmView;
@property (nonatomic, strong) MVVMModel*    mvvmModel;

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mvvmView = [[MVVMView alloc] init];
    self.mvvmView.frame = self.view.bounds;
    [self.view addSubview:self.mvvmView];
    
    self.mvvmModel = [[MVVMModel alloc] init];
    self.mvvmModel.content = @"2333";
    
    self.viewModel = [[MVVMViewModel alloc] init];
    self.viewModel.contentString = self.mvvmModel.content;
    
    [self.mvvmView setWithViewModel:self.viewModel];
    [self.viewModel setWithModel:self.mvvmModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
