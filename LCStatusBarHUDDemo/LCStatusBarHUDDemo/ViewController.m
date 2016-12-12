//
//  ViewController.m
//  LCStatusBarHUDDemo
//
//  Created by LiCheng on 2016/12/12.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "ViewController.h"
#import "LCStatusBarHUD.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)success:(id)sender {
    [LCStatusBarHUD showSuccess:@"加载成功 ！"];
}
- (IBAction)error:(id)sender {
    [LCStatusBarHUD showError:@"加载失败！ "];
}
- (IBAction)loading:(id)sender {
    [LCStatusBarHUD showLoading:@"加载中.."];
}
- (IBAction)message:(id)sender {
    [LCStatusBarHUD showMessage:@"普通信息"];
}
- (IBAction)hide:(id)sender {
    [LCStatusBarHUD lc_hidden];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
