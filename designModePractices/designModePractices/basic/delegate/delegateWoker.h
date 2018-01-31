//
//  delegateWoker.h
//  designModePractices
//
//  Created by pjpjpj on 2018/1/31.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol delegateWorkerDelegate <NSObject>

- (void)donePrintTask;

@end

@interface delegateWoker : NSObject

@property (nonatomic, weak) id<delegateWorkerDelegate> workerDelegate;

- (void)doPrintTask;

@end
