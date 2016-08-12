//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BNAdd)

- (CGFloat)left;
- (void)setLeft:(CGFloat)x;

- (CGFloat)top;
- (void)setTop:(CGFloat)y;

- (CGFloat)right;
- (void)setRight:(CGFloat)right;

- (CGFloat)bottom;
- (void)setBottom:(CGFloat)bottom;

- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)centerX;

- (CGFloat)centerY;
- (void)setCenterY:(CGFloat)centerY;

- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

- (CGSize)size;
- (void)setSize:(CGSize)size;

- (void)onCilck:(void(^)(UIGestureRecognizer *g))block;

+ (UIColor *)matchColor:(id)obj defalut:(UIColor *)defalut;
+ (NSUInteger)matchAlign:(id)align;
+ (UIFont *)matchFontSize:(id)fontSzie;
+ (NSString *)matchText:(id)text;
+ (CGFloat)matchFloatValue:(id)num;

#pragma mark - border
+ (CGFloat)matchBorderWidth:(id)obj;
+ (CGColorRef)matchBorderColor:(id)obj;
+ (CGFloat)matchBorderRadius:(id)obj;

@end
