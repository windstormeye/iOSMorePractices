//
//  notifyManager.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/1.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "notifyManager.h"
#import "notification.h"

@implementation notifyManager

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(celebrateWork) name:NOTIFICATION_PRINTTASKDONE object:nil];
    }
    return self;
}

- (void)beginPrintTask {
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_BEGINPRINTTASK object:nil userInfo:nil];
}

- (void)celebrateWork {
    NSLog(@"celebrate work!");
}

@end
