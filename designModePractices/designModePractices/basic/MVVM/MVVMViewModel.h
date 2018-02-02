//
//  MVVMViewModel.h
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMModel.h"

@interface MVVMViewModel : NSObject

@property (nonatomic, strong) NSString*    contentString;

- (void)setWithModel:(MVVMModel *)model;
- (void)doPrintWork;

@end
