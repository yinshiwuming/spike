//
//  invitationViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/3.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "invitationViewController.h"
#import "Common.h"
#import "ZYYCodePayViewController.h"
#import "AFNetworking.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface invitationViewController (){
    
     UITableView *mytabview;
     NSArray *arry;
    
    
}

@end

@implementation invitationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewData];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationItem.backBarButtonItem = backItem;
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationItem setTitle:@"邀请教练"];
    
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, WIDTH-40,  HEIGHT-300) style: UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 100;
    mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 2;
}- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(*******************不是很懂,不知道是不是为了标识各种不同的cell)
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(18,7,64,64);
    
    imageView.image = [UIImage imageNamed:@"Home_Scroll_04"];
    imageView.layer.cornerRadius=imageView.frame.size.width/2;//裁成圆角
    imageView.layer.masksToBounds=YES;
    [cell addSubview:imageView];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(164,17,66,13.5);
    label.text = @"雪飞扬";
    label.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    label.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [cell addSubview:label];
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(162.5,64,88,11);
    label1.text = @"已完成小时：13";
    label1.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    label1.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [cell addSubview:label1];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)loadNewData{
    //  NSUserDefaults* user=[NSUserDefaults  standardUserDefaults];
    //    NSString* xieyi=[user objectForKey:@"server_xieyi"];//协议
    //    NSString* tbm_ip=[user objectForKey:@"server_ip"];//ip
    //    NSString* tbm_port=[user objectForKey:@"server_port"];//port
    //    NSString* tbm_token=[user objectForKey:@"tbm_device_token"];//token
    //    NSString* tbm_device=[user objectForKey:@"tbm_device_id"];//token
    
    //    if([xieyi isEqualToString:@"http"]){
    
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
          
          
          if ([responseObject[@"status"] intValue]==5) {
              
              
              if (responseObject[@"data"][@"picImg"]) {
                  NSLog(@"%@",responseObject[@"data"]);
                  
                  //  NSString*imag=responseObject[@"data"][@"picImg"];
                  
              }
              
              //  NSString*imag=responseObject[@"data"][@"picImg"];
              //http://p70kr2ki3.bkt.clouddn.com/15236086687651801.jpg
              //这里缓存教练我的基本信息
          
              // [internetSetting setObject:imag forKey:@"imag"];
              
              //          if (sex!=NULL) {
              //                [internetSetting setObject:sex forKey:@"sex"];
              //          }
              //
              //          [internetSetting setObject:sex forKey:@"sex"];
              
             
              
              
              NSLog(@"+++++++%@_________",responseObject);
              
              NSLog(@"%@",status_range);
              
              
              
              
              
              
              
              
              
              
              
          }}
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
