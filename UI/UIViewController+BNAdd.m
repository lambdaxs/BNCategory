//
// Created by xiaos on 15/6/24.
// Copyright (c) 2016 com.xsdota. All rights reserved.
//

#import "UIViewController+BNAdd.h"
#import "UIView+BNAdd.h"
#import "NSString+BNAdd.h"

@implementation UIViewController (BNAdd)

- (void)showMessage:(NSString *)msg{
    [self showHUD:msg form:nil delay:1.5];
}

- (void)showMessage:(NSString *)msg delay:(double)d{
    [self showHUD:msg form:nil delay:d];
}

//在指定的view上显示
- (void)showHUD:(NSString *)msg form:(UIView *)fromview delay:(double)delay{
    if (!msg.length) return;
    UIFont *font = [UIFont systemFontOfSize:17];
    CGSize size = [msg sizeWithFont:font maxSize:CGSizeMake(200, 200)];
    UILabel *label = [UILabel new];
    label.size = size;
    label.font = font;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 0;
    
    UIView *hud = [UIView new];
    hud.size = CGSizeMake(label.width + 20, label.height + 20);
    hud.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.650];
    hud.clipsToBounds = YES;
    hud.layer.cornerRadius = 3;
    
    label.center = CGPointMake(hud.width / 2, hud.height / 2);
    [hud addSubview:label];
    
    hud.alpha = 0;
    
    if (fromview) {
        hud.center = CGPointMake(fromview.width / 2, fromview.height / 2);
        [fromview addSubview:hud];
    }else {
        UIWindow *window = [[UIApplication sharedApplication].delegate window];
        hud.center = window.center;
        [window addSubview:hud];
    }
    
    [UIView animateWithDuration:0.4 animations:^{
        hud.alpha = 1;
    }];
    
    double delayInSeconds = delay?:1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [UIView animateWithDuration:0.4 animations:^{
            hud.alpha = 0;
        } completion:^(BOOL finished) {
            [hud removeFromSuperview];
        }];
    });
}

@end

