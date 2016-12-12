//
//  LCStatusBarHUD.m
//  关于 UIWindow 的使用
//
//  Created by LiCheng on 2016/12/12.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "LCStatusBarHUD.h"

#define LCFont [UIFont systemFontOfSize:12]
@implementation LCStatusBarHUD

/** 全局窗口 */
static UIWindow *window_;
static NSTimer *timer_;

/**
 *  显示窗口
 */
+(void)showWindow {
    
    // frame
    CGFloat windowH = 20;
    CGFloat windowW = [UIScreen mainScreen].bounds.size.width;
    CGRect frame = CGRectMake(0, -windowH, windowW, windowH);
    
    // 创建窗口
    window_.hidden          = YES; // 隐藏之前的窗口
    window_                 = [[UIWindow alloc] init];
    window_.frame           = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel     = UIWindowLevelAlert;
    window_.hidden          = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:0.25 animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示普通信息
 */
+ (void)showMessage:(NSString *)message{
    
    [self showMessage:message image:nil];
}

/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)success{
    
    [self showMessage:success image:[UIImage imageNamed:@"LCStatusBarHUD.bundle/success"]];
}

/**
 *  显示错误信息
 */
+(void)showError:(NSString *)error{
    [self showMessage:error image:[UIImage imageNamed:@"LCStatusBarHUD.bundle/error"]];

}
/**
 *  显示正在加载
 */
+(void)showLoading:(NSString *)loading{
    
    // 停止之前的定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 文字
    UILabel *label      = [[UILabel alloc] init];
    label.text          = loading;
    label.textColor     = [UIColor whiteColor];
    label.frame         = window_.bounds;
    label.font          = LCFont;
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    // 圈圈
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc] init];
    CGFloat messageW = [loading sizeWithAttributes:@{NSFontAttributeName:LCFont}].width;
    CGFloat centerX  = (window_.frame.size.width - messageW) / 2 - 20;
    CGFloat centerY  = window_.frame.size.height / 2;
    loadView.center  = CGPointMake(centerX, centerY);
    [loadView startAnimating];
    [window_ addSubview:loadView];
    
}

/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)message image:(UIImage *)image{
    
    // 停止上一次的定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 文字和图片
    UIButton *button       = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame           = window_.bounds;
    button.titleLabel.font = LCFont;
    [button setTitle:message forState:(UIControlStateNormal)];
    if (image) {
        [button setImage:image forState:(UIControlStateNormal)];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [window_ addSubview:button];
    
    // 定时消失
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(lc_hidden) userInfo:nil repeats:NO];
}

/**
 *  显示隐藏
 */
+(void)lc_hidden {
    [UIView animateWithDuration:0.25 animations:^{
        // 修改 frame
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;

    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}



@end
