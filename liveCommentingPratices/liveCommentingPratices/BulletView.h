//
//  BulletView.h
//  liveCommentingPratices
//
//  Created by pjpjpj on 2018/2/5.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MoveStatus) {
    Start,
    Enter,
    End
};

@interface BulletView : UIView

// 弹幕
@property (nonatomic, assign) int trajectory;
@property (nonatomic, strong) void(^moveStatusBlock)(MoveStatus status);

// 初始化弹幕
- (instancetype)initWithComment:(NSString *)comment;
// 开始动画
- (void)startAnimation;
// 结束动画
- (void)stopAnimation;

@end
