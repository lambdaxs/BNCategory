//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BNAdd)

- (void)each:(void(^)(id key, id value))block;

- (NSDictionary *)map:(id (^)(id key, id value))block;

- (NSDictionary *)filter:(BOOL (^)(id key, id value))block;

- (NSArray *)orderValuesByKeys:(NSArray *)orderKeys;
@end
