//
//  bindingViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/6/4.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "bindingViewController.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "LoginViewController.h"
#import "MUIViewController.h"
@interface bindingViewController ()
{   MBProgressHUD *HUD;
    UITextField *pwd;
    UITextField *user;
    UILabel * additionallab;
    UITextField *code;
    UIButton *checkBox;
    UIButton *landBtn;
    int sts;
}
@property (nonatomic,strong)UILabel *topLAB;
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@end

@implementation bindingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _topLAB=[[UILabel alloc]initWithFrame:CGRectMake(40, HEIGHT*0.135, WIDTH-80, 44)];
    _topLAB.text=@"为了你的帐号安全，请绑定手机号";
    [_topLAB setTextColor:[UIColor whiteColor]];
    _topLAB.font=[UIFont systemFontOfSize:14.0f];
    _topLAB.backgroundColor=[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3];
    _topLAB.textAlignment =NSTextAlignmentCenter;
    _topLAB.layer.cornerRadius = 3.0;
    _topLAB.clipsToBounds = YES;
    [self.view addSubview:_topLAB];
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image=[UIImage imageNamed:@"背景图"];
    [self.view insertSubview:imageView atIndex:0];
    [self createLoginButtons];
   
   // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage  imageNamed:@"背景图"]];
  
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"背景图"ofType:@"jpg"];
//    UIImage *image = [UIImage imageWithContentsOfFile:path];
//    self.view.layer.contents = (id)image.CGImage;
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesturRecognizer];
    
    UIView *vie=[[UIView alloc]initWithFrame:CGRectMake(40, HEIGHT*0.24, WIDTH-80, 44)];
    vie.backgroundColor=[UIColor whiteColor];
    vie.layer.cornerRadius = 3;
    
    vie.layer.masksToBounds = YES;
    
    
    [self.view addSubview:vie];
    user=[self createTextFielfFrame:CGRectMake(58, 0, WIDTH-150, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输入你的手机号"];
    
    user.delegate = self;
    user.clearButtonMode = UITextFieldViewModeWhileEditing;
    user.backgroundColor=[UIColor whiteColor];
    
    user.keyboardType = UIKeyboardTypeNumberPad;
    user.enabled=YES;
    // user.layer.cornerRadius = 1;
    [vie addSubview:user];
    additionallab=[[UILabel alloc]initWithFrame:CGRectMake(2, 0, 50, 44)];
    additionallab.backgroundColor=[UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:235.0f/255.0f alpha:0.5];
    additionallab.text=@"+86";
    additionallab.textColor=[UIColor darkGrayColor];
    additionallab.textAlignment= NSTextAlignmentCenter;
    additionallab.layer.cornerRadius = 3.0;
    additionallab.clipsToBounds = YES;
    [vie addSubview:additionallab];
    [user addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    
    UIView *kl=[[UIView alloc]initWithFrame:CGRectMake(40, HEIGHT*0.35, WIDTH-80, 44)];
    kl.backgroundColor=[UIColor whiteColor];
    kl.layer.cornerRadius = 3;
    
    kl.layer.masksToBounds = YES;
    [self.view addSubview:kl];
    code=[self createTextFielfFrame:CGRectMake(60, 0, WIDTH-146, 44) font:[UIFont systemFontOfSize:13] placeholder:@" "];
    code.delegate = self;
    code.clearButtonMode = UITextFieldViewModeWhileEditing;
    code.backgroundColor=[UIColor whiteColor];
    
    code.enabled=YES;
    
    code.keyboardType = UIKeyboardTypeNumberPad;
    //[self.view addSubview:user];
    [code addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    //后期这里换成bottun
    additionallab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 55, 44)];
    additionallab.backgroundColor=[UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:235.0f/255.0f alpha:0.5];
    additionallab.text=@"获取验证码";
    additionallab.font= [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
    additionallab.textColor=[UIColor darkGrayColor];
    additionallab.textAlignment= NSTextAlignmentCenter;
    additionallab.layer.cornerRadius = 3.0;
    additionallab.layer.masksToBounds = YES;
    additionallab.clipsToBounds = YES;
    additionallab.userInteractionEnabled=YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    [additionallab addGestureRecognizer:labelTapGestureRecognizer];
    
    
    
    
    [kl addSubview:additionallab];
    [kl addSubview:code];
    
    
    
    
    pwd=[self createTextFielfFrame:CGRectMake(40, HEIGHT*0.46, WIDTH-80, 44) font:[UIFont systemFontOfSize:16]  placeholder:@"请输入8至12位密码区分大小写" ];
    pwd.delegate = self;
    pwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwd.keyboardType=UIKeyboardTypeWebSearch;
    //pwd.text=@"123456";
    //密文样式
    pwd.secureTextEntry=YES;
    pwd.backgroundColor=[UIColor whiteColor];
    pwd.borderStyle=UITextBorderStyleRoundedRect;
    // pwd.textAlignment=NSTextAlignmentCenter ;
    pwd.enabled=YES;
    
    [pwd addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    [self.view addSubview:pwd];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    landBtn=[self createButtonFrame:CGRectMake(40, HEIGHT*0.7, WIDTH-80, 44) backImageName:nil title:@"注册" titleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1]  font:[UIFont systemFontOfSize:19] target:self action:@selector(loginButtonClick)];
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
}-(void)loginButtonClick
{
    
    [user resignFirstResponder];
    [pwd resignFirstResponder];
    
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
//    else if ([pwd.text isEqualToString:@""])
//    {
//        [self mbProgressHUDUntil:@"请输入密码"];
//        [HUD hideAnimated:YES afterDelay:2];
//        return;
//    }
//
    [self loadNewData];
    
    
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

-(void)mbProgressHUDUntil:(NSString *)title {
    
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text = title;}
- (void)check:(UIButton *)btn{
    
    //切换按钮选中状态
    checkBox.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    
}
//- (void)viewWillAppear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//
//    [super viewWillAppear:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    [super viewWillDisappear:animated];
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


-(void)textFieldDidChange:(UITextField *)textField {
    if (textField == user || textField == pwd||textField == code) {
        if (user.text.length >= 11 && pwd.text.length >= 8&&code.text.length>=6) {
            //_loginBtn.selected = YES;
            landBtn.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
            
            
            
        }
        if (user.text.length >= 11) {
            additionallab.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
        }
        
        if (user.text.length < 11) {
            additionallab.backgroundColor=[UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
            
        }
        
        
        if (user.text.length <11 || pwd.text.length <8 || code.text.length<6) {
            //_loginBtn.selected = YES;
            landBtn.backgroundColor=[UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
            NSLog(@"要变天了");
            
            
        }
        
        
        
    }
}

- (void)viewWillAppear:(BOOL)animated{
    
    //设置导航栏背景图片为一个空的image，这样就透明了
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //去掉透明后导航栏下边的黑边
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}
- (void)viewWillDisappear:(BOOL)animated{
    
    //    如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
}

-(void)loadNewData{
    
    NSString *pone=user.text;
    NSString*yanzheng=code.text;
    NSString*mima=pwd.text;
    //    //http://192.168.1.123:9191/coach/regAccount?mobile=15011218654&pwd=123456&regCode=836766
    //        NSString *str = [NSString stringWithFormat:@"http://192.168.1.126:9191/coach/regAccount?mobile=%@&pwd=%@&regCode=%@",pone,mima,yanzheng];
    //        NSLog(@"%@",str);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //        //AFN 2.5.4
    //        /**
    manager.securityPolicy.allowInvalidCertificates = YES;
    //         **/
    //        //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    //        [manager GET:str
    //          parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //              //反序列化成字符串
    //              // NSMutableArray *arry =[NSArray arrayWithArray:responseObject[@""]
    //              NSNumber *status_range = responseObject[@"status"];//状态
    //              NSLog(@"%@",status_range);
    ////              NSString *status_msg   = responseObject[@"msg"];//msg
    ////              if([status_range isEqual:@1]){
    ////                  NSArray * ary =  responseObject[@"data"][@"data"];
    ////                  //   NSUserDefaults *dd= [NSUserDefaults standardUserDefaults];
    ////                  //[dd setObject:ary forKey:@"dataary"];
    ////                  //  [dd synchronize];
    ////                  _tgArry =  [myrang  tgWitharry:ary];
    ////                  [_rtableView setHidden:NO];
    ////                  NSLog(@"%@",_tgArry);
    ////                  [self.rtableView reloadData];
    ////                  [self.rtableView.header endRefreshing];
    ////
    //              }
    //           failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //              NSLog(@"==========%@",error);
    //          }];
    //    }
    //
    //
    NSUserDefaults*dd=[NSUserDefaults standardUserDefaults];
     NSString*opid=[dd objectForKey:@"myopenid"];
    [dd synchronize];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"mobile"] =pone;
    params[@"weChatOpenId"] =opid;
    params[@"regCode"] =yanzheng;
    if (sts==5) {
        params[@"pwd"] =mima;
    }
    [manager POST:@"http://192.168.1.126:9191/coach/regAccount" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        
        NSLog(@"绑定了++++%@",responseObject[@"msg"]);
        NSLog(@"********%@",responseObject[@"status"]);
        
        
        if ([responseObject[@"status"] intValue]==2088) {
          
            LoginViewController * vc=[[LoginViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
            
        }
        
        if ([responseObject[@"status"] intValue]==5) {
            
            MUIViewController *vc=[[MUIViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
    
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
    
    
    if (textField == code) {
        if (string.length == 0) return YES;
        
        NSMutableString *newtxt = [NSMutableString stringWithString:textField.text];
        [newtxt replaceCharactersInRange:range withString:string];
        if (newtxt.length > 6) return NO;
    }
    
    
    
    
    
    
    return YES;
}
-(void) labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    
   
    
    NSString *pone=user.text;
    NSString *str = [NSString stringWithFormat:@"http://192.168.1.126:9191/coach/sendCodeWei?mobile=%@",pone];
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
          
          
          
          NSLog(@"+++++%@",status_range);
          NSLog(@"验证码是%@",responseObject[@"msg"]);
          
          
         sts=status_range.intValue;
          
          if (sts==2055) {
             
              //已经注册没有绑定手机号
              pwd.hidden=YES;
              
              
          }
          if (sts==5) {
              
       
             
                //没有注册没有绑定手机号显示密码框
              
          }
          
          
          
          
          
          
          
          //              NSString *status_msg   = responseObject[@"msg"];//msg
          //              if([status_range isEqual:@1]){
          //                  NSArray * ary =  responseObject[@"data"][@"data"];
          //                  //   NSUserDefaults *dd= [NSUserDefaults standardUserDefaults];
          //                  //[dd setObject:ary forKey:@"dataary"];
          //                  //  [dd synchronize];
          //                  _tgArry =  [myrang  tgWitharry:ary];
          //                  [_rtableView setHidden:NO];
          //                  NSLog(@"%@",_tgArry);
          //                  [self.rtableView reloadData];
          //                  [self.rtableView.header endRefreshing];
          //
      }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"==========%@",error);
         }];
    
    
    
    
    
    
    
    
    
    
    
    
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
