//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "UIButton+BNAdd.h"
#import <objc/runtime.h>
#import "BN_UIBarButtonBlockTarget.h"
#import "UIView+BNAdd.h"

static const int BONC_BLOCK_BUTTON_KEY;
@implementation UIButton (BNAdd)

- (void)onClick:(void (^)(UIButton *sender))block {
    BN_UIBarButtonBlockTarget *target = [[BN_UIBarButtonBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &BONC_BLOCK_BUTTON_KEY, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:target action:@selector(invoke:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)on:(UIControlEvents)events do:(void(^)(UIButton *sender))block {
    BN_UIBarButtonBlockTarget *target = [[BN_UIBarButtonBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &BONC_BLOCK_BUTTON_KEY, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:target action:@selector(invoke:) forControlEvents:events];
}

- (void (^)(id)) clickBlock {
    BN_UIBarButtonBlockTarget *target = objc_getAssociatedObject(self, &BONC_BLOCK_BUTTON_KEY);
    return target.block;
}

+ (UIButton *)cssButton:(NSDictionary *)config {
    UIButton *btn = [UIButton new];
    
    //字体大小
    btn.titleLabel.font = [self matchFontSize:config[@"font-size"]];
    
    //背景颜色
    [btn setBackgroundColor:[self matchColor:config[@"background-color"] defalut:[UIColor clearColor]]];
    
    //默认图片
    [btn setImage:config[@"image"] forState:0];
    //选中图片
    [btn setImage:config[@"selected-image"] forState:1];
    
    //默认背景图片
    [btn setBackgroundImage:config[@"background-image"] forState:0];
    //选中背景图片
    [btn setBackgroundImage:config[@"selected-background-image"] forState:1];
    
    //边框
    btn.layer.cornerRadius = [self matchBorderRadius:config[@"border-radius"]];
    btn.layer.borderColor = [self matchBorderColor:config[@"border-color"]];
    btn.layer.borderWidth = [self matchBorderWidth:config[@"border-width"]];
    
    
    //文本颜色 正常状态 黑色
    [btn setTitleColor:[self matchColor:config[@"color"] defalut:[UIColor blackColor]] forState:0];
    //文本颜色 选中状态 黑色
    [btn setTitleColor:[self matchColor:config[@"selected-color"] defalut:[UIColor blackColor]] forState:1];
    
    //默认文本
    [btn setTitle:[self matchText:config[@"text"]] forState:0];
    //选中文本
    if (config[@"selected-text"]) {
        [btn setTitle:[self matchText:config[@"selected-text"]] forState:1];
    }else {
        [btn setTitle:btn.currentTitle forState:1];
    }
    
    
    if (btn.currentTitle) {
        [btn sizeToFit];
    }
    //top left bottom right
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    CGSize btnSize = btn.size;
    btnSize.width += 20;
    [btn setSize:btnSize];
//    [btn setImageEdgeInsets:(UIEdgeInsets){0,0,0,0}];
//
    
    return btn;
}

@end


static const int BONC_BLOCK_BARBUTTON_KEY;
@implementation UIBarButtonItem (BNAdd)

- (void)onClick:(void(^)(UIBarButtonItem *sender))block {
    BN_UIBarButtonBlockTarget *target = [[BN_UIBarButtonBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &BONC_BLOCK_BARBUTTON_KEY, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.target = target;
    self.action = @selector(invoke:);
}

@end

static const int BONC_BLOCK_TEXTFIELD_KEY;
@implementation UITextField (BNAdd)

- (void)onChange:(void(^)(UITextField *sender))block {
    BN_UIBarButtonBlockTarget *target = [[BN_UIBarButtonBlockTarget alloc]initWithBlock:block];
    objc_setAssociatedObject(self, &BONC_BLOCK_TEXTFIELD_KEY, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addTarget:target action:@selector(invoke:) forControlEvents:UIControlEventEditingChanged];
}

@end