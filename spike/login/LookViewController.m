//
//  LookViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/27.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "LookViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface LookViewController (){
    
    UITextField *pwd;
    UITextField *user;
    UITextField *Verification;
    UIButton *additionabtn;
    
}

@end

@implementation LookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesturRecognizer];
     user=[self createTextFielfFrame:CGRectMake(0, 64, WIDTH, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输入手机号"];
    user.delegate = self;
    user.clearButtonMode = UITextFieldViewModeWhileEditing;
    user.backgroundColor=[UIColor whiteColor];
    user.borderStyle=UITextBorderStyleRoundedRect;
    user.textAlignment=NSTextAlignmentLeft ;
    user.enabled=YES;
    [self.view addSubview:user];
    additionabtn=[UIButton buttonWithType:UIButtonTypeCustom];
    additionabtn.frame=CGRectMake(40, HEIGHT*0.8, 20, 20);
    self.view.backgroundColor=[UIColor whiteColor];
    
   Verification=[self createTextFielfFrame:CGRectMake(0, 108, WIDTH, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输验证码"];
    Verification.delegate = self;
    Verification.clearButtonMode = UITextFieldViewModeWhileEditing;
    Verification.backgroundColor=[UIColor whiteColor];
    Verification.borderStyle=UITextBorderStyleRoundedRect;
    Verification.textAlignment=NSTextAlignmentLeft ;
    Verification.enabled=YES;
    additionabtn= [UIButton buttonWithType:UIButtonTypeSystem];
    UIView*ek=[[UIView alloc]initWithFrame:CGRectMake(WIDTH-108, 2, 1, 40)];
    ek.backgroundColor=[UIColor blackColor];
    [Verification addSubview:ek];
    additionabtn.frame = CGRectMake(WIDTH-100, 0, 100, 44);
    [additionabtn setTitle:@"获取验证码" forState:(UIControlStateNormal )];
    additionabtn.backgroundColor=[UIColor whiteColor];
    [additionabtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];

    [Verification addSubview:additionabtn];
    [self.view addSubview:Verification];
    pwd=[self createTextFielfFrame:CGRectMake(0, 152, WIDTH, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输入密码"];
    pwd.delegate = self;
    pwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwd.backgroundColor=[UIColor whiteColor];
    pwd.borderStyle=UITextBorderStyleRoundedRect;
    pwd.textAlignment=NSTextAlignmentLeft ;
    pwd.enabled=YES;
    [self.view addSubview:pwd];
    
    
    
    // Do any additional setup after loading the view.
}
-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor grayColor];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
    
    return textField;
}
-(void)tapAction:(id)tap

{
    
    [self.view endEditing:YES];
    
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
