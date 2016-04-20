//
//  LMFTopProgressHUD.h
//  LMFTopProgressHUDExample
//
//  Created by lumf on 16/4/19.
//  Copyright © 2016年 lumf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMFTopProgressHUD : NSObject

+(void)showMessage:(NSString *)msg;

+(void)showMessage:(NSString *)msg image:(UIImage *)img;

+(void)showSuccess:(NSString *)msg;

+(void)showError:(NSString *)msg;

+(void)loading:(NSString *)msg;

+(void)dissmiss;

@end
