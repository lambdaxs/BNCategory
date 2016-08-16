//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BNAdd)
- (void)setExtraInfo:(NSDictionary *)dict;
- (NSDictionary *)extraInfo;

- (void)setId:(NSString *)id;
- (NSString *)id;

- (void)setExtraView:(NSMutableDictionary *)dict;
- (NSMutableDictionary *)extraView;

- (void)setView:(id)view byId:(NSString *)idStr;
- (id)viewById:(NSString *)idStr;

#pragma mark - KVO
- (void)watchForKeyPath:(NSString *)keyPath block:(void(^)(id obj, id oldVal, id newVal))block;

- (void)unWatchForKeyPath:(NSString *)keyPath;

- (void)unWathAll;

#pragma mark - typeResult 
+ (BOOL)isStr:(id)obj;
+ (BOOL)isNumber:(id)obj;
+ (BOOL)isArray:(id)obj;
+ (BOOL)isDict:(id)obj;
+ (BOOL)isSet:(id)obj;
+ (BOOL)isNull:(id)obj;
+ (BOOL)isType:(id)obj class:(Class)c;
@end