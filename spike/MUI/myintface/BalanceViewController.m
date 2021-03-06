//
//  BalanceViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/30.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "BalanceViewController.h"
#import "YsViewController.h"
#import "WithdrawalViewController.h"
#import "AFNetworking.h"
#import "tupViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface BalanceViewController (){
    
   UIButton * toplab;
    UIButton *topbtn;
    UIButton *onebtn;
    UIButton *twotbtn;
    UIImageView *image;
    UILabel * balance;
    
}

@end

@implementation BalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self loadnewdate];
      self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setTitle:@"我的余额"];
    self.view.backgroundColor=[UIColor whiteColor];
    toplab=[[UIButton alloc]initWithFrame:CGRectMake(23, HEIGHT*0.14, 60, 33)];
     [toplab setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [toplab setTitle:@"当前余额" forState:UIControlStateNormal];
    toplab.titleLabel.font=[UIFont systemFontOfSize:14];
    //toplab.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    toplab.titleLabel.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
    
    
    
    
    [self.view addSubview:toplab];
     topbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-80,HEIGHT*0.14, 60, 33)];
    [topbtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [topbtn setTitle:@"交易明细" forState:(UIControlStateNormal )];
    topbtn.titleLabel.font=[UIFont systemFontOfSize:14];
   // topbtn.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    topbtn.titleLabel.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
    
    
    //[topbtn addTarget:self action:@selector(ys) forControlEvents:UIControlEventTouchUpInside];
//    [topbtn addTarget:self action:@selector(ys) forControlEvents:UIControlEventTouchUpInside];
    [topbtn addTarget:self action:@selector(ys) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topbtn];
    image=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-20, HEIGHT*0.19, 40, 47)];
    image.image=[UIImage imageNamed:@"钱袋"];
    [self.view addSubview:image];
    balance=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT*0.30, WIDTH, 15)];
    balance.textAlignment = NSTextAlignmentCenter;
    balance.text=@"￥189";
    
    
    [self.view addSubview:balance];
    onebtn=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.35, WIDTH-40, 40)];
    [onebtn setTitle:@"提现" forState:(UIControlStateNormal )];
    [onebtn.layer setMasksToBounds:YES];
    [onebtn.layer setCornerRadius:3.0];
    onebtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [onebtn setTitleColor:[UIColor blackColor] forState: UIControlStateNormal ];
      [onebtn addTarget:self action:@selector(actionBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [onebtn setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100]];
    [self.view addSubview:onebtn];
    twotbtn=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.35+55, WIDTH-40, 40)];
    [twotbtn setTitle:@"充值" forState:(UIControlStateNormal )];
    twotbtn.titleLabel.font=[UIFont systemFontOfSize:15];
    [twotbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [twotbtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
      [twotbtn addTarget:self action:@selector(twbtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twotbtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ys{
    
    YsViewController *vc=[[YsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)actionBtn{
    
    WithdrawalViewController *vc=[[WithdrawalViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
}




-(void)twbtn{
    
    
    tupViewController *vc=[[tupViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
    
    
    
}
-(void)loadnewdate{
    
    NSString *str =@"http://192.168.1.126:9191/skimeister/balanceController/queryBalance";
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
          if ( [ status_range intValue]==5 ) {
              
            
              
              
              NSLog(@"%@",responseObject);
              //订单赋值创建数组然后字典转模型还是
              int doc=[responseObject[@"data"] intValue];
              NSLog(@"%@",status_range);
             CGFloat rounded_up = round(doc) / 100;
              NSString *aString = [NSString stringWithFormat:@"%.2lf",rounded_up];
              balance.text=aString;
              
              
              
              
          }
          
          
          
          
          
          
          
          
          
          
          
          
      }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"==========%@",error);
         }];
}

@end
