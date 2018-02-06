//
//  BulletManage.h
//  liveCommentingPratices
//
//  Created by pjpjpj on 2018/2/5.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BulletView;

@interface BulletManage : NSObject

@property (nonatomic, strong) void(^generateViewBlock)(BulletView *view);

// 弹幕开始
- (void)start;
// 弹幕结束
- (void)stop;

@end
