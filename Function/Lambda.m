//
//  Lambda.m
//  BNCategoryProject
//
//  Created by xiaos on 16/8/24.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "Lambda.h"

@implementation Lambda



+ (CurryBlock)pipe:(CurryBlock)f
               and:(CurryBlock)g
{
    return ^id(id param){
        return g(f(param));
    };
}

+ (CurryBlock)pipe:(CurryBlock)f
               and:(CurryBlock)g
               and:(CurryBlock)h
{
    return ^id(id param){
        return h(g(f(param)));
    };
}

+ (CurryBlock)pipe:(CurryBlock)f
               and:(CurryBlock)g
               and:(CurryBlock)h
               and:(CurryBlock)k
{
    return ^id(id param){
        return k(h(g(f(param))));
    };
}

+ (CurryBlock)compose:(CurryBlock)f
                  and:(CurryBlock)g
{
    return ^id(id param) {
        return f(g(param));
    };
}

+ (CurryBlock)compose:(CurryBlock)f
                    and:(CurryBlock)g
                    and:(CurryBlock)h
{
    return ^id(id param) {
        return f(g(h(param)));
    };
}

+ (CurryBlock)compose:(CurryBlock)f
                  and:(CurryBlock)g
                  and:(CurryBlock)h
                  and:(CurryBlock)k
{
    return ^id(id param) {
        return f(g(h(k(param))));
    };
}


@end
