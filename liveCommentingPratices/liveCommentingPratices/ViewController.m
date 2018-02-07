//
//  ViewController.m
//  liveCommentingPratices
//
//  Created by pjpjpj on 2018/2/5.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"
#import "BulletView.h"
#import "BulletManage.h"

@interface ViewController ()

@property (nonatomic, strong) BulletManage* manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[BulletManage alloc] init];
    __weak typeof (self) weakSelf = self;
    self.manager.generateViewBlock = ^(BulletView *view) {
        [weakSelf addBulletView:view];
    };
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitle:@"start" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 20);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitle:@"stop" forState:UIControlStateNormal];
    btn.frame = CGRectMake(250, 100, 100, 20);
    [btn addTarget:self action:@selector(btnStopClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)btnClick {
    [self.manager start];
}

- (void)btnStopClick {
    [self.manager stop];
}

- (void)addBulletView:(BulletView *)view {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    view.frame = CGRectMake(width, 300 + view.trajectory * 40, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds));
    [self.view addSubview:view];
    
    [view startAnimation];
}

@end
