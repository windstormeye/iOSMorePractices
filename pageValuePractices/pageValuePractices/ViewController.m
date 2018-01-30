//
//  ViewController.m
//  pageValuePractices
//
//  Created by pjpjpj on 2018/1/30.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "ViewController.h"
#import "mainTableView.h"
#import "NextViewController.h"
#import "instanceModel.h"

@interface ViewController () <mainTableViewDelegate, NextViewControllerDelegate>

@property (nonatomic, strong) mainTableView* tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (void)initView {    
    self.tableView = [[mainTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.tableViewDelegate = self;
    [self.view addSubview:self.tableView];

}

- (void)mainTableView:(UITableView *)maintableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NextViewController *vc = [[NextViewController alloc] init];
    vc.vcDelegate = self;
    [self presentViewController:vc animated:true completion:^{
        switch (indexPath.row) {
            case 0:
                vc.propertyPassValue = @"属性传值";
                break;
            case 1:
                [instanceModel shareInstance].instanceString = @"单例传值";
                break;
            case 2:
                [[NSUserDefaults standardUserDefaults] setObject:@"NSUserDefaults传值" forKey:@"NSUserDefaults"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                break;
            case 3:
                
                break;
            case 4: {
                    vc.passValueBlock = ^(NSString *string) {
                        self.tableView.headTitleLabel.text = string;
                    };
                }
                break;
            case 5:
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifyMesg:) name:@"notify" object:nil];
                break;
        }
        [vc passValueType:indexPath.row passValueString:nil];
    }];
}

- (void)passValueOfProtocol:(NSString *)string {
    self.tableView.headTitleLabel.text = string;
}

- (void)notifyMesg:(NSNotification *)notify {
    self.tableView.headTitleLabel.text = notify.userInfo[@"notify"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
