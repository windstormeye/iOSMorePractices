//
//  MVCView.h
//  designModePractices
//
//  Created by pjpjpj on 2018/2/1.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVCModel.h"

@protocol MVCViewDelegete <NSObject>

- (void)MVCViewBtnClick;

@end

@interface MVCView : UIView

@property (nonatomic, strong) MVCModel *model;
@property (nonatomic, weak) id<MVCViewDelegete> viewDelegate;

@end
