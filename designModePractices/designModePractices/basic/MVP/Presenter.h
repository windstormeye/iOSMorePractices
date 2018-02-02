//
//  Presenter.h
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPModel.h"
#import "MVPView.h"

@interface Presenter : NSObject <MVPViewDelegete>

@property (nonatomic, strong) MVPModel*    mvpModel;
@property (nonatomic, strong) MVPView*    mvpView;

- (void)doPrintWork;

@end
