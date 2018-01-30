//
//  instanceModel.h
//  pageValuePractices
//
//  Created by pjpjpj on 2018/1/30.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface instanceModel : NSObject

+ (instancetype)shareInstance;

@property (nonatomic, strong) NSString* instanceString;

@end
