//
//  HelpViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/12.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "HelpViewController.h"
#import "feedbackTableViewCell.h"
#import "opinionViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface HelpViewController (){
    
    UILabel*labv;
    UITableView*mytabview;
    UIButton*btn;
    NSMutableArray*dataarry;
    
    
}

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    labv=[[UILabel alloc]initWithFrame:CGRectMake(0, 88,WIDTH, 46)];
    labv.text=@"    常见问题";
        labv.backgroundColor=[UIColor whiteColor];
    labv.font=[UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    
    [self.view addSubview:labv];
    
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 138, WIDTH,  HEIGHT) style: UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    CGRect frame=CGRectMake(0, 0, 0, 10);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    mytabview.sectionFooterHeight = 1.0;
    [self.view addSubview:mytabview];
    mytabview.tableFooterView=[[UIView alloc]initWithFrame:frame];
    
    btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 618, 375, 49)];
    btn.backgroundColor=[UIColor yellowColor];
    [btn setTitle:@"意见反馈" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(opin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//     return 0.01f;//section头部高度
//}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 总共有多少个section，默认是1个
    
    return 2;
}- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    if (section == 0) {
        return 3;
    }else{
        
        return 2;
        
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(*******************不是很懂,不知道是不是为了标识各种不同的cell)
    static NSString * cellIdentifier = @"cell";
    // 从重用队列中取出cell对象
    feedbackTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
         cell = [[[NSBundle mainBundle] loadNibNamed:@"secion" owner:nil options:nil] lastObject];
    }
    
    
   cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)opin{
    
    
    //关于意见反馈界面
    opinionViewController*vc=[[opinionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
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
