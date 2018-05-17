//
//  YsViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/12.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "YsViewController.h"
#import "ysControllTableViewCell.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface YsViewController (){
    
    UITableView * mytabview;
    
    
}

@end

@implementation YsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"交易明细"];
    self.view.backgroundColor=[UIColor whiteColor];
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,  HEIGHT) style: UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight=85;
    mytabview.separatorInset=UIEdgeInsetsZero;
    
    
    
    mytabview.layoutMargins=UIEdgeInsetsZero;
    
   
    [self.view addSubview:mytabview];
    
    // Do any additional setup after loading the view.
}- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return 3;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    ysControllTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    
    cell = [[[NSBundle mainBundle] loadNibNamed:@"ysv" owner:nil options:nil] lastObject];
//    for (int i=0; i<arry.count; i++) {
//        timelab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
//        timelab2.text= arry[i];
//
    
  
    cell.separatorInset=UIEdgeInsetsZero;
    
    cell.layoutMargins=UIEdgeInsetsZero;
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
