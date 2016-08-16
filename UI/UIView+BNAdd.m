//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "UIView+BNAdd.h"
#import <objc/runtime.h>
#import "BN_UIBarButtonBlockTarget.h"
#import "NSObject+BNAdd.h"
#import "NSString+BNAdd.h"

static const int BONC_BLOCK_VIEW_KEY;

@implementation UIView (BNAdd)
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)onCilck:(void(^)(UIGestureRecognizer *g))block {
    if (!self.isUserInteractionEnabled){
        self.userInteractionEnabled = YES;
    }
    BN_UIBarButtonBlockTarget *target = [[BN_UIBarButtonBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &BONC_BLOCK_VIEW_KEY, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    static UITapGestureRecognizer *tap;
    tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:@selector(invoke:)];
    [self addGestureRecognizer:tap];
}

#pragma mark - match objects
+ (UIColor *)matchColor:(id)obj defalut:(UIColor *)defalut{
    UIColor *color;
    if ([obj isKindOfClass:[UIColor class]]){
        color = obj;
    }else if([NSObject isStr:obj]){
        color = [obj colorByStr];
    }else {
        color = defalut;
    }
    return color;
}

+ (NSUInteger)matchAlign:(id)align {
    if (![NSObject isStr:align]) return 0;
    
    NSUInteger alignment = 0;
    if (align) {
        if ([align isEqualToString:@"left"]) {
            alignment = 0;
        }else if ([align isEqualToString:@"center"]){
            alignment = 1;
        }else if([align isEqualToString:@"right"]){
            alignment = 2;
        }else if([align isEqualToString:@"justify"]){
            alignment = 3;
        }else if ([align isEqualToString:@"natural"]){
            alignment = 4;
        }else {
            alignment = 0;
        }
    }
    return alignment;
}

+ (UIFont *)matchFontSize:(id)fontSzie {
    CGFloat f = [self matchFloatValue:fontSzie];
    if (f) {
        return [UIFont systemFontOfSize:f];
    }
    return [UIFont systemFontOfSize:17.f];
}

+ (NSString *)matchText:(id)text {
    if (text && [NSObject isStr:text]) {
        return text;
    }else if ([NSObject isNumber:text]){
        return [text stringValue];
    }else {
        return @"未定义";
    }
}

+ (CGFloat)matchFloatValue:(id)num {
    if (num && [NSObject isNumber:num]) {
        return [num floatValue];
    }else if ([NSObject isStr:num]){
        return [num floatValue];
    }else {
        return 0.f;
    }
}

#pragma mark - border
+ (CGFloat)matchBorderWidth:(id)obj {
    return [self matchFloatValue:obj];
}

+ (CGColorRef)matchBorderColor:(id)obj {
    return [self matchColor:obj defalut:[UIColor clearColor]].CGColor;
}

+ (CGFloat)matchBorderRadius:(id)obj {
    return [self matchFloatValue:obj];
}

@end
