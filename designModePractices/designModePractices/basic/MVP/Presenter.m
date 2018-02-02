//
//  Presenter.m
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "Presenter.h"

@implementation Presenter

- (void)doPrintWork {
    NSString *content = self.mvpModel.contentString;
    self.mvpView.content = content;
}

- (void)MVPViewBtnClick {
    NSInteger interger = random() % 10;
    self.mvpModel.contentString = [NSString stringWithFormat:@"%ld", (long)interger];
    self.mvpView.content = self.mvpModel.contentString;
}

@end
