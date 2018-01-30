//
//  instanceModel.m
//  pageValuePractices
//
//  Created by pjpjpj on 2018/1/30.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "instanceModel.h"

@implementation instanceModel

+ (instancetype)shareInstance {
    static instanceModel *model = nil;
    if (!model) {
        model = [[instanceModel alloc] init];
    }
    return model;
}

@end
