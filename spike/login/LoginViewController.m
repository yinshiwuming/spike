//
//  LoginViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/22.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "LoginViewController.h"
#import "CredViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface LoginViewController (){
    
    UIView *topview;
    UITableView *mytabview;
    
    
    
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    topview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.3)];
   topview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"20140517014348962"]];
    
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.2, WIDTH-40, 44)];
    btn.backgroundColor=[UIColor yellowColor];
    
    [btn setTitle: @"成为教练开始赚钱" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:btn];
    [self.view addSubview:topview];
    
    
    UILabel *labtext=[[UILabel alloc]initWithFrame:CGRectMake(8, HEIGHT*0.3+8, WIDTH-16, 43)];
    labtext.backgroundColor=[UIColor whiteColor];
    labtext.text=@"   常见问题解答";
    labtext.font = [UIFont fontWithName:@ "SystemFontOfSize"  size:(25)];
    [self.view addSubview:labtext];
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(8, HEIGHT*0.3+52, WIDTH-16,  HEIGHT*0.7-52) style:UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 144;
    //mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    //    if (indexPath.section == 1) {
    //        cell.imageView.image = [UIImage imageNamed:@"image1.png"];
    //    }else{
    //        cell.imageView.image = [UIImage imageNamed:@"image.png"];
    //    }
    //
    //    if (indexPath.row == 1) {
    //        cell.textLabel.text = @"尖峰";
    //    }else{
    //        cell.textLabel.text = @"尖峰";
    //    }
    //
    cell.textLabel.text = @"Q: 点击后进行手机号格式的判断：\n如果正确且距离上次发送验证码时间超过60s，则发送验证码";
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    cell.textLabel.numberOfLines = 0;
    return cell;
}
- (void)viewWillAppear:(BOOL)animated {
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
-(void)buttonClick{
    
    CredViewController * vc=[[CredViewController alloc]init];
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
