//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BNAdd)

//range数组
+ (NSArray<NSNumber *> *(^)(NSInteger start,NSInteger end))range;

//T 转置 二维数组行列互换
+ (NSArray *)turn:(NSArray<NSArray *> *)arr;

//返回数组中任意一个对象
- (id)randomItem;

//得到一个反序数组
- (NSArray *(^)())reverse;

//遍历操作
//正序遍历
- (void)forEach:(void (^)(id obj))block;
- (void)forEachWithIndex:(void (^)(id obj, NSUInteger index))block;

//反序遍历
- (void)reverseEach:(void (^)(id obj))block;
- (void)reverseEachWithIndex:(void (^)(id obj, NSUInteger index))block;

//异步遍历
- (void)asynEach:(void (^)(id obj))blcok;

//every
- (BOOL)every:(BOOL (^)(id obj))block;
//some
- (BOOL)some:(BOOL(^)(id obj))block;

//map
- (NSArray *(^)(id))map;

//filter
- (NSArray *(^)(id))filter;
//- (NSArray *(^)(BOOL (^)(id obj,NSUInteger index)))filterWithIndex;

//reduce
- (id)reduce:(id)init with:(id (^)(id a, id b))blcok;
- (id)reduceRight:(id)init with:(id (^)(id, id))blcok;

//聚合数组中的字符串
- (NSString *(^)(NSString *))join;

//连接数组
- (NSArray *(^)(id,...))concat;

//索引
- (BOOL)has:(id)obj;

- (NSInteger)indexOf:(id)obj;

- (NSInteger)lastIndexOf:(id)obj;

//数组转字典@[@[keys],@[values]] => @{key1:@value1,...}
- (NSDictionary *)toDictionary;

@end

@interface NSMutableArray (BNAdd)

//pop
- (id)pop;

//push
- (void)push:(id)obj;

//shift 去头
- (id)shift;

//un_shift  加头
- (void)unshift:(id)obj;

@end

