//
//  nicknameViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "nicknameViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface nicknameViewController (){
    
    UITextField *text ;
    MBProgressHUD *HUD;
    
    
}

@end

@implementation nicknameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesturRecognizer];
    
    
    
    [self.navigationItem setTitle:@"修改昵称"];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    UIView *vie=[[UIView alloc]initWithFrame:CGRectMake(0, 88,WIDTH, 44)];
    vie.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:vie];
    text = [[UITextField alloc]initWithFrame:CGRectMake(7, 0,WIDTH-7, 44)];
//    text.borderStyle = UITextBorderStyleRoundedRect;
     text.backgroundColor = [UIColor whiteColor];
     text.placeholder = @"   请输入昵称";
    text.clearButtonMode = UITextFieldViewModeAlways;
    [vie addSubview:text];
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(20, 140, 200, 20)];
    lab.text = @"2-10个字符，只能输入中英文或数字 ";
    lab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9];
    lab.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
    [self.view addSubview:lab];
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WIDTH, 49)];
    btn.backgroundColor= [UIColor colorWithRed:229/255.f green:229/255.f blue:229/255.f alpha:1];
    //[UIColor colorWithRed:30/255.f green:140/255.f blue:220/255.f alpha:1];
    
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tapAction:(id)tap

{
    
    [self.view endEditing:YES];
    
}


-(void)btn{
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //AFN 2.5.4
    /**
     manager.securityPolicy.allowInvalidCertificates = YES;
     **/
    //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *string =text.text;
//
//
//
//    NSString *str = [NSString stringWithFormat:@"%@,",string];
//    NSLog(@"yyyyyyyy%@",str);
  
    params[@"nickName"] =string;
   

    
    [manager POST:@"http://192.168.1.126:9191/coach/updateUser" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        
        if (responseObject[@"status"]) {
            
            //这里吧修改的昵称
            
            [self mbProgressHUDUntil:responseObject[@"msg"]];
            [HUD hideAnimated:YES afterDelay:2];
            
            
        }
       
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
    
    
    
    
    
    
}




-(void)mbProgressHUDUntil:(NSString *)title {
    
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text = title;}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
