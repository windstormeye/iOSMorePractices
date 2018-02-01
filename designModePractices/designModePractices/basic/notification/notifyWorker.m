//
//  notifyWorker.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/1.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "notifyWorker.h"
#import "notification.h"

@implementation notifyWorker

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doPrintTask) name:NOTIFICATION_BEGINPRINTTASK object:nil];
    }
    return self;
}

- (void)doPrintTask {
    NSLog(@"finish work!");
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_PRINTTASKDONE object:nil];
}

@end
