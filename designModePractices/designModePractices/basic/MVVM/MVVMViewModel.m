//
//  MVVMViewModel.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "MVVMViewModel.h"

@interface MVVMViewModel ()

@property (nonatomic, strong) MVVMModel*    mvvmModel;

@end

@implementation MVVMViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)setWithModel:(MVVMModel *)model {
    self.mvvmModel = model;
    self.contentString = model.content;
}

- (void)doPrintWork {
    NSInteger interger = random() % 10;
    self.mvvmModel.content = [NSString stringWithFormat:@"%ld", (long)interger];
    self.contentString = self.mvvmModel.content;
}

@end
