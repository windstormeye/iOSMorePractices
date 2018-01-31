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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self showDecouple];
//    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // GCD延迟在重复执行，使用dispatch_once_t解决
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
//            [self showDecouple];
            [self showDelegate];
        });
    });
}

- (void)showDecouple {
    decoupleViewController *vc = [[decoupleViewController alloc] init];
    [self presentViewController:vc animated:true completion:^{
    }];
}

- (void)showDelegate {
    delegateViewController *vc = [[delegateViewController alloc] init];
    [self presentViewController:vc animated:true completion:^{
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
