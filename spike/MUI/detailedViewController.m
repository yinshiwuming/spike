//
//  detailedViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/12.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "detailedViewController.h"
#import "myTableViewCell.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface detailedViewController (){
    
    UIImageView * _arrowMark;
    UIButton * sbt;
    UITableView *mytab;
}

@end

@implementation detailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *passWord = @"1";NSUserDefaults *user = [NSUserDefaults standardUserDefaults];[user setObject:passWord forKey:@"userPassWord"];
         [NSUserDefaults resetStandardUserDefaults];
    [self.navigationItem setTitle:@"订单"];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
  mytab=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, WIDTH, HEIGHT) style:UITableViewStyleGrouped ];
    
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
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [ user objectForKey:@"userPassWord"];
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
   
    if ([passWord isEqualToString:@"1"]) {
        if (indexPath.section==0&&indexPath.row==0) {
            
            cell.textLabel.text=@"时间";
            
            
            
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
    }
    if ([passWord isEqualToString:@"0"]) {
        cell.hidden=YES;
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
    
    sbt=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-30, 0, 20, 12)];
    
    [sbt setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateSelected];
    

    
    [sbt setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal ];
    
     [sbt addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:sbt];
    
   // _arrowMark.transform = CGAffineTransformMakeRotation(M_PI);
    
    
    if (section == 0) {
        
        label.text = @"订单详情";
        
        
    }else{
        sbt.hidden=YES;
        label.text = @"学员评价";
        
    }
    
    return headerView;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   
    
    //在设置高度的回调中获取当前indexpath的cell 然后返回给他的frame的高度即可。在创建cell的时候记得最后把cell.frame.size.height 等于你内容的高。
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [ user objectForKey:@"userPassWord"];
    
    /*此写法会导致循环引用。引起崩溃
     UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
     */
    if ([passWord isEqual:@"0"]&&indexPath.section==0) {
        return 0;
    }
    
    if ([passWord isEqual:@"1"]&&indexPath.section==0) {
        return 44;
    }
    
    return 144;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onClick:(UIButton *)sender
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *passWord = [ user objectForKey:@"userPassWord"];
    if([passWord isEqualToString:@"1"]){
        

        NSLog(@"关闭了");
        NSString *passWord = @"0";NSUserDefaults *user = [NSUserDefaults standardUserDefaults];[user setObject:passWord forKey:@"userPassWord"];

        [NSUserDefaults resetStandardUserDefaults];
        
        
        
        [mytab reloadData];
    }
    else{
        
        
        
        NSLog(@"打开了");
        NSString *passWord = @"1";NSUserDefaults *user = [NSUserDefaults standardUserDefaults];[user setObject:passWord forKey:@"userPassWord"];


        [NSUserDefaults resetStandardUserDefaults];
        
        
        [mytab reloadData];
       }
    
}


@end
