//
//  BulletView.m
//  liveCommentingPratices
//
//  Created by pjpjpj on 2018/2/5.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "BulletView.h"

#define Padding 10
#define PhotoHeight 30

@interface BulletView ()

@property (nonatomic, strong) UILabel* commentLable;
@property (nonatomic, strong) UIImageView* commentImageView;

@end

@implementation BulletView

- (UILabel *)commentLable {
    if (!_commentLable) {
        _commentLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _commentLable.font = [UIFont systemFontOfSize:14];
        _commentLable.backgroundColor = [UIColor clearColor];
        _commentLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_commentLable];
    }
    return _commentLable;
}

- (UIImageView *)commentImageView {
    if (!_commentImageView) {
        _commentImageView = [UIImageView new];
        _commentImageView.clipsToBounds = false;
        _commentImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_commentImageView];
    }
    return _commentImageView;
}

- (instancetype)initWithComment:(NSString *)comment {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        NSDictionary* attr = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGFloat width = [comment sizeWithAttributes:attr].width;
        self.bounds = CGRectMake(0, 0, width + 2 * Padding + PhotoHeight, 30);
        
        self.commentLable.text = comment;
        self.commentLable.frame = CGRectMake(Padding + PhotoHeight, 0, width, 30);
        self.commentImageView.frame = CGRectMake(-Padding, -Padding, PhotoHeight + Padding, PhotoHeight + Padding);
        self.commentImageView.layer.cornerRadius = (Padding + PhotoHeight) / 2;
        self.commentImageView.layer.borderColor = [UIColor orangeColor].CGColor;
        self.commentImageView.layer.borderWidth = 1;
        self.commentImageView.image = [UIImage imageNamed:@"11.png"];
    }
    return self;
}

- (void)startAnimation {
    // 根据弹幕长度执行
    // v = s / t
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat duration = 4.0f;
    CGFloat wholeWidth = screenWidth + CGRectGetWidth(self.bounds);
    
    // 弹幕开始
    if (self.moveStatusBlock) {
        self.moveStatusBlock(Start);
    }
    
    // t = s / v
    CGFloat speed = wholeWidth / duration;
    CGFloat enterDuration = CGRectGetWidth(self.bounds) / speed;
    
    [self performSelector:@selector(enterScreen) withObject:nil afterDelay:enterDuration];
    
    __block CGRect frame = self.frame;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        frame.origin.x -= wholeWidth;
        self.frame = frame;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (self.moveStatusBlock) {
            self.moveStatusBlock(End);
        }
    }];
}

- (void)enterScreen {
    if (self.moveStatusBlock) {
        self.moveStatusBlock(Enter);
    }
}

- (void)stopAnimation {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self.layer removeAllAnimations];
    [self removeFromSuperview];
}

@end
