//
//  registeredViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/22.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "registeredViewController.h"
#import "MBProgressHUD.h"
#import "LoginViewController.h"
@interface registeredViewController ()
{   MBProgressHUD *HUD;
    UITextField *pwd;
    UITextField *user;
    UILabel * additionallab;
    UITextField *code;
    UIButton *checkBox;
}
@property (nonatomic,strong)UILabel *topLAB;
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@end

@implementation registeredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _topLAB=[[UILabel alloc]initWithFrame:CGRectMake(40, 90, WIDTH-80, 44)];
    _topLAB.text=@"为了你的帐号安全，请绑定手机号";
    _topLAB.backgroundColor=[UIColor whiteColor];
    _topLAB.textAlignment =NSTextAlignmentCenter;
    [self.view addSubview:_topLAB];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage  imageNamed:@"20140517014348962"]];
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesturRecognizer];
    
    
    user=[self createTextFielfFrame:CGRectMake(40, 158, WIDTH-80, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输入你的手机号"];
    //user.text=@"13419693608";
    //user.keyboardType=UIKeyboardTypeNumberPad;
    user.delegate = self;
    user.clearButtonMode = UITextFieldViewModeWhileEditing;
    user.backgroundColor=[UIColor whiteColor];
    user.borderStyle=UITextBorderStyleRoundedRect;
    user.textAlignment=NSTextAlignmentCenter ;
    user.enabled=YES;
    [self.view addSubview:user];
    additionallab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    additionallab.backgroundColor=[UIColor lightGrayColor];
    additionallab.text=@"+86";
    additionallab.textColor=[UIColor darkGrayColor];
    additionallab.textAlignment= NSTextAlignmentCenter;
    [user addSubview:additionallab];
    
     code=[self createTextFielfFrame:CGRectMake(40, 238, WIDTH-80, 44) font:[UIFont systemFontOfSize:8] placeholder:@""];
    code.delegate = self;
    code.clearButtonMode = UITextFieldViewModeWhileEditing;
    code.backgroundColor=[UIColor whiteColor];
    code.borderStyle=UITextBorderStyleRoundedRect;
    code.textAlignment=NSTextAlignmentCenter ;
    code.enabled=YES;
    [self.view addSubview:user];
    //后期这里换成bottun
    additionallab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 55, 44)];
    additionallab.backgroundColor=[UIColor lightGrayColor];
    additionallab.text=@"获取验证码";
    additionallab.font= [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
    additionallab.textColor=[UIColor darkGrayColor];
    additionallab.textAlignment= NSTextAlignmentCenter;
    [code addSubview:additionallab];
    [self.view addSubview:code];
    
    
    
    
    pwd=[self createTextFielfFrame:CGRectMake(40, 309, WIDTH-80, 44) font:[UIFont systemFontOfSize:16]  placeholder:@"请输入8位密码区分大小写" ];
    pwd.delegate = self;
    pwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwd.keyboardType=UIKeyboardTypeWebSearch;
    //pwd.text=@"123456";
    //密文样式
    pwd.secureTextEntry=YES;
    pwd.backgroundColor=[UIColor whiteColor];
    pwd.borderStyle=UITextBorderStyleRoundedRect;
    pwd.textAlignment=NSTextAlignmentCenter ;
    pwd.enabled=YES;
    [self.view addSubview:pwd];
   //选中按钮
    
    // 加一个背景颜色，方便查看效果
   
    
    checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.frame=CGRectMake(40, HEIGHT*0.8, 20, 20);
    checkBox.backgroundColor=[UIColor whiteColor];
    [checkBox setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"check"] forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(check:) forControlEvents:UIControlEventTouchUpInside];
    checkBox.layer.cornerRadius=5;
    checkBox.layer.masksToBounds=YES;
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(70, HEIGHT*0.8, 166, 20)];
    label.text=@"点击完成则同意《用户协议》";
    label.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    label.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:label];
    [self.view addSubview:checkBox];
    
    // Do any additional setup after loading the view.
    //创建登录按钮
    [self createLoginButtons];
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
-(void)createLoginButtons
{
    UIButton *landBtn=[self createButtonFrame:CGRectMake(40, HEIGHT*0.7, WIDTH-80, 44) backImageName:nil title:@"完成" titleColor:[UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1]  font:[UIFont systemFontOfSize:19] target:self action:@selector(loginButtonClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    //fogotPwdBtn.backgroundColor=[UIColor lightGrayColor];
    
    
#define Start_X 60.0f           // 第一个按钮的X坐标
#define Start_Y 440.0f           // 第一个按钮的Y坐标
#define Width_Space 50.0f        // 2个按钮之间的横间距
#define Height_Space 20.0f      // 竖间距
#define Button_Height 50.0f    // 高
#define Button_Width 50.0f      // 宽
    
    
    [self.view addSubview:landBtn];
}-(void)loginButtonClick
{
    
    [user resignFirstResponder];
    [pwd resignFirstResponder];
    //[SVProgressHUD showWithStatus:@"正在验证..."];
    // [SVProgressHUD showInfoWithStatus:@"正在验证..."];
    // [self mbProgressHUDUntil:@"正在登录"];
    
    //[SVProgressHUD   showSuccessWithStatus:@"正在验证..."];
    if ([user.text isEqualToString:@""])
    {
        [self mbProgressHUDUntil:@"请输入账号"];
        [HUD hideAnimated:YES afterDelay:2];
        LoginViewController * vc=[[LoginViewController alloc]init];
        
        
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    else if (user.text.length <1)
    {
        //[SVProgressHUD showInfoWithStatus:@"亲,帐号长度至少3位"];
        //[SVProgressHUD dismissWithDelay:2];
        return;
    }
    else if ([pwd.text isEqualToString:@""])
    {
        [self mbProgressHUDUntil:@"请输入密码"];
        [HUD hideAnimated:YES afterDelay:2];
        return;
    }}
-(UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    if (imageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (font)
    {
        btn.titleLabel.font=font;
    }
    
    if (title)
    {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color)
    {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target&&action)
    {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)mbProgressHUDUntil:(NSString *)title {
    
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text = title;}
- (void)check:(UIButton *)btn{
    
    checkBox.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
   
    }
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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
