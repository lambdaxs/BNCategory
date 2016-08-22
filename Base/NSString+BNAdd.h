//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (BNAdd)

- (NSString *(^)())trim;

- (NSArray<NSString *> *(^)(NSString *))split;

- (NSString *(^)(NSString *oldSrt,NSString *newStr))replace;

- (NSString *(^)(NSString *))append;

- (NSString *(^)(NSUInteger start,NSInteger length))substr;

- (NSString *(^)(NSUInteger))subback;

- (NSString *(^)(NSUInteger))subfront;

- (NSString *(^)(NSUInteger))indexOf;

- (NSUInteger)hex;

- (NSUInteger)itoa:(NSInteger)s;

- (NSString *)hexStr;

@end

@interface NSString (BNAddSize)
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width;
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end

@interface NSString (BNAddColor)
- (UIColor *)colorByStr;
@end

@interface NSString (BNAddCode)
- (NSString *)encodeBase64;
- (NSString *)decodeBase64;
@end
