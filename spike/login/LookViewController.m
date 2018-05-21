//
//  LookViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/27.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "LookViewController.h"
#import "AFNetworking.h"

#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface LookViewController (){
    
    UITextField *pwd;
    UITextField *user;
    UITextField *Verification;
    UIButton *additionabtn;
    UIButton *look;
    
}

@end

@implementation LookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor
      [self.navigationItem setTitle:@"找回密码"];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:17],
       
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
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
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesturRecognizer];
     user=[self createTextFielfFrame:CGRectMake(10, 64, WIDTH-5, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输入手机号"];
    UIView *avi=[[UIView alloc]initWithFrame:CGRectMake(0, 108, WIDTH, 1)];
    avi.backgroundColor=[UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1];
    [self.view addSubview:avi];
    
    user.delegate = self;
    user.clearButtonMode = UITextFieldViewModeNever;
    user.backgroundColor=[UIColor whiteColor];
   // user.borderStyle=UITextBorderStyleLine;
    user.textAlignment=NSTextAlignmentLeft ;
    user.enabled=YES;
      user.keyboardType = UIKeyboardTypeNumberPad;
     [user addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:user];
    //additionabtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //additionabtn.frame=CGRectMake(40, HEIGHT*0.8, 20, 20);
    self.view.backgroundColor=[UIColor whiteColor];
    
   Verification=[self createTextFielfFrame:CGRectMake(10, 109, WIDTH-10, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输验证码"];
    Verification.delegate = self;
    Verification.clearButtonMode = UITextFieldViewModeNever;
    Verification.backgroundColor=[UIColor whiteColor];
    Verification.borderStyle= UITextBorderStyleNone;
    Verification.textAlignment=NSTextAlignmentLeft ;
    Verification.enabled=YES;
    Verification.keyboardType = UIKeyboardTypeNumberPad;
    UIView *bvi=[[UIView alloc]initWithFrame:CGRectMake(0, 154, WIDTH, 1)];
    bvi.backgroundColor=[UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1];
    [Verification addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:bvi];
    additionabtn= [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-100, 109, 100, 44)];
    UIView*ek=[[UIView alloc]initWithFrame:CGRectMake(WIDTH-108, 6, 1, 30)];
    ek.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [Verification addSubview:ek];
    
    [additionabtn setTitle:@"获取验证码" forState:(UIControlStateNormal )];
    additionabtn.backgroundColor=[UIColor whiteColor];
    additionabtn.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    
    [additionabtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];

    [additionabtn addTarget:self action:@selector(dateChanged)  forControlEvents:UIControlEventTouchUpInside];
    //[button addTarget:self action:@selector(buttonClick/*方法名*/) forControlEvents:UIControlEventTouchUpInside];
    
    //[Verification addSubview:additionabtn];
    [self.view addSubview:Verification];
    [self.view addSubview:additionabtn];
    pwd=[self createTextFielfFrame:CGRectMake(8, 155, WIDTH-8, 44) font:[UIFont systemFontOfSize:16] placeholder:@"请输入6至12位密码区分大小写"];
    pwd.delegate = self;
    pwd.clearButtonMode = UITextFieldViewModeNever;
    pwd.backgroundColor=[UIColor whiteColor];
   // pwd.borderStyle=UITextBorderStyleRoundedRect;
    pwd.layer.cornerRadius = 0.01;
    pwd.textAlignment=NSTextAlignmentLeft ;
    //pwd.keyboardType=UIKeyboardTypeWebSearch;
    pwd.enabled=YES;
    [pwd addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    UIView *cvi=[[UIView alloc]initWithFrame:CGRectMake(0, 199, WIDTH, 1)];
    cvi.backgroundColor=[UIColor colorWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1];
    [self.view addSubview:cvi];
    [self.view addSubview:pwd];
    
    look=[[UIButton alloc]initWithFrame:CGRectMake(44, 338, WIDTH-88, 44)];
    [look setTitle:@"登录" forState:UIControlStateNormal];
   
    [look setTitleColor:[UIColor colorWithRed:153.0f/255.0f green:153.0f/255.0f blue:153.0f/255.0f alpha:1] forState:UIControlStateNormal ];
    look.backgroundColor=[UIColor colorWithRed:241.0f/255.0f green:241.0f/255.0f blue:241.0f/255.0f alpha:1];
    [self.view addSubview:look];
    
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
-(void)dateChanged{
    
    //验证码接口请求
    [self loadNewData];
    NSLog(@"点击了");
    
    
    
    
    
}




-(void)loadNewData{
    //  NSUserDefaults* user=[NSUserDefaults  standardUserDefaults];
    //    NSString* xieyi=[user objectForKey:@"server_xieyi"];//协议
    //    NSString* tbm_ip=[user objectForKey:@"server_ip"];//ip
    //    NSString* tbm_port=[user objectForKey:@"server_port"];//port
    //    NSString* tbm_token=[user objectForKey:@"tbm_device_token"];//token
    //    NSString* tbm_device=[user objectForKey:@"tbm_device_id"];//token
    
    //    if([xieyi isEqualToString:@"http"]){
    NSString *pone=@"15011218654";
    NSString *str = [NSString stringWithFormat:@"http://192.168.1.123:9191/coach/sendCode?mobile=%@",pone];
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
    
    
    if (textField == Verification) {
        if (string.length == 0) return YES;
        
        NSMutableString *newtxt = [NSMutableString stringWithString:textField.text];
        [newtxt replaceCharactersInRange:range withString:string];
        if (newtxt.length > 6) return NO;
    }
    

    return YES;
}-(void)textFieldDidChange:(UITextField *)textField {
    if (textField == user || textField == pwd||textField == Verification) {
        if (user.text.length >= 11 && pwd.text.length >= 6&&Verification.text.length>=6) {
            //_loginBtn.selected = YES;
            look.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
            
            
            
        }
        if (user.text.length >= 11) {
            additionabtn.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
        }
        
        if (user.text.length < 11) {
            additionabtn.backgroundColor=[UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
            
        }
        
        
        if (user.text.length <11 || pwd.text.length <6 || Verification.text.length<6) {
            //_loginBtn.selected = YES;
            look.backgroundColor=[UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1];
            NSLog(@"要变天了");
            
            
        }
        
        
        
    }
}
@end
