//
//  MVVMView.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "MVVMView.h"
#import "FBKVOController.h"
#import "MVVMViewModel.h"
#import "NSObject+FBKVOController.h"

@interface MVVMView ()

@property (nonatomic, strong) UILabel*    tipsLabel;
@property (nonatomic, strong) MVVMViewModel*    vm;

@end

@implementation MVVMView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor lightGrayColor];
    
    self.tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 20)];
    [self addSubview:self.tipsLabel];
    self.tipsLabel.font = [UIFont systemFontOfSize:25];
    self.tipsLabel.textAlignment = NSTextAlignmentCenter;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 30)];
    [self addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:1<<6];
    [btn setTitle:@"点我啊！" forState:UIControlStateNormal];
}

- (void)setContent:(NSString *)content {
    _content = content;
    self.tipsLabel.text = content;
}

- (void)btnClick {
    [self.vm doPrintWork];
}

- (void)setWithViewModel:(MVVMViewModel *)vm {
    self.vm = vm;
    
    [self.KVOController observe:vm keyPath:@"contentString" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        NSString *newContent = change[NSKeyValueChangeNewKey];
        self.tipsLabel.text = newContent;
    }];
}

@end
