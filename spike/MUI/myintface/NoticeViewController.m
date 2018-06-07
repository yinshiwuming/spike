//
//  NoticeViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/31.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "NoticeViewController.h"
#import "noticTableViewCell.h"
#import "AFNetworking.h"
#import "systemcell.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface NoticeViewController (){
    
     UITableView *mytabview;
    
    
    
}

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewData];
    self.view.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [self.navigationItem setTitle:@"我的通知"];
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(14, 0, WIDTH-28,  HEIGHT) style: UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
   mytabview.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    //mytabview.rowHeight=227;
    
    
//   mytabview.rowHeight=160;
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    mytabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mytabview];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 2;
}- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(*******************不是很懂,不知道是不是为了标识各种不同的cell)
    static NSString * cellIdentifier  = @"cell";
    static NSString * sys  = @"sys";
    // 从重用队列中取出cell对象
    noticTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    systemcell*mycell=[tableView dequeueReusableCellWithIdentifier:sys];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
   if (!cell) {
      cell =  [[[NSBundle mainBundle] loadNibNamed:@"Notice" owner:nil options:nil] lastObject];
    }
  [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    mycell=[[[NSBundle mainBundle] loadNibNamed:@"system" owner:nil options:nil] lastObject];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSString *str =@"http://192.168.1.126:9191/coach/myInform";
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //在设置高度的回调中获取当前indexpath的cell 然后返回给他的frame的高度即可。在创建cell的时候记得最后把cell.frame.size.height 等于你内容的高。
    
    UITableViewCell *cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    /*此写法会导致循环引用。引起崩溃
     UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
     */
    
    return cell.frame.size.height;
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
