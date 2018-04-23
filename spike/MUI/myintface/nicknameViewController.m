//
//  nicknameViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "nicknameViewController.h"

@interface nicknameViewController ()

@end

@implementation nicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
     UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(0, 88,375 , 30)];
      text.borderStyle = UITextBorderStyleRoundedRect;
     text.backgroundColor = [UIColor whiteColor];
     text.placeholder = @"   请输入昵称";
    text.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:text];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 130, 200, 20)];
    lab.text = @"2-10个字符，只能输入中英文或数字 ";
    lab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9];
    lab.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [self.view addSubview:lab];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 618, 375, 49)];
    btn.backgroundColor=[UIColor yellowColor];
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
