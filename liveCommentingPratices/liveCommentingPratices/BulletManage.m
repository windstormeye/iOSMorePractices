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

@property BOOL isStopAnimation;

@end

@implementation BulletManage

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isStopAnimation = true;
    }
    return self;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithArray:@[@"弹幕1~~~~~~",
                                                       @"弹幕2~~~~",
                                                       @"弹幕3~~~~~~~~~",
                                                       @"弹幕1~~~~~~",
                                                       @"弹幕2~~~~",
                                                       @"弹幕3~~~~~~~~~",
                                                       @"弹幕1~~~~~~",
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
    if (!self.isStopAnimation) {
        return ;
    }
    self.isStopAnimation = false;
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
            [trajectorys removeObjectAtIndex:index];
            // 去除弹幕数据
            NSString* comment = [self.bulletComment firstObject];
            [self.bulletComment removeObjectAtIndex:0];
            // 创建弹幕
            [self createBulletView:comment trajectory:trajectory];
        }
    }
}

- (void)createBulletView:(NSString *)comment trajectory:(int)trajectory {
    if (self.isStopAnimation) {
        return ;
    }
    
    BulletView* bulletView = [[BulletView alloc] initWithComment:comment];
    bulletView.trajectory = trajectory;
    [self.bulletViews addObject:bulletView];
    
    __weak typeof (bulletView) weakBulletView = bulletView;
    __weak typeof (self) weakSelf = self;
    bulletView.moveStatusBlock = ^(MoveStatus status){
        if (self.isStopAnimation) {
            return ;
        }
        
        switch (status) {
            case Start: {
                // 弹幕开始进入屏幕，将view加入弹幕管理的变量bulletViews中
                [weakSelf.bulletViews addObject:weakBulletView];
                break;
            }
            case Enter: {
                // 弹幕完全进入屏幕，判断是否还有其他内容，如果有则在改弹幕轨迹中创建一个弹幕
                NSString *comment = [weakSelf nextComment];
                if (comment) {
                    [weakSelf createBulletView:comment trajectory:trajectory];
                }
                break;
            }
            case End: {
                // 弹幕飞出屏幕后从bulletView中删除，释放资源
                if ([weakSelf.bulletViews containsObject:weakBulletView]) {
                    [weakBulletView stopAnimation];
                    [weakSelf.bulletViews removeObject:weakBulletView];
                }
                if (weakSelf.bulletViews.count == 0) {
                    // 此时屏幕上已无弹幕，开始循环播放
                    self.isStopAnimation = true;
                    [weakSelf start];
                }
                break;
            }
        }
    };
    
    if (self.generateViewBlock) {
        self.generateViewBlock(bulletView);
    }
}

- (NSString *)nextComment {
    if (self.bulletComment.count == 0) {
        return nil;
    }
    NSString *comment = [self.bulletComment firstObject];
    if (comment) {
        [self.bulletComment removeObjectAtIndex:0];
    }
    return comment;
}

- (void)stop {
    if (self.isStopAnimation) {
        return ;
    }
    self.isStopAnimation = true;
    [self.bulletViews enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        BulletView* view = obj;
        [view stopAnimation];
        view = nil;
    }];
    [self.bulletViews removeAllObjects];
}

@end
