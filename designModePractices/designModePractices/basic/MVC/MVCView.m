//
//  MVCView.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/1.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "MVCView.h"

@interface MVCView ()

@property (nonatomic, strong) UILabel* tipsLabel;

@end

@implementation MVCView

- (id)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor darkGrayColor];
    
    self.tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
    [self addSubview:self.tipsLabel];
    self.tipsLabel.font = [UIFont systemFontOfSize:25];
    self.tipsLabel.textAlignment = NSTextAlignmentCenter;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 30)];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:1<<6];
    [btn setTitle:@"点我啊！" forState:UIControlStateNormal];
}

- (void)setModel:(MVCModel *)model {
    self.tipsLabel.text = model.contentString;
}

- (void)btnClick {
    if (_viewDelegate) {
        [_viewDelegate MVCViewBtnClick];
    }
}

@end
