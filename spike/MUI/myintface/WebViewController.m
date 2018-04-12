//
//  WebViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/8.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController (){
    
    UIButton*imm;
    UIButton*alread;
    UIActivityIndicatorView * AIV;
    
    
}
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
    webView.detectsPhoneNumbers = YES;//自动检测网页上的电话号码，单击可以拨打
    webView.delegate=self;
    [self.view addSubview:webView];
    NSURL* url = [NSURL URLWithString:@"https://www.baidu.com"];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [webView loadRequest:request];//加载
//    imm=[[UIButton alloc]initWithFrame:CGRectMake(0.3*WIDTH, HEIGHT*0.42, WIDTH*0.38, 44)];
//    [imm setTitle:@"立即邀请" forState:UIControlStateNormal ];
//    imm.backgroundColor=[UIColor yellowColor];
//    [webView addSubview:imm];
//    alread=[[UIButton alloc]initWithFrame:CGRectMake(0.3*WIDTH, HEIGHT*0.42+88, WIDTH*0.38, 44)];
//     [alread setTitle:@"已经邀请" forState:UIControlStateNormal ];
//    alread.backgroundColor=[UIColor lightGrayColor];
//
//
//    [alread addTarget:self action:@selector(Method) forControlEvents:UIControlEventTouchUpInside];
//
//    [webView addSubview:alread];
    
    AIV = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(WIDTH/2-25, 200, 50, 50)];
    
    //设置样式
    AIV.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    /*
     typedef NS_ENUM(NSInteger, UIActivityIndicatorViewStyle) {
     UIActivityIndicatorViewStyleWhiteLarge,
     UIActivityIndicatorViewStyleWhite,
     UIActivityIndicatorViewStyleGray __TVOS_PROHIBITED,
     };
     */
    AIV.color = [UIColor lightGrayColor];
    
    //缩放倍数
    AIV.transform = CGAffineTransformMakeScale(2, 2) ;
    
    [AIV startAnimating];
    //菊花停止旋转
   // [AIV stopAnimating];
    //[[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    [self.view addSubview:AIV];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [AIV stopAnimating];
    
    
    
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
