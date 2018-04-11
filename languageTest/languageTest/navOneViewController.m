//
//  navOneViewController.m
//  languageTest
//
//  Created by PJ on 2018/4/10.
//  Copyright © 2018年 PJ. All rights reserved.
//

#import "navOneViewController.h"

@interface navOneViewController ()

@property (nonatomic, readwrite,strong) UILabel *label;

@end

@implementation navOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blueColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:25];
    label.textColor = [UIColor whiteColor];
    label.text = PJLocalString(@"homeString");
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage:) name:@"changeLanguage" object:nil];
}

- (void)changeLanguage:(NSNotification *)notify {
    self.label.text = PJLocalString(@"discoverString");
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
