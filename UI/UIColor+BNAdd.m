//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "UIColor+BNAdd.h"
#import "NSArray+BNAdd.h"
#import "NSNumber+BNAdd.h"

@implementation UIColor (BNAdd)

+ (UIColor *)colorWithHex:(NSInteger)hex {
    CGFloat r = (hex&0xff0000) >> 16;
    CGFloat g = (hex&0xff0000) >> 8;
    CGFloat b = (hex&0xff0000);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.f];
}

+ (UIColor *(^)(NSArray *))RGB {
    return ^UIColor *(NSArray *arr){
        if (arr.count != 3) {
            return [UIColor clearColor];
        }
        NSArray *result;
        if ([arr[0] isKindOfClass:[NSString class]]) {
            result = arr.map(^id (id obj){
                return [NSNumber numberWithString:obj];
            });
        }else {
            result = arr;
        }
        return [UIColor colorWithRed:[arr[0] floatValue]/255.0 green:[arr[1] floatValue]/255.0 blue:[arr[2] floatValue]/255.0 alpha:1];
    };
}

@end