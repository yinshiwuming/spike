//
//  ViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/22.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "registeredViewController.h"
#import "MUIViewController.h"
#import "LookViewController.h"
#import "MUIViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface ViewController ()<UITextFieldDelegate>
{
    MBProgressHUD *HUD;
    UITextField *pwd;
    UITextField *user;
    UIView *imageView;
    UILabel *registeredlab;
    UILabel *lookinglab;
    UILabel * additionallab;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    imageView = [[UIView alloc] init];
    imageView.frame = CGRectMake(0,0,WIDTH,HEIGHT);
    imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage  imageNamed:@"20140517014348962"]];
     UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
     [imageView addGestureRecognizer:tapGesturRecognizer];
    [self.view addSubview:imageView];
    [self createTextFields];
    [self createLoginButtons];
    //注册账号的lab在这里添加触摸事件
    registeredlab = [[UILabel alloc] init];
    registeredlab.frame = CGRectMake(40, 291, 60, 44);
    registeredlab.text = @"注册帐号";
    registeredlab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    registeredlab.textColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
    [imageView addSubview:registeredlab];
    registeredlab.userInteractionEnabled=YES;
    UITapGestureRecognizer *registered = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(registered)];
    
    [registeredlab addGestureRecognizer:registered];
    
    
    
    
    
    
    
    //找回密码的lab在这里添加触摸
    
    lookinglab = [[UILabel alloc] init];
    lookinglab.frame = CGRectMake( WIDTH-107, 291, 60, 44);
    lookinglab.text = @"找回密码";
    lookinglab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    lookinglab.textColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
    [imageView addSubview:lookinglab];
    lookinglab.userInteractionEnabled=YES;
    UITapGestureRecognizer *look = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(look)];
    
    [lookinglab addGestureRecognizer:look];
    
  
    
}
-(void)tapAction:(id)tap

{
    
    [self.view endEditing:YES];
    
}


//添加友情提示方法
-(void)mbProgressHUDUntil:(NSString *)title {
    
    
    HUD = [MBProgressHUD showHUDAddedTo:imageView animated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text = title;}
-(void)createTextFields
{
    //    [UIApplication sharedApplication].statusBarHidden = NO;
    //    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        HUD = [MBProgressHUD showHUDAddedTo:imageView animated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text = @"安全验证中";
    HUD.minSize = CGSizeMake(132.f, 108.0f);
#pragma mark 判断是否越狱  判断cydia的URL scheme
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]){
        NSLog(@"The device is jail broken!");
        //是越狱
        [HUD hideAnimated:YES afterDelay:2];
        HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        HUD.removeFromSuperViewOnHide = YES;
        HUD.mode = MBProgressHUDModeIndeterminate;
        HUD.label.text = @"设备已越狱危险";
        HUD.minSize = CGSizeMake(132.f, 108.0f);
        [HUD hideAnimated:YES afterDelay:1];
        
        
    }else{
        NSLog(@"The device is NOT jail broken!");
        //不是越狱
        [HUD hideAnimated:YES afterDelay:0];
        
        HUD = [MBProgressHUD showHUDAddedTo:imageView animated:YES];
        HUD.removeFromSuperViewOnHide = YES;
        HUD.mode = MBProgressHUDModeIndeterminate;
        HUD.label.text = @"设备安全未越狱";
        HUD.minSize = CGSizeMake(132.f, 108.0f);
        
        //        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:(UIBlurEffectStyleLight)]];
        //
        //
        ////        // 2.设定尺寸
        //        effectView.frame = CGRectMake(HUD.center.x-66, HUD.center.y-54, 132.f, 108.0f);
        //
        //        UILabel *label = [[UILabel alloc] initWithFrame:effectView.bounds];
        //        label.text = @"设备安全未越狱";
        //        label.font = [UIFont systemFontOfSize:18.f];
        //        label.textAlignment = NSTextAlignmentCenter;
        //        UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effectView.effect]];
        //        subEffectView.frame = effectView.bounds;
        //
        //        // 将子模糊view添加到effectView的contentView才能生效
        //        [effectView.contentView addSubview:subEffectView];
        //
        //        // 再把要显示特效的控件添加到子模糊view上
        //        [subEffectView.contentView addSubview:label];
        //
        //
        //        //effectView.backgroundColor= [UIColor yellowColor];
        //        // 3.添加到view当中
        //        [HUD addSubview:effectView];
        
        
        
        
        [HUD hideAnimated:YES afterDelay:1];
        
    }
    
    
    
   
    
    user=[self createTextFielfFrame:CGRectMake(40, 158, WIDTH-80, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输入你的手机号"];
    //user.text=@"13419693608";
    //user.keyboardType=UIKeyboardTypeNumberPad;
    user.delegate = self;
    user.clearButtonMode = UITextFieldViewModeWhileEditing;
    user.backgroundColor=[UIColor whiteColor];
    user.borderStyle=UITextBorderStyleRoundedRect;
    user.textAlignment=NSTextAlignmentCenter ;
    user.enabled=YES;
    additionallab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    additionallab.backgroundColor=[UIColor lightGrayColor];
    additionallab.text=@"+86";
    additionallab.textColor=[UIColor darkGrayColor];
    additionallab.textAlignment= NSTextAlignmentCenter;
    [user addSubview:additionallab];
    
    
    pwd=[self createTextFielfFrame:CGRectMake(40, 250, WIDTH-80, 44) font:[UIFont systemFontOfSize:16]  placeholder:@"请输入8位密码区分大小写" ];
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
    [imageView addSubview:user];
    [imageView addSubview:pwd];
    
    
   
    
    [HUD hideAnimated:YES afterDelay:2];
    // [SVProgressHUD dismissWithDelay:2];
    
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
-(void)createLoginButtons
{
    UIButton *landBtn=[self createButtonFrame:CGRectMake(40, HEIGHT*0.6, WIDTH-80, 44) backImageName:nil title:@"登录" titleColor:[UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1]  font:[UIFont systemFontOfSize:19] target:self action:@selector(loginButtonClick)];
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
}
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



//登录方法在这里网络请求
-(void)loginButtonClick
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
    }
    
   
    MUIViewController *vc=[[MUIViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

//这里跳转注册控制器
-(void)registered{
    
    registeredViewController * regis=[[registeredViewController alloc]init];
   // [ self presentViewController:regis animated: YES completion:nil];
    [self.navigationController pushViewController:regis animated:YES];
}

-(void)look{
    
    LookViewController *look=[[LookViewController alloc]init];
    [self.navigationController pushViewController:look animated:YES];
    
    
    
    
}- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
