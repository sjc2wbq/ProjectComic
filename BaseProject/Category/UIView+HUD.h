//
//  UIView+HUD.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/1.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIView (HUD)
//忙提示
- (void)showBusyHUD;
//文字提示
- (void)showWarning:(NSString *)warning;
//隐藏提示
- (void)hideBusyHUD;
@end
