//
//  NextViewController.m
//  pageValuePractices
//
//  Created by pjpjpj on 2018/1/30.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "NextViewController.h"
#import "instanceModel.h"

@interface NextViewController ()

@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation NextViewController

- (void)setPropertyPassValue:(NSString *)propertyPassValue {
    _propertyPassValue = propertyPassValue;
    self.tipsLabel.text = propertyPassValue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton* backBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 150) / 2, 200, 150, 50)];
    [self.view addSubview:backBtn];
    backBtn.backgroundColor = [UIColor redColor];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 100)];
    self.tipsLabel.textAlignment = NSTextAlignmentCenter;
    self.tipsLabel.font = [UIFont systemFontOfSize:25];
    [self.view addSubview:self.tipsLabel];
}

- (void)backBtnClick {
    [self dismissViewControllerAnimated:true completion:^{
        
    }];
}

- (void)passValueType:(NSInteger)type passValueString:(NSString *)string {
    switch (type) {
        case 0:
            break;
        case 1:
            self.tipsLabel.text = [instanceModel shareInstance].instanceString;
            break;
        case 2:
            self.tipsLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserDefaults"];
            break;
        case 3:
            self.tipsLabel.text = @"代理反向传值";
            [_vcDelegate passValueOfProtocol:self.tipsLabel.text];
            break;
        case 4:
            self.tipsLabel.text = @"block反向传值";
            self.passValueBlock(self.tipsLabel.text);
            break;
        case 5:
            self.tipsLabel.text = @"通知传值";
            [[NSNotificationCenter defaultCenter] postNotificationName:@"notify" object:nil userInfo:@{@"notify" : self.tipsLabel.text}];
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
