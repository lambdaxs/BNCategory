//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (BNAdd)

// @"  123  ".trim() => @"123"
- (NSString *(^)())trim;

// @"1,2,3".split(@",") => @[@"1",@"2",@"3"];
- (NSArray<NSString *> *(^)(NSString *))split;

// @"1-2-3".replace(@"-",@",") => @"1,2,3"
- (NSString *(^)(NSString *oldSrt,NSString *newStr))replace;

// @"1".append(@"2").append(@"3") => @"123"
- (NSString *(^)(NSString *))append;

// @"12345".substr(1,2) => @"23"
- (NSString *(^)(NSUInteger start,NSInteger length))substr;

// @"12345".subback(3) => @"345"
- (NSString *(^)(NSUInteger))subback;

// @"12345".subfront(2) => @"12"
- (NSString *(^)(NSUInteger))subfront;

// @"12345".indexOf(2) => @"2"
- (NSString *(^)(NSUInteger))indexOf;

// @"a".hex() => 10
- (NSUInteger (^)())hex;

// @"a".itoa(16) => 10   @"101010".itoa(2) => 42
- (NSUInteger (^)(NSInteger s))itoa;

// [NSString hexStr:16] => @"10"
+ (NSString *)hexStr:(NSUInteger)num;

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
