//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "NSTimer+BNAdd.h"

@implementation NSTimer (BNAdd)

+ (NSTimer *)scheduledTimer:(NSTimeInterval)ti
           repeats:(BOOL)yesOrNo
             block:(void(^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(bonc_timer_event:) userInfo:[block copy] repeats:yesOrNo];
}

+ (NSTimer *)timer:(NSTimeInterval)ti
           repeats:(BOOL)yesOrNo
             block:(void(^)(NSTimer *timer))block {
    return [NSTimer timerWithTimeInterval:ti target:self selector:@selector(bonc_timer_event:) userInfo:[block copy] repeats:yesOrNo];
}

+ (void)bonc_timer_event:(NSTimer *)timer1 {
    if (timer1.userInfo) {
        void(^block)(NSTimer *timer) = (void(^)(NSTimer *timer))timer1.userInfo;
        block(timer1);
    }
}

- (void)start {
    [self setFireDate:[NSDate distantPast]];
}

- (void)stop {
    [self setFireDate:[NSDate distantFuture]];
}

@end
