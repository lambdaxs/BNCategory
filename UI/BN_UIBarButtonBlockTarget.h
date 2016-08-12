//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BN_UIBarButtonBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);
@property (nonatomic, copy) void (^moreBlock)(id sender,id more);

- (id)initWithBlock:(void (^)(id sender))block;
- (void)invoke:(id)sender;

- (id)initWithMoreBlock:(void(^)(id sender,id more))block;
- (void)invoke:(id)sender and:(id)more;

@end
