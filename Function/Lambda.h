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

- (CurryBlock)pipe:(CurryBlock)f
                 and:(CurryBlock)g;

- (CurryBlock)pipe:(CurryBlock)f
                 and:(CurryBlock)g
                 and:(CurryBlock)h;

- (CurryBlock)compose:(id(^)(id obj))f
                   and:(id(^)(id obj))g;

- (CurryBlock)compose:(CurryBlock)f
                    and:(CurryBlock)g
                    and:(CurryBlock)h;

@end
