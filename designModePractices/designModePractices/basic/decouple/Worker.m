//
//  Worker.m
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "Worker.h"
#import "Manager.h"

@implementation Worker

- (void)doPrintTask {
    NSLog(@"finish work!");
    
    Manager *manager = [[Manager alloc] init];
    [manager celebratePrintTask];
}

@end
