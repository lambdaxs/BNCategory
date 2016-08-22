//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "NSString+BNAdd.h"
#import "NSArray+BNAdd.h"


@implementation NSString (BNAdd)

- (NSString *(^)(NSString *))append {
    return ^(NSString *str) {
        return [self stringByAppendingString:str];
    };
}

- (NSString *(^)())trim {
    return ^NSString *(){
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        return [self stringByTrimmingCharactersInSet:set];
    };
}

- (NSArray<NSString *> *(^)(NSString *))split {
    return ^(NSString *str){
        return [self componentsSeparatedByString:str];
    };
}

- (NSString *(^)(NSString *oldSrt,NSString *newStr))replace{
    return ^NSString *(NSString *a, NSString *b){
        return self.split(a).join(b);
    };
}

- (NSString *(^)(NSUInteger,NSInteger))substr {
    return ^NSString *(NSUInteger start,NSInteger length){
        if (length < 0){
            NSAssert(self.length - start+length >= 0, @"倒数位下标越界");
            return [self substringWithRange:(NSRange){start, self.length-start+length}];
        }
        NSAssert(start + length <= self.length, @"下标越界");
        return [self substringWithRange:(NSRange){start,length}];
    };
}

- (NSString *(^)(NSUInteger))subback {
    return ^NSString *(NSUInteger index){
        if (index >= self.length) {
            return self;
        }
        return [self substringFromIndex:self.length - index];
    };
}

- (NSString *(^)(NSUInteger))subfront {
    return ^NSString *(NSUInteger index){
        if (index >= self.length) {
            return self;
        }
        return [self substringToIndex:index];
    };
}

- (NSString *(^)(NSUInteger))indexOf{
    return ^NSString *(NSUInteger index){
        NSAssert(index < self.length, @"下标越界");
        unichar charStr = [self characterAtIndex:index];
        return [NSString stringWithFormat:@"%c",charStr];
    };
}

- (NSString *)hexStr {
    //2的64次方转化为十六进制的位数时为16位
    char data[17];
    int num = self.intValue;
    sprintf(data, "%x",num);
    return [NSString stringWithCString:data encoding:NSUTF8StringEncoding];
}

- (NSUInteger)hex {
    UInt64 mac1 =  strtoul([self UTF8String], 0, 16);
    return (NSUInteger)mac1;
    
}

- (NSUInteger)itoa:(NSInteger)s {
    
    UInt64 mac1 =  strtoul([self UTF8String], 0, (int)s);
    return (NSUInteger)mac1;
    
}

@end

@implementation NSString (BNAddSize)
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)width
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    //    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxWidth:MAXFLOAT];
}
@end

@implementation NSString (BNAddColor)
- (UIColor *)colorByStr {
    if ([self hasPrefix:@"#"] || [self hasPrefix:@"0x"]) {//十六进制颜色
        NSString *realStr = self.subback(6);
        NSString *rStr = realStr.subfront(2);
        NSString *gStr = realStr.substr(2,2);
        NSString *bStr = realStr.subback(2);
        
        CGFloat r = [self hexNumWith:rStr].integerValue/255.f;
        CGFloat g = [self hexNumWith:gStr].integerValue/255.f;
        CGFloat b = [self hexNumWith:bStr].integerValue/255.f;
        return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    }else if ([self hasPrefix:@"RGB"]){//RGB颜色 @"RGB(10,20,30)"
        NSArray<NSString *> *rgbArr = self.substr(4,self.length-5).split(@",");
        return [UIColor colorWithRed:rgbArr[0].integerValue/255.0 green:rgbArr[1].integerValue/255.0 blue:rgbArr[2].integerValue/255.0 alpha:1.f];
    }else {//普通颜色
        UIColor *color;
        if ([self isEqualToString:@"red"]) {
            color = [UIColor redColor];
        }else if([self isEqualToString:@"white"]){
            color = [UIColor whiteColor];
        }else if([self isEqualToString:@"yellow"]){
            color = [UIColor yellowColor];
        }else if([self isEqualToString:@"green"]){
            color = [UIColor greenColor];
        }else if([self isEqualToString:@"blue"]){
            color = [UIColor blueColor];
        }else if([self isEqualToString:@"purple"]){
            color = [UIColor purpleColor];
        }else if([self isEqualToString:@"black"]){
            color = [UIColor blackColor];
        }else if([self isEqualToString:@"gray"]){
            color = [UIColor grayColor];
        }else if([self isEqualToString:@"orange"]){
            color = [UIColor orangeColor];
        }else {
            color = [UIColor clearColor];
        }
        return color;
    }
    return [UIColor clearColor];
}

- (NSNumber *)hexNumWith:(NSString *)str {
    int sign = 1;
    
    if ([str hasPrefix:@"-"]) sign = -1;
    if (sign != 0) {
        NSScanner *scan = [NSScanner scannerWithString:str];
        unsigned num = -1;
        BOOL suc = [scan scanHexInt:&num];
        if (suc)
            return [NSNumber numberWithLong:((long)num * sign)];
        else
            return nil;
    }
    return nil;
}
@end

@implementation NSString (BNAddCode)

- (NSString *)encodeBase64 {
    NSData* originData = [self dataUsingEncoding:NSASCIIStringEncoding];
    NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return encodeResult;
}

- (NSString *)decodeBase64 {
    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [[NSString alloc] initWithData:decodeData encoding:NSASCIIStringEncoding];
}

@end