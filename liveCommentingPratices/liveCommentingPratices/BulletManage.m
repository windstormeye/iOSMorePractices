//
//  BulletManage.m
//  liveCommentingPratices
//
//  Created by pjpjpj on 2018/2/5.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "BulletManage.h"
#import "BulletView.h"

@interface BulletManage ()

// 弹幕数据源
@property (nonatomic, strong) NSMutableArray* dataSource;
// 弹幕使用过程中的数组变量
@property (nonatomic, strong) NSMutableArray* bulletComment;
// 存储弹幕view的数组变量
@property (nonatomic, strong) NSMutableArray* bulletViews;

@end

@implementation BulletManage

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithArray:@[@"弹幕1~~~~~~",
                                                       @"弹幕2~~~~",
                                                       @"弹幕3~~~~~~~~~"]];
    }
    return _dataSource;
}

- (NSMutableArray *)bulletComment {
    if (!_bulletComment) {
        _bulletComment = [NSMutableArray array];
    }
    return _bulletComment;
}

- (NSMutableArray *)bulletViews {
    if (!_bulletViews) {
        _bulletViews = [NSMutableArray array];
    }
    return _bulletViews;
}

- (void)start {
    [self.bulletComment removeAllObjects];
    [self.bulletComment addObjectsFromArray:self.dataSource];
    
    [self initBulletComment];
}

- (void)initBulletComment {
    NSMutableArray* trajectorys = [NSMutableArray arrayWithArray:@[@(0),
                                                                  @(1),
                                                                  @(2)]];
    for (int i = 0; i < 3; i++) {
        if (self.bulletComment.count > 0) {
            // 通过随机数获取到弹幕轨迹
            NSInteger index = arc4random() % trajectorys.count;
            int trajectory = [[trajectorys objectAtIndex:index] intValue];
            [trajectorys removeObjectAtIndex:trajectory];
            // 去除弹幕数据
            NSString* comment = [self.bulletComment firstObject];
            [self.bulletComment removeObjectAtIndex:0];
            // 创建弹幕
            [self createBulletView:comment trajectory:trajectory];
        }
    }
}

- (void)createBulletView:(NSString *)comment trajectory:(int)trajectory {
    BulletView* bulletView = [[BulletView alloc] initWithComment:comment];
    bulletView.trajectory = trajectory;
    [self.bulletViews addObject:bulletView];
    
    __weak typeof (bulletView) weakBulletView = bulletView;
    __weak typeof (self) weakSelf = self;
    bulletView.moveStatusBlock = ^{
        [weakBulletView stopAnimation];
        [weakSelf.bulletViews removeObject:weakBulletView];
    };
    
    if (self.generateViewBlock) {
        self.generateViewBlock(bulletView);
    }
}

- (void)stop {
    
}








@end
