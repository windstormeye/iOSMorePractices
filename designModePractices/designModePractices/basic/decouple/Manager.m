//
//  Manager.m
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "Manager.h"
#import "Worker.h"

@implementation Manager

- (void)celebratePrintTask {
    NSLog(@"celebrate Task!");
}

- (void)beginPrintTask {
    Worker *woker = [[Worker alloc] init];
    [woker doPrintTask];
}

@end
