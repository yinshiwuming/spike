//
//  tupViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/6/2.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "tupViewController.h"
#import "AFNetworking.h"
#import "XHPayKit.h"
@interface tupViewController (){
    
    UIView*topview;
     UIView*twoview;
     UIView* downview;
    UILabel*toplab;
    UILabel*twojia;
    UIButton*rightbtn1;
    UIButton*rightbtn2;
    NSString* palytel;
    NSString*appid;
    NSString*noncestr;
    NSString*packages;
    NSString*partnerid;
    NSString*prepayid;
    NSString*sing;
    NSString*timestamp;
    UIButton *btn;
    NSString *buytpy;
    UITextField *text;
    
}

@end

@implementation tupViewController
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
   // [self working];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesturRecognizer];
    topview=[[UIView alloc]initWithFrame:CGRectMake(0, 74, WIDTH , HEIGHT*0.095)];
    topview.backgroundColor=[UIColor whiteColor];
    toplab=[[UILabel alloc]initWithFrame:CGRectMake(25, 8, 273, 44)];
    toplab.text=@"新注册用户自注册起一个月内首次充值超过150元时给予同等面值奖励。";
    toplab.numberOfLines = 0;
    toplab.textColor = [UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
    toplab.font=[UIFont systemFontOfSize:12];
    
    
    [topview addSubview:toplab];
    [self.view addSubview:topview];
    
    twoview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.245, WIDTH , HEIGHT*0.223)];
    twoview.backgroundColor=[UIColor whiteColor];
    UILabel*twotitle=[[UILabel alloc]initWithFrame:CGRectMake(26, 17, 100, 12)];
    twotitle.text=@"请输入充值金额：";
    twotitle.textColor = [UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
    twotitle.font=[UIFont systemFontOfSize:12];
    twojia=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.42, HEIGHT*0.117, 50, 15)];
    UIView *elview=[[UIView alloc]initWithFrame:CGRectMake(WIDTH*0.42, HEIGHT*0.15, 50, 2)];
    elview.backgroundColor= [UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    
    text = [[UITextField alloc]initWithFrame:CGRectMake(WIDTH*0.42, HEIGHT*0.117, 77, 15)];
      // text.borderStyle = UITextBorderStyleRoundedRect;
     text.backgroundColor = [UIColor whiteColor];
    text.placeholder = @"￥金额";
    text.clearButtonMode = UITextFieldViewModeAlways;
    text.keyboardType=UIKeyboardTypePhonePad;
    
     twojia.text=@"￥189";
    [twoview addSubview:text];
    [twoview addSubview:elview];
    [twoview addSubview:twotitle];
    
    
    
    
    
    [self.view addSubview:twoview];
    
    UILabel *play=[[UILabel  alloc]initWithFrame:CGRectMake(26,HEIGHT*0.49, 100, 14)];
    play.text=@"请选择支付方式";
    play.font=[UIFont systemFontOfSize:14];
   play.textColor = [UIColor colorWithRed:101.998/255.0 green:101.998/255.0 blue:101.998/255.0 alpha:1];
    
    downview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.535, WIDTH ,HEIGHT*0.455 )];
    downview.backgroundColor=[UIColor whiteColor];
    //添加支付
    UIImageView*weixinplay=[[UIImageView alloc]initWithFrame:CGRectMake(28, 17, 14, 14)];
    weixinplay.image=[UIImage imageNamed:@"微信支付"];
    UILabel *wplaytit=[[UILabel alloc]initWithFrame:CGRectMake(54, 17, 30, 14)];
    wplaytit.text=@"微信";
    wplaytit.font=[UIFont systemFontOfSize:14];
    wplaytit.textColor=[UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
    [downview addSubview:wplaytit];
    
    
    [downview addSubview:weixinplay];
    rightbtn1=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-31, 17, 16, 16)];
    [rightbtn1 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    [rightbtn1 addTarget:self action:@selector(selectpay1)  forControlEvents:UIControlEventTouchUpInside];
    [downview addSubview:rightbtn1];
    
    
    
    
    UIView *jiview=[[UIView alloc]initWithFrame:CGRectMake(0, 44, WIDTH, 1)];
    jiview.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    [downview addSubview:jiview];
    UIImageView*ailiplay=[[UIImageView alloc]initWithFrame:CGRectMake(28, 62, 14, 14)];
    ailiplay.image=[UIImage imageNamed:@"支付宝支付"];
    [downview addSubview:ailiplay];
    UILabel *alpiytit=[[UILabel alloc]initWithFrame:CGRectMake(54, 62, 44, 14)];
    alpiytit.text=@"支付宝";
    alpiytit.font=[UIFont systemFontOfSize:14];
    alpiytit.textColor=[UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1];
    [downview addSubview:alpiytit];
    
    
    
    UIView *geview=[[UIView alloc]initWithFrame:CGRectMake(0, 88, WIDTH, 1)];
    geview.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    rightbtn2=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-31, 62, 16, 16)];
    [rightbtn2 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    [rightbtn2 addTarget:self action:@selector(selectpay2)  forControlEvents:UIControlEventTouchUpInside];
    [downview addSubview:rightbtn2];
    [downview addSubview:geview];
    
    
    
    
    
    
    
    
    [self.view addSubview:play];
    [self.view addSubview:downview];
    
    
    
    btn=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-44, WIDTH, 44)];
   [ btn setBackgroundColor:[UIColor colorWithRed:237.7/255.0 green:237.7/255.0 blue:237.7/255.0 alpha:1]];
    [btn setTitle:@"下一步" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buybuy)  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)working{
    
    NSLog(@"电器选国美");
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //AFN 2.5.4
    /**
     manager.securityPolicy.allowInvalidCertificates = YES;
     **/
    //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"payProvider"] =@"ALIPAY";
    params[@"amount"] =@"12";
    [manager POST:@"http://192.168.1.126:9191/skimeister/order/recharge" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        
        NSLog(@"%@",responseObject[@"msg"]);
        
        
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
    
    
}


-(void)selectpay1{
    
    [rightbtn1 setImage:[UIImage imageNamed:@"选中 (3)"] forState:UIControlStateNormal ];
    [rightbtn2 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    btn.backgroundColor= [UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
   // [self wxpilay];
    buytpy=@"WEIXIN";
    
}


-(void)selectpay2{
    
    [rightbtn2 setImage:[UIImage imageNamed:@"选中 (3)"] forState:UIControlStateNormal ];
    [rightbtn1 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
  btn.backgroundColor= [UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    buytpy=@"ALIPAY";
    //[self btnpush];
   // [self alplay];
   
    
}


-(void)buybuy{
    
    if ([buytpy isEqualToString:@"ALIPAY"]) {
        
        [self alplay];
    
        [self working];
        
    }
    if ([buytpy isEqualToString:@"WEIXIN"]) {
        [self wxpilay];
        [self working];
    }
    
    
}

-(void)wxpilay{
    [self mywinxinge];
    
    
    
    
    
}


-(void)alplay{
    
    
    
    
    if(![XHPayKit isAliAppInstalled]){
        NSLog(@"未安装支付宝");
        return;
    }
    
    
    
    
    
    
    
    
    
    //支付宝订单签名,此签名由后台签名订单后生成,并返回给客户端(与官方SDK一致)
    //注意:请将下面值设置为你自己真实订单签名,便可进行实际支付
    NSString *orderSign = @"alipay_sdk=alipay-sdk-java-dynamicVersionNo&app_id=2018042460075107&biz_content=%7B%22out_trade_no%22%3A%222YkV26582a45216844452166p3873145%22%2C%22passback_params%22%3A%22Your+Body%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22subject%22%3A%22Your+Subject%22%2C%22timeout_express%22%3A%2230m%22%2C%22total_amount%22%3A%220.01%22%7D&charset=utf-8&format=json&method=alipay.trade.app.pay&notify_url=http%3A%2F%2Fsqhkg.com%2FappPay&sign=E%2BNSPbK9gUIQEjy3160pC7erXU7K0jaxQtnNF0dhEXHfG3BDxG8pkmUczRcv30JSQ%2BrlEYXCZYdKuz%2B8watqWPRLgir5OA2i%2BT9L2yBI8h%2FHBRlElS%2BcCCGKSoKMabjRoGGXGreBdAlOv6epQ%2B5XPrdg2w%2BTRohwh5mPWySip0bLY%2FpKqpRN2i45TmzQGszlY%2B%2F2W3xU3bLxaOcsbrFP5eOpA%2BWBZh2uB%2Fp%2BMbLGYBRR0am508lpSHlu%2F1vKsWU7aOfEXJhJrVk%2BHOb%2BRC8vmXOHfwsl3XkRH290e3Jvo9m%2BUWBhVM6TyZNK8HxGUSdpnA%2Ba4lQanngtII5N1dOgDw%3D%3D&sign_type=RSA2&timestamp=2018-05-25+17%3A10%3A43&version=1.0";
    
    //传入支付宝订单签名 和 自己App URL Scheme,拉起支付宝支付
    [[XHPayKit defaultManager] alipayOrder:orderSign fromScheme:@"XHPayKitExample" completed:^(NSDictionary *resultDict) {
        NSLog(@"支付结果:\n%@",resultDict);
        NSInteger status = [resultDict[@"resultStatus"] integerValue];
        if(status == 9000){//支付成功
            
        }
    }];
    
    
    
}



-(void)mywinxinge{
    
    NSString *str =@"http://192.168.1.126:9191/wePay";
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
          
          appid=responseObject[@"data"][@"appid"];
          noncestr=responseObject[@"data"][@"noncestr"];
          packages=responseObject[@"data"][@"packages"];
          partnerid=responseObject[@"data"][@"partnerid"];
          prepayid=responseObject[@"data"][@"prepayid"];
          sing=responseObject[@"data"][@"sing"];
          timestamp=responseObject[@"data"][@"timestamp"];
          
          if(![XHPayKit isWxAppInstalled]){
              NSLog(@"未安装微信");
              return;
          }
          
          //微信支付参数,下面7个参数,由后台签名订单后生成,并返回给客服端(与官方SDK一致)
          //注意:请将下面参数设置为你自己真实订单签名后服务器返回参数,便可进行实际支付
          //以下参数详细介绍见
          //微信官方文档:https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=9_12&index=2
          
          XHPayWxReq *req = [[XHPayWxReq alloc] init];
          req.openID = responseObject[@"data"][@"appid"];//微信开放平台审核通过的应用APPID
          req.partnerId =responseObject[@"data"][@"partnerid"];//商户号
          req.prepayId = responseObject[@"data"][@"prepayid"];//交易会话ID
          req.nonceStr = responseObject[@"data"][@"noncestr"];//随机串，防重发
          req.timeStamp = [responseObject[@"data"][@"timestamp"] intValue];//时间戳，防重发
          req.package = responseObject[@"data"][@"package"];// 扩展字段,暂填写固定值Sign=WXPay
          req.sign = responseObject[@"data"][@"sing"];//签名
          
          //传入订单模型,拉起微信支付
          [[XHPayKit defaultManager] wxpayOrder:req completed:^(NSDictionary *resultDict) {
              NSLog(@"支付结果:\n%@",resultDict);
              NSInteger code = [resultDict[@"errCode"] integerValue];
              if(code == 0){//支付成功
                  
              }
          }];
          
          
          
          
          
      }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"==========%@",error);
         }];
    
    
    
    
    
    
    
}


-(void)tapAction:(id)tap

{
    
    [self.view endEditing:YES];
    
}



@end
