//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (BNAdd)

//在当前runloop中以默认模式运行
+ (NSTimer *)scheduledTimer:(NSTimeInterval)ti
                    repeats:(BOOL)yesOrNo
                      block:(void(^)(NSTimer *timer))block;


//需要添加到runloop中 [NSRunloop currentLoop] addTimer: forMode:    default或comm模式
+ (NSTimer *)timer:(NSTimeInterval)ti
           repeats:(BOOL)yesOrNo
             block:(void(^)(NSTimer *timer))block;


- (void)start;

- (void)stop;

@end
