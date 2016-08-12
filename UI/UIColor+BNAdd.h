//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BNAdd)
+ (UIColor *)colorWithHex:(NSInteger)hex;
+ (UIColor *(^)(NSArray *))RGB;
@end