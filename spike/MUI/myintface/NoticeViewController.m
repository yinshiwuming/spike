//
//  NoticeViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/31.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "NoticeViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface NoticeViewController (){
    
     UITableView *mytabview;
    
    
    
}

@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    [self.navigationItem setTitle:@"我的通知"];
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, WIDTH-40,  HEIGHT-300) style: UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 140;
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
    imageView.frame = CGRectMake(18,7,124,110);
    
    imageView.image = [UIImage imageNamed:@"Home_Scroll_04"];
    [cell addSubview:imageView];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(164,7,66,13.5);
    label.text = @"预约教练";
    label.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    label.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [cell addSubview:label];
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(162.5,44,38,11);
    label1.text = @"成人票";
    label1.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    label1.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [cell addSubview:label1];
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(164,70,38,9);
    label2.text = @"6-5";
    label2.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    label2.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [cell addSubview:label2];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
