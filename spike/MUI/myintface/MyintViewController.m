//
//  MyintViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/27.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "MyintViewController.h"
#import "MUIViewController.h"
@interface MyintViewController ()
{
    UIView *topvew;
    UITableView *mytabview;
    UIButton* orderbutton;
    UIButton *mybutton;
    UIButton *downleft;
    UIButton *downright;
}

@end

@implementation MyintViewController
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100];
    topvew=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 235)];
    topvew.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"20140517014348962"]];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(162.5,74.5,60.2,60.5);
    imageView.image = [UIImage imageNamed:@"热巴.png"];
    [self.view addSubview:topvew];
    
    downleft=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WIDTH/2, 49)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    downleft.backgroundColor=[UIColor whiteColor];
    [downleft setTitle: @"订单" forState: UIControlStateNormal];
    [downleft setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [downleft setImage:[UIImage imageNamed:@"订单"] forState:UIControlStateNormal];
    CGFloat offset = 20.0f;
    downleft.titleEdgeInsets = UIEdgeInsetsMake(0, -downleft.imageView.frame.size.width, -downleft.imageView.frame.size.height-offset/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    
    downleft.imageEdgeInsets = UIEdgeInsetsMake(-downleft.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -downleft.titleLabel.intrinsicContentSize.width);
    
    [self.view addSubview:downleft];
    
    
    
    
    
    downright=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT-49, WIDTH/2, 49)];
    
    
    downright.backgroundColor=[UIColor whiteColor];
    [downright setTitle: @"我的" forState: UIControlStateNormal];
    [downright setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [downright setImage:[UIImage imageNamed:@"我的"] forState: UIControlStateNormal];
    
    
    downright.titleEdgeInsets = UIEdgeInsetsMake(0, -downright.imageView.frame.size.width, -downright.imageView.frame.size.height-offset/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    downright.imageEdgeInsets = UIEdgeInsetsMake(-downright.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -downright.titleLabel.intrinsicContentSize.width);
    
    
    
    
    
    
    
    
    
    
    [downleft addTarget:self action:@selector(leftbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downright];
    
    
    
    
    
    
    
    
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 232, WIDTH,  HEIGHT-300) style:UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 33;
    mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
       CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
   
    
    
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 总共有多少个section，默认是1个
    
    return 3;
}- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    if (section == 0) {
        return 3;
    }else if (section == 1)
    {
        return 3;
    }
    else {
        return 1;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(*******************不是很懂,不知道是不是为了标识各种不同的cell)
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section==0&&indexPath.row==0) {
        cell.textLabel.text = @"个人信息";
    } if (indexPath.section==0&&indexPath.row==1) {
        cell.textLabel.text = @"课程选择";
    } if (indexPath.section==0&&indexPath.row==2) {
        cell.textLabel.text = @"邀请教练";
    } if (indexPath.section==1&&indexPath.row==0) {
        cell.textLabel.text = @"预约时间";
    } if (indexPath.section==1&&indexPath.row==1) {
        cell.textLabel.text = @"购买";
    } if (indexPath.section==1&&indexPath.row==2) {
        cell.textLabel.text = @"余额";
    } if (indexPath.section==2&&indexPath.row==0) {
        cell.textLabel.text = @"通知";
    } if (indexPath.section==2&&indexPath.row==1) {
        cell.textLabel.text = @"设置";
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)leftbuttonClick{
    
    
    MUIViewController *vc=[[MUIViewController alloc]init];
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

@end
