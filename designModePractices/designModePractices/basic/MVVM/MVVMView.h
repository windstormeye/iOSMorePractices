//
//  MVVMView.h
//  designModePractices
//
//  Created by pjpjpj on 2018/2/2.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MVVMViewModel.h"

@interface MVVMView : UIView

@property (nonatomic, strong) NSString*    content;

- (void)setWithViewModel:(MVVMViewModel *)vm;

@end
