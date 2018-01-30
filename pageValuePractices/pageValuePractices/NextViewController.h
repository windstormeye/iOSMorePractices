//
//  NextViewController.h
//  pageValuePractices
//
//  Created by pjpjpj on 2018/1/30.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NextViewControllerDelegate <NSObject>

- (void)passValueOfProtocol:(NSString *)string;

@end

@interface NextViewController : UIViewController

@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString* propertyPassValue;
@property (nonatomic, weak) id<NextViewControllerDelegate> vcDelegate;
@property (nonatomic, copy) void (^passValueBlock)(NSString *);

- (void)passValueType:(NSInteger)type passValueString:(NSString *)string;


@end
