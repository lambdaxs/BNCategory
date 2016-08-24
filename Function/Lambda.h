//
//  Lambda.h
//  BNCategoryProject
//
//  Created by xiaos on 16/8/24.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BNMacro.h"

@interface Lambda : NSObject

+ (CurryBlock)pipe:(id(^)(id obj))f
               and:(id(^)(id obj))g;

+ (CurryBlock)pipe:(id(^)(id obj))f
               and:(id(^)(id obj))g
               and:(id(^)(id obj))h;

+ (CurryBlock)pipe:(id(^)(id obj))f
               and:(id(^)(id obj))g
               and:(id(^)(id obj))h
               and:(id(^)(id obj))k;

+ (CurryBlock)compose:(id(^)(id obj))f
                  and:(id(^)(id obj))g;

+ (CurryBlock)compose:(id(^)(id obj))f
                  and:(id(^)(id obj))g
                  and:(id(^)(id obj))h;

+ (CurryBlock)compose:(id(^)(id obj))f
                  and:(id(^)(id obj))g
                  and:(id(^)(id obj))h
                  and:(id(^)(id obj))k;
@end
