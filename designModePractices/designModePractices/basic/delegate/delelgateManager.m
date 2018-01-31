//
//  delelgateManager.m
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "delelgateManager.h"
#import "delegateWoker.h"

@interface delelgateManager () <delegateWorkerDelegate>

@end

@implementation delelgateManager

- (void)beginPrintTask {
    delegateWoker *woker = [[delegateWoker alloc] init];
    woker.workerDelegate = self;
    [woker doPrintTask];
}

- (void)donePrintTask {
    NSLog(@"celebrate Task!");
}

@end
