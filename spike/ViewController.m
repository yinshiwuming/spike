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
#import "AFNetworking.h"
#import "LoginViewController.h"
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
    UILabel *third;
    UIButton *landBtn;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    //    self.navigationController.navigationBar.tintColor =
    //    [UIColor colorWithRed:0.99 green:0.50 blue:0.09 alpha:1.00];
    //主要是以下两个图片设置
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationItem.backBarButtonItem = backItem;
    imageView = [[UIView alloc] init];
    imageView.frame = CGRectMake(0,0,WIDTH,HEIGHT);
    //这里有问题6p的屏幕
    imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage  imageNamed:@"背景"]];
    //imageView.backgroundColor=[UIColor blueColor];
     UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
     [imageView addGestureRecognizer:tapGesturRecognizer];
    [self.view addSubview:imageView];
    [self createTextFields];
    [self createLoginButtons];
    //注册账号的lab在这里添加触摸事件
    registeredlab = [[UILabel alloc] init];
    registeredlab.frame = CGRectMake(40, HEIGHT*0.436, 60, 44);
    registeredlab.text = @"注册帐号";
    registeredlab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    registeredlab.textColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
    [imageView addSubview:registeredlab];
    registeredlab.userInteractionEnabled=YES;
    UITapGestureRecognizer *registered = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(registered)];
    
    [registeredlab addGestureRecognizer:registered];
    
    
    
    
    
    
    
    //找回密码的lab在这里添加触摸
    
    lookinglab = [[UILabel alloc] init];
    lookinglab.frame = CGRectMake( WIDTH-107, HEIGHT*0.436, 60, 44);
    lookinglab.text = @"找回密码";
    lookinglab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    lookinglab.textColor = [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
    [imageView addSubview:lookinglab];
    lookinglab.userInteractionEnabled=YES;
    UITapGestureRecognizer *look = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(look)];
    [lookinglab addGestureRecognizer:look];
    
    UIView*clview=[[UIView alloc]initWithFrame:CGRectMake(WIDTH*0.13, HEIGHT*0.758, WIDTH*0.24, 1)];
    clview.backgroundColor=[UIColor whiteColor];
    
    [imageView addSubview:clview];
    
    UIView*elview=[[UIView alloc]initWithFrame:CGRectMake(WIDTH*0.63, HEIGHT*0.758, WIDTH*0.25, 1)];
    elview.backgroundColor=[UIColor whiteColor];
    [imageView addSubview:elview];
    
    third=[[UILabel alloc]init];
    third.frame=CGRectMake(WIDTH*0.38, HEIGHT*0.75, WIDTH*0.5, 13);
                 
    third.text=@"其他方式登录";
    third.font=[UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    third.textColor= [UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:1];
    [imageView addSubview:third];
    
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
    
    
    
   
    UIView*userview=[[UIView alloc]initWithFrame:CGRectMake(40, HEIGHT*0.236, WIDTH-80, 44)];
    userview.backgroundColor=[UIColor whiteColor];
    userview.layer.cornerRadius = 3;
    
   userview.layer.masksToBounds = YES;
    [imageView addSubview:userview];

    user=[self createTextFielfFrame:CGRectMake(52, 0, WIDTH-130, 44) font:[UIFont systemFontOfSize:16] placeholder:@" 请输入你的手机号"];
    //user.text=@"13419693608";
    user.keyboardType=UIKeyboardTypeNumberPad;
    user.delegate = self;
    user.clearButtonMode = UITextFieldViewModeWhileEditing;
    user.backgroundColor=[UIColor whiteColor];
   // user.borderStyle=UITextBorderStyleRoundedRect;
    //user.textAlignment=NSTextAlignmentCenter ;
    user.enabled=YES;
    additionallab=[[UILabel alloc]initWithFrame:CGRectMake(1, 0, 45, 44)];
    additionallab.backgroundColor=[UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:235.0f/255.0f alpha:0.5];
    additionallab.text=@"+86";
    additionallab.textColor=[UIColor darkGrayColor];
    additionallab.textAlignment= NSTextAlignmentCenter;
   additionallab.layer.cornerRadius = 3.0;
    additionallab.clipsToBounds = YES;
    [userview addSubview:additionallab];
    [userview addSubview:user];
    
    
    pwd=[self createTextFielfFrame:CGRectMake(40, HEIGHT*0.37, WIDTH-80, 44) font:[UIFont systemFontOfSize:16]  placeholder:@"请输入6至12位密码区分大小写" ];
    pwd.delegate = self;
    pwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwd.keyboardType=UIKeyboardTypeWebSearch;
    pwd.layer.cornerRadius = 5.0 ;
    //pwd.text=@"123456";
    //密文样式
    pwd.secureTextEntry=YES;
    pwd.backgroundColor=[UIColor whiteColor];
    pwd.borderStyle=UITextBorderStyleRoundedRect;
    //pwd.textAlignment=NSTextAlignmentCenter ;
    pwd.enabled=YES;
    //[imageView addSubview:user];
    [imageView addSubview:pwd];
    
    [user addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [pwd addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
   
    
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
    
  
    landBtn=[self createButtonFrame:CGRectMake(40, HEIGHT*0.6, WIDTH-80, 44) backImageName:nil title:@"登  录" titleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1]  font:[UIFont systemFontOfSize:19] target:self action:@selector(loginButtonClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
    landBtn.layer.cornerRadius=3.0f;
    
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
    else if (user.text.length <6)
    {
        //[SVProgressHUD showInfoWithStatus:@"亲,帐号长度至少3位"];
        //[SVProgressHUD dismissWithDelay:2];
        [self mbProgressHUDUntil:@"密码最少6位"];
        [HUD hideAnimated:YES afterDelay:2];
        return;
    }
    else if ([pwd.text isEqualToString:@""])
    {
        [self mbProgressHUDUntil:@"请输入密码"];
        [HUD hideAnimated:YES afterDelay:2];
        return;
    }
    
    
    [self loadNewData];
    
    
    
    
  MUIViewController *vc=[[MUIViewController alloc]init];
   [self.navigationController pushViewController:vc animated:YES];
    
    
}

//这里跳转注册控制器
-(void)registered{
    
    registeredViewController * regis=[[registeredViewController alloc]init];
   // [ self presentViewController:regis animated: YES completion:nil];
    [self.navigationController pushViewController:regis animated:YES];
    
    UIBarButtonItem *barbuttonitm=[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem=barbuttonitm;
    
    
}

-(void)look{
    
    LookViewController *look=[[LookViewController alloc]init];
    [self.navigationController pushViewController:look animated:NO];
    
    
    
    
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
-(void)textFieldDidChange:(UITextField *)textField {
    if (textField == user || textField == pwd) {
        if (user.text.length >= 11 && pwd.text.length >= 6) {
            //_loginBtn.selected = YES;
            
            landBtn.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
            
            
            
        } else {
           // _loginBtn.selected = NO;
        }
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == user) {
        if (string.length == 0) return YES;
        
        NSMutableString *newtxt = [NSMutableString stringWithString:textField.text];
        [newtxt replaceCharactersInRange:range withString:string];
        if (newtxt.length > 11) return NO;
    }
    
    
    
    if (textField == pwd) {
        if (string.length == 0) return YES;
        
        NSMutableString *newtxt = [NSMutableString stringWithString:textField.text];
        [newtxt replaceCharactersInRange:range withString:string];
        if (newtxt.length > 12) return NO;
    }
    
    
   
    
    
    
    
    
    return YES;
}
-(void)loadNewData{
    //  NSUserDefaults* user=[NSUserDefaults  standardUserDefaults];
    //    NSString* xieyi=[user objectForKey:@"server_xieyi"];//协议
    //    NSString* tbm_ip=[user objectForKey:@"server_ip"];//ip
    //    NSString* tbm_port=[user objectForKey:@"server_port"];//port
    //    NSString* tbm_token=[user objectForKey:@"tbm_device_token"];//token
    //    NSString* tbm_device=[user objectForKey:@"tbm_device_id"];//token
    
    //    if([xieyi isEqualToString:@"http"]){
    NSString *pone=user.text;
    
    NSString*mima=pwd.text;
    //http://192.168.1.123:9191/coach/userLogin?mobile=15011218654&pwd=123456
    NSString *str = [NSString stringWithFormat:@"http://192.168.1.126:9191/coach/userLogin?mobile=%@&pwd=%@",pone,mima];
    NSLog(@"%@",str);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //AFN 2.5.4
    /**
     manager.securityPolicy.allowInvalidCertificates = YES;
     **/
    //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:str
      parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          //反序列化成字符串
          // NSMutableArray *arry =[NSArray arrayWithArray:responseObject[@""]
          NSNumber *status_range = responseObject[@"status"];//状态
          NSLog(@"%@",status_range);
          int sts=status_range.intValue;
          
          if (sts==2088) {
              
              
              LoginViewController * vc=[[LoginViewController alloc]init];
              [self.navigationController pushViewController:vc animated:YES];
              
              
          }
          
          
         
      }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"==========%@",error);
         }];
}

@end
