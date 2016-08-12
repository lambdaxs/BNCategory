//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "NSNumber+BNAdd.h"
#import "NSString+BNAdd.h"

@implementation NSNumber (BNAdd)

- (void)times:(void (^)(void))block {
    for (NSInteger i = 0; i < self.unsignedIntegerValue; i++) {
        block();
    }
}

- (void)timesWithIndex:(void (^)(NSInteger))block {
    for (NSInteger i = 0 ; i < self.unsignedIntegerValue; i++) {
        block(i);
    }
}

- (void)to:(NSInteger)to do:(void (^)(NSInteger i))block {
    if (self.integerValue > to) {
        [self downTo:to do:^(NSInteger i) {
            block(i);
        }];
    }else {
        [self upTo:to do:^(NSInteger i) {
            block(i);
        }];
    }
}

- (void)upTo:(NSInteger)up do:(void (^)(NSInteger))block {
    if (self.integerValue > up) {
        return;
    }
    
    for (NSInteger i = self.integerValue; i <= up; i++) {
        block(i);
    }
}

- (void)downTo:(NSInteger)down do:(void (^)(NSInteger))block {
    if (self.integerValue < down) {
        return;
    }
    
    for (NSInteger i = self.integerValue; i >= down; i--) {
        block(i);
    }
}

+ (NSNumber *)numberWithString:(NSString *)string {
    NSString *str = [[string trim] lowercaseString];
    if (!str || !str.length) {
        return nil;
    }
    
    static NSDictionary *dic;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dic = @{@"true" :   @(YES),
                @"yes" :    @(YES),
                @"false" :  @(NO),
                @"no" :     @(NO),
                @"nil" :    [NSNull null],
                @"null" :   [NSNull null],
                @"<null>" : [NSNull null]};
    });
    NSNumber *num = dic[str];
    if (num) {
        if (num == (id)[NSNull null]) return nil;
        return num;
    }
    
    // hex number
    int sign = 0;
    if ([str hasPrefix:@"0x"]) sign = 1;
    else if ([str hasPrefix:@"-0x"]) sign = -1;
    if (sign != 0) {
        NSScanner *scan = [NSScanner scannerWithString:str];
        unsigned num = -1;
        BOOL suc = [scan scanHexInt:&num];
        if (suc)
            return [NSNumber numberWithLong:((long)num * sign)];
        else
            return nil;
    }
    // normal number
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter numberFromString:string];
}

- (NSNumber *(^)(NSNumber *))add {
    return ^(NSNumber *num){
        return [self operate:num longBlock:^NSNumber *{
            return @([self integerValue]+[num integerValue]);
        } floatBlock:^NSNumber *{
            return @([self floatValue]+[num floatValue]);
        } doubleBlock:^NSNumber *{
            return @([self doubleValue]+[num doubleValue]);
        } intBlock:^NSNumber *{
            return @([self integerValue]+[num integerValue]);
        }];
    };
}

- (NSNumber *(^)(NSNumber *))sub {
    return ^(NSNumber *num){
        return [self operate:num longBlock:^NSNumber *{
            return @([self integerValue]-[num integerValue]);
        } floatBlock:^NSNumber *{
            return @([self floatValue]-[num floatValue]);
        } doubleBlock:^NSNumber *{
            return @([self doubleValue]-[num doubleValue]);
        } intBlock:^NSNumber *{
            return @([self integerValue]-[num integerValue]);
        }];
    };
}

- (NSNumber *(^)(NSNumber *))mul {
    return ^(NSNumber *num){
        return [self operate:num longBlock:^NSNumber *{
            return @([self integerValue]*[num integerValue]);
        } floatBlock:^NSNumber *{
            return @([self floatValue]*[num floatValue]);
        } doubleBlock:^NSNumber *{
            return @([self doubleValue]*[num doubleValue]);
        } intBlock:^NSNumber *{
            return @([self integerValue]*[num integerValue]);
        }];
    };
}

- (NSNumber *(^)(NSNumber *))div {
    return ^(NSNumber *num){
        return [self operate:num longBlock:^NSNumber *{
            return @([self integerValue]/[num integerValue]);
        } floatBlock:^NSNumber *{
            return @([self floatValue]/[num floatValue]);
        } doubleBlock:^NSNumber *{
            return @([self doubleValue]/[num doubleValue]);
        } intBlock:^NSNumber *{
            return @([self integerValue]/[num integerValue]);
        }];
    };
}

- (NSNumber *)operate:(NSNumber *)num
            longBlock:(NSNumber *(^)())longBlock
           floatBlock:(NSNumber *(^)())floatBlock
          doubleBlock:(NSNumber *(^)())doubleBlock
             intBlock:(NSNumber *(^)())intBlock {
    if ([self valiteType:@"long"] && [num valiteType:@"long"]){//都为整数
        return longBlock();
    }else if ([self valiteType:@"float"] || [num valiteType:@"float"]){//至少一个为浮点数
        return floatBlock();
    }else if([self valiteType:@"double"] || [num valiteType:@"double"]){
        return doubleBlock();
    }else if([self valiteType:@"int"] && [num valiteType:@"int"]){
        return intBlock();
    }
    return @0;
}

- (BOOL)valiteType:(NSString *)type {
    
    BOOL isValite;
    if (strcmp([self objCType], @encode(char)) == 0)
    {
        isValite =  [@"char" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(int)) == 0){
        isValite =  [@"int" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(short)) == 0){
        isValite =  [@"short" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(long)) == 0){
        isValite =  [@"long" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(long long)) == 0){
        isValite =  [@"long long" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(unsigned char)) == 0){
        isValite =  [@"uchar" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(unsigned int)) == 0){
        isValite =  [@"uint" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(unsigned short)) == 0){
        isValite =  [@"ushort" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(unsigned long)) == 0){
        isValite =  [@"ulong" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(float)) == 0){
        isValite =  [@"float" isEqualToString:type];
    }
    else if(strcmp([self objCType], @encode(double)) == 0){
        isValite =  [@"double" isEqualToString:type];
    }else {
        return NO;
    }
    return isValite;
    
}


@end
