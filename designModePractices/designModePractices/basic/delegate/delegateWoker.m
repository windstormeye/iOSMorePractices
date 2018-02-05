//
//  delegateWoker.m
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "delegateWoker.h"

@implementation delegateWoker

- (void)doPrintTask {
    NSLog(@"finish work!");
    
    [_workerDelegate donePrintTask];
}

@end
