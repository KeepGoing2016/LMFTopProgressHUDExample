//
//  LMFTopProgressHUD.m
//  LMFTopProgressHUDExample
//
//  Created by lumf on 16/4/19.
//  Copyright © 2016年 lumf. All rights reserved.
//

#import "LMFTopProgressHUD.h"

#define LMFAnimationTime 0.25
#define LMFAnimationStayTime 2.0

@implementation LMFTopProgressHUD

static const CGFloat LMFLoadingLableFont = 12;
static const CGFloat LMFWindowH = 20;

static UIWindow *window_;
static NSTimer *timer_;

+(void)showWindow{
    CGFloat windowH = 20;
    window_ = [[UIWindow alloc]initWithFrame:CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH)];
//    window_.hidden = YES;
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
   
    [UIView animateWithDuration:LMFAnimationTime animations:^{
//        window_.transform = CGAffineTransformMakeTranslation(0, windowH);
        window_.frame = CGRectMake(0, 0,  [UIScreen mainScreen].bounds.size.width, windowH);
    }];
//    timer_ = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(dissmiss) userInfo:nil repeats:NO];
    timer_ = [NSTimer scheduledTimerWithTimeInterval:LMFAnimationStayTime target:self selector:@selector(dissmiss) userInfo:nil repeats:NO];
}

+(void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
}

+(void)showMessage:(NSString *)msg image:(UIImage *)img{
    
    [timer_ invalidate];
    timer_ = nil;
    [self showWindow];
    UIButton *tipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tipButton setTitle:msg forState:UIControlStateNormal];
    tipButton.frame = window_.bounds;
    if (img!=nil) {
        [tipButton setImage:img forState:UIControlStateNormal];
        [tipButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    }
    [window_ addSubview:tipButton];
}

+(void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"LMFTopProgressHUD.bundle/success"]];
}

+(void)loading:(NSString *)msg{
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    UILabel *tipLable = [[UILabel alloc]init];
    tipLable.text = msg;
    tipLable.frame = window_.bounds;
    tipLable.font = [UIFont systemFontOfSize:LMFLoadingLableFont];
    tipLable.textAlignment = NSTextAlignmentCenter;
    tipLable.textColor = [UIColor whiteColor];
    [window_ addSubview:tipLable];
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGSize msgSize = [msg sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:LMFLoadingLableFont]}];
    CGFloat indicatorViewX = [UIScreen mainScreen].bounds.size.width/2.0 - msgSize.width/2.0-20;
    indicatorView.center = CGPointMake(indicatorViewX, LMFWindowH*0.5);
    [indicatorView startAnimating];
    [window_ addSubview:indicatorView];
}

+(void)showError:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"LMFTopProgressHUD.bundle/error"]];
}
+(void)dissmiss{
    CGRect wFrame = window_.frame;
    wFrame.origin.y = -wFrame.size.height;
    [UIView animateWithDuration:LMFAnimationTime animations:^{
        window_.frame = wFrame;
    } completion:^(BOOL finished) {
        window_=nil;
        timer_=nil;
    }];
}

@end
