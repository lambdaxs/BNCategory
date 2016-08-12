//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (BNAdd)

- (void)times:(void (^)(void))block;

- (void)timesWithIndex:(void (^)(NSInteger i))block;

- (void)to:(NSInteger)to do:(void (^)(NSInteger i))block;

+ (NSNumber *)numberWithString:(NSString *)string;

- (NSNumber *(^)(NSNumber *))add;
- (NSNumber *(^)(NSNumber *))mul;
- (NSNumber *(^)(NSNumber *))sub;
- (NSNumber *(^)(NSNumber *))div;

- (BOOL)valiteType:(NSString *)type;

@end

