//
//  invitationMianViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/9.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "invitationMianViewController.h"
#import "invitationViewController.h"
#import "WebViewController.h"
#import "AFNetworking.h"
#import "Common.h"
#import "ZYYCodePayViewController.h"

@interface invitationMianViewController (){
    
    UIButton*imm;
    UIButton*alread;
    
    
}
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@end

@implementation invitationMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewData];
    [self peoleonuber];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationItem.backBarButtonItem = backItem;
    self.view.backgroundColor=[UIColor whiteColor];
    //邀请朋友
    self.navigationItem.title = @"邀请教练";
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:14],
       
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    
    imm=[[UIButton alloc]initWithFrame:CGRectMake(0.3*WIDTH, HEIGHT*0.42, WIDTH*0.38, 44)];
    [imm setTitle:@"立即邀请" forState:UIControlStateNormal ];
    [imm setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    imm.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [imm addTarget:self action:@selector(now) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imm];
    alread=[[UIButton alloc]initWithFrame:CGRectMake(0.3*WIDTH, HEIGHT*0.42+88, WIDTH*0.38, 44)];
    [alread setTitle:@"已经邀请66人" forState:UIControlStateNormal ];
    alread.backgroundColor=[UIColor lightGrayColor];
    [alread addTarget:self action:@selector(Method) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:alread];
    
    // Do any additional setup after loading the view.
}
-(void)Method{
    
    
    
    
    
    
    invitationViewController *vc=[[invitationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
-(void)now{
    
//    WebViewController* vc=[[WebViewController alloc]init];
//
//
//     [self.navigationController pushViewController:vc animated:YES];
    ZYYCodePayViewController *payVc = [[ZYYCodePayViewController alloc] init];
    [self.navigationController pushViewController:payVc animated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadNewData{
   
    
    //http://192.168.1.123:9191/coach/userLogin?mobile=15011218654&pwd=123456
    NSString *str =@"http://192.168.1.126:9191/coach/inviteRenItem";
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
         
         
          NSLog(@"%@",responseObject);
          
          
          
          
          NSLog(@"%@",status_range);
          
          
          
          
          
          
          
          
          
          
          
      }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"==========%@",error);
         }];
}


-(void)peoleonuber{
    
    
    //http://192.168.1.123:9191/coach/userLogin?mobile=15011218654&pwd=123456
    NSString *str =@"http://192.168.1.126:9191/coach/inviteRenNumber";
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
          
          NSNumber *peonuber=responseObject[@"data"][@"number"];
          
          NSString *string = [NSString stringWithFormat:@"已经邀请%@人",peonuber];
          NSLog(@"%@",responseObject);
           [alread setTitle:string forState:UIControlStateNormal ];
          
          
          
          NSLog(@"%@",status_range);
          
          
          
          
          
          
          
          
          
          
          
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
