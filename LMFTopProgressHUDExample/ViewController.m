//
//  ViewController.m
//  LMFTopProgressHUDExample
//
//  Created by lumf on 16/4/19.
//  Copyright © 2016年 lumf. All rights reserved.
//

#import "ViewController.h"
#import "LMFTopProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [LMFTopProgressHUD showMessage:@"hahahaha"];
}
- (IBAction)message:(id)sender {
    [LMFTopProgressHUD showMessage:@"不错不错"];
}
- (IBAction)image:(id)sender {
    UIImage *image = [UIImage imageNamed:@"success"];
    [LMFTopProgressHUD showMessage:@"图片展示" image:image];
}
- (IBAction)success:(id)sender {
    [LMFTopProgressHUD showSuccess:@"成功"];
}
- (IBAction)fail:(id)sender {
    
    [LMFTopProgressHUD showError:@"失败"];
}
- (IBAction)hide:(id)sender {
    [LMFTopProgressHUD dissmiss];
}

- (IBAction)loading:(id)sender {
    [LMFTopProgressHUD loading:@"正在加载中。。。"];
}
@end
