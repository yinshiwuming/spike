//
//  detailedViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/12.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "detailedViewController.h"
#import "myTableViewCell.h"
@interface detailedViewController (){
    
    
    
    
}

@end

@implementation detailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"订单"];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UITableView *mytab=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 375, 500) style:UITableViewStyleGrouped ];
    
    mytab.dataSource=self;
    mytab.delegate=self;
    [self.view addSubview:mytab];
    CGRect frame=CGRectMake(0, 0, 0, 18);
    mytab.tableHeaderView=[[UIView alloc]initWithFrame:frame];
}- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
    
}







- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (section == 0) {
        
        return 5;
        
    }else{
        
        return 1;
        
    }
    
}- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier  = @"cell";
    static NSString *identifier = @"xibCell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
   
    
    
    if (indexPath.section==0&&indexPath.row==0) {
        
        cell.textLabel.text=@"时间;";
        
        
        
    }
    if (indexPath.section==0&&indexPath.row==1) {
        cell.textLabel.text=@"订单类型";
    }
    
    if (indexPath.section==0&&indexPath.row==2) {
        cell.textLabel.text=@"教学时长";
    }
    if (indexPath.section==0&&indexPath.row==3) {
        cell.textLabel.text=@"订单状态";
    }
    if (indexPath.section==0&&indexPath.row==4) {
        cell.textLabel.text=@"学员联系方式";
    }
    
    myTableViewCell *mycell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    mycell = [[[NSBundle mainBundle] loadNibNamed:@"pingjia" owner:nil options:nil] lastObject];
    if (indexPath.section==0) {
        return cell;
    }else{
        
        return mycell;}
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc]init];
    
    headerView.backgroundColor = [UIColor whiteColor];
    UIView*livi=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 4)];
    livi.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UILabel *label = [[UILabel alloc]init];
    
    label.textColor = [UIColor grayColor];
    
    label.font = [UIFont systemFontOfSize:13];
    
    label.frame = CGRectMake(15, 5, 100, 20);
    
    
    [headerView addSubview:label];
    
    
    
    
    
    
    if (section == 0) {
        
        label.text = @"订单详情";
        
        
    }else{
        
        label.text = @"学员评价";
        
    }
    
    return headerView;
    
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
