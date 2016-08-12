//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "NSDictionary+BNAdd.h"

@implementation NSDictionary (BNAdd)

- (void)each:(void(^)(id key, id value))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        block(key, obj);
    }];
}

- (NSDictionary *)map:(id (^)(id key, id value))block {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self each:^(id key, id value) {
        id result = block(key,value);
        dict[key] = result;
    }];
    return dict;
}

- (NSDictionary *)filter:(BOOL (^)(id key, id value))block {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    [self each:^(id key, id value) {
        if (block(key, value)) {
            dict[key] = value;
        }
    }];
    return dict;
}

- (NSArray *)orderValuesByKeys:(NSArray *)orderKeys {
    NSUInteger count = orderKeys.count;
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i<self.count ; i++) {
        if (i == count) {
            break;
        }
        [result addObject:self[orderKeys[i]]];
    }
    return (NSArray *)result;
}

@end
