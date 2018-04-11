//
//  navTwoViewController.m
//  languageTest
//
//  Created by PJ on 2018/4/10.
//  Copyright © 2018年 PJ. All rights reserved.
//

#import "navTwoViewController.h"

@interface navTwoViewController ()

@property (nonatomic, readwrite,strong) UILabel *label;
@property (nonatomic, readwrite,strong) UIButton *button;

@end

@implementation navTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
    [self.view addSubview:self.label];
    self.label.font = [UIFont systemFontOfSize:25];
    self.label.textColor = [UIColor whiteColor];
    self.label.text = PJLocalString(@"discoverString");
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.button.backgroundColor = [UIColor blueColor];
    [self.button setTitle:PJLocalString(@"change") forState:UIControlStateNormal];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage:) name:@"changeLanguage" object:nil];
}

- (void)changeLanguage:(NSNotification *)notify {
    self.label.text = PJLocalString(@"discoverString");
    [self.button setTitle:PJLocalString(@"change") forState:UIControlStateNormal];
}

- (void)buttonClick {
    [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:AppLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage" object:nil];
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
