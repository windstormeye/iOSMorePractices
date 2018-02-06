//
//  BulletView.m
//  liveCommentingPratices
//
//  Created by pjpjpj on 2018/2/5.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "BulletView.h"

#define Padding 10

@interface BulletView ()

@property (nonatomic, strong) UILabel* commentLable;

@end

@implementation BulletView

- (UILabel *)commentLable {
    if (!_commentLable) {
        _commentLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _commentLable.font = [UIFont systemFontOfSize:14];
        _commentLable.backgroundColor = [UIColor whiteColor];
        _commentLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_commentLable];
    }
    return _commentLable;
}

- (instancetype)initWithComment:(NSString *)comment {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        NSDictionary* attr = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGFloat width = [comment sizeWithAttributes:attr].width;
        self.bounds = CGRectMake(0, 0, width + 2 * Padding, 30);
        
        self.commentLable.text = comment;
        self.commentLable.frame = CGRectMake(Padding, 0, width, 30);
    }
    return self;
}

- (void)startAnimation {
    // 根据弹幕长度执行
    // v = s / t
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat duration = 4.0f;
    CGFloat wholeWidth = screenWidth + CGRectGetWidth(self.bounds);
    
    __block CGRect frame = self.frame;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        frame.origin.x -= wholeWidth;
        self.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (self.moveStatusBlock) {
            self.moveStatusBlock();
        }
    }];
}

- (void)stopAnimation {
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
}

@end
