//
//  LCStatusBarHUD.h
//  关于 UIWindow 的使用
//
//  Created by LiCheng on 2016/12/12.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCStatusBarHUD : NSObject


/**
 *  普通信息显示
 *  @param message 文字
 *  @param image 图片
 *
 */
+(void)showMessage:(NSString *)message image:(UIImage *)image;

/**
 *  普通信息显示
 */
+(void)showMessage:(NSString *)message;

/**
 *  成功显示
 */
+(void)showSuccess:(NSString *)success;

/**
 *  失败显示
 */
+(void)showError:(NSString *)error;

/**
 *  正在加载显示
 */
+(void)showLoading:(NSString *)loading;

/**
 *  取消显示
 */
+(void)lc_hidden;

@end
