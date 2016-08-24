//
//  Lambda.m
//  BNCategoryProject
//
//  Created by xiaos on 16/8/24.
//  Copyright © 2016年 com.xsdota. All rights reserved.
//

#import "Lambda.h"

@implementation Lambda

- (CurryBlock)compose:(CurryBlock)f
                    and:(CurryBlock)g {
    return ^id(id param) {
        return f(g(param));
    };
}

- (CurryBlock)pipe:(CurryBlock)f
                 and:(CurryBlock)g {
    return ^id(id param){
        return g(f(param));
    };
}

- (CurryBlock)compose:(CurryBlock)f
                    and:(CurryBlock)g
                    and:(CurryBlock)h {
    return ^id(id param) {
        return f(g(h(param)));
    };
}

- (CurryBlock)pipe:(CurryBlock)f
                 and:(CurryBlock)g
                 and:(CurryBlock)h{
    return ^id(id param){
        return h(g(f(param)));
    };
};

@end
