//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "BN_UIBarButtonBlockTarget.h"

@implementation BN_UIBarButtonBlockTarget

- (id)initWithBlock:(void (^)(id sender))block{
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender {
    if (self.block) self.block(sender);
}

- (id)initWithMoreBlock:(void(^)(id sender,id more))block{
    self = [super init];
    if (self) {
        _moreBlock = [block copy];
    }
    return self;
}

- (void)invoke:(id)sender and:(id)more{
    if (self.moreBlock) self.moreBlock(sender,more);
}



@end
