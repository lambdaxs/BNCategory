//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "UILabel+BNAdd.h"
#import "NSObject+BNAdd.h"
#import "NSString+BNAdd.h"
#import "UIView+BNAdd.h"

@implementation UILabel (BNAdd)


/**
 *  模仿CSS来设置Label属性
 *
 *  @param config
 *  默认文本    text            @"hello" || @3343
 *  字体颜色    color           @"#00ff00" || @"0x00ff00" || @"red" || [UIColor redColor]
 *  字体大小    font-size        @14 || @"14"
 *  对齐方式    align           @"left" || @"right" || @"center" || @"justify" || @"natural"
 *  边框宽度    border-width     @1 || @"1"
 *  边框颜色    border-color     same to color
 *  边框半径    border-radius    @3 || @"3"
 *  背景颜色    background-color same to color
 *  高亮颜色    high-color       same to color
 *
 *  @return UILabel
 */
+ (UILabel *)cssLabel:(NSDictionary *)config {
    UILabel *label = [UILabel new];
    //字体颜色
    label.textColor = [self matchColor:config[@"color"] defalut:[UIColor blackColor]];
    //字体大小
    label.font = [self matchFontSize:config[@"font-size"]];
    //对齐方式
    label.textAlignment = [self matchAlign:config[@"align"]];
    //默认文本
    label.text = [self matchText:config[@"text"]];
    //背景颜色
    label.backgroundColor = [self matchColor:config[@"background-color"] defalut:[UIColor clearColor]];
    //高亮色
    label.highlightedTextColor = [self matchColor:config[@"high-color"] defalut:[UIColor blackColor]];
    
    //边框
    label.layer.cornerRadius = [self matchBorderRadius:config[@"border-radius"]];
    label.layer.borderColor = [self matchBorderColor:config[@"border-color"]];
    label.layer.borderWidth = [self matchBorderWidth:config[@"border-width"]];
    
    if (label.text) {
        [label sizeToFit];
    }
    return label;
}
@end
