//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BNAdd)

- (void)showMessage:(NSString *)msg;
- (void)showMessage:(NSString *)msg delay:(double)d;
- (void)showHUD:(NSString *)msg form:(UIView *)fromview delay:(double)delay;
@end
