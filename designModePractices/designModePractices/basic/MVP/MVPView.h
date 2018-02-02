//
//  MVPView.h
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPModel.h"

@protocol MVPViewDelegete <NSObject>

- (void)MVPViewBtnClick;

@end

@interface MVPView : UIView

@property (nonatomic, strong) NSString*    content;
@property (nonatomic, weak) id<MVPViewDelegete>    viewDelegate;

@end
