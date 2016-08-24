//
//  BNMaro.h
//  BNCategoryProject
//
//  Created by xiaos on 16/8/24.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#ifndef BNMaro_h
#define BNMaro_h

typedef id(^CurryBlock)(id);
typedef id(^CurryStrBlock)(NSString *);
typedef id(^CurryNumBlock)(NSNumber *);
typedef id(^CurryArrBlock)(NSArray *);
typedef id(^CurryDictBlock)(NSDictionary *);
#define Curry          ^id(id obj)
#define CurryStr       ^id(NSString *obj)
#define CurryNum       ^id(NSNumber *obj)
#define CurryArr       ^id(NSArray *obj)
#define CurryDict      ^id(NSDictionary *obj)

typedef id(^MapBlock)(id,NSUInteger);
typedef id(^MapStrBlock)(NSString *,NSUInteger);
typedef id(^MapNumBlock)(NSNumber *,NSUInteger);
typedef id(^MapArrBlock)(NSArray *,NSUInteger);
typedef id(^MapDictBlock)(NSDictionary *,NSUInteger);
#define Map       ^id (id obj,NSUInteger index)
#define MapStr    ^id (NSString *obj,NSUInteger index)
#define MapNum    ^id (NSNumber *obj,NSUInteger index)
#define MapArr    ^id (NSArray *obj,NSUInteger index)
#define MapDict   ^id (NSDictionary *obj,NSUInteger index)

typedef BOOL(^FilterBlock)(id,NSUInteger);
typedef BOOL(^FilterStrBlock)(NSString *,NSUInteger);
typedef BOOL(^FilterNumBlock)(NSNumber *,NSUInteger);
typedef BOOL(^FilterArrBlock)(NSArray *,NSUInteger);
typedef BOOL(^FilterDictBlock)(NSDictionary *,NSUInteger);
#define Filter     ^BOOL (id obj,NSUInteger index)
#define FilterStr  ^BOOL (NSString *obj,NSUInteger index)
#define FilterNum  ^BOOL (NSNumber *obj,NSUInteger index)
#define FilterArr  ^BOOL (NSArray *obj,NSUInteger index)
#define FilterDict ^BOOL (NSDictionary *obj,NSUInteger index)


#endif /* BNMaro_h */
