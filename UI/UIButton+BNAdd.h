//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BNAdd)
- (void)onClick:(void (^)(UIButton *sender))block;
- (void)on:(UIControlEvents)events do:(void(^)(UIButton *sender))block;

+ (UIButton *)cssButton:(NSDictionary *)config;
@end

@interface UIBarButtonItem (BNAdd)
- (void)onClick:(void(^)(UIBarButtonItem *sender))block;
@end

@interface UITextField (BNAdd)
- (void)onChange:(void(^)(UITextField *sender))block;
@end