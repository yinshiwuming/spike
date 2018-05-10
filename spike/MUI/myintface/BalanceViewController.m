//
//  BalanceViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/30.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "BalanceViewController.h"
#import "YsViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface BalanceViewController (){
    
   UIButton * toplab;
    UIButton *topbtn;
    UIButton *onebtn;
    UIButton *twotbtn;
    UIImageView *image;
    UILabel * balance;
    
}

@end

@implementation BalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我的余额"];
    self.view.backgroundColor=[UIColor whiteColor];
    toplab=[[UIButton alloc]initWithFrame:CGRectMake(23, HEIGHT*0.14, 88, 33)];
     [toplab setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [toplab setTitle:@"当前余额" forState:UIControlStateNormal];
    [self.view addSubview:toplab];
     topbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-90,HEIGHT*0.14, 88, 33)];
    [topbtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [topbtn setTitle:@"交易明细:" forState:(UIControlStateNormal )];
    //[topbtn addTarget:self action:@selector(ys) forControlEvents:UIControlEventTouchUpInside];
//    [topbtn addTarget:self action:@selector(ys) forControlEvents:UIControlEventTouchUpInside];
    [topbtn addTarget:self action:@selector(ys) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topbtn];
    image=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-20, HEIGHT*0.19, 40, 47)];
    image.image=[UIImage imageNamed:@"钱袋"];
    [self.view addSubview:image];
    balance=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-30, HEIGHT*0.30, 70, 15)];
    balance.text=@"￥189";
    
    
    [self.view addSubview:balance];
    onebtn=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.35, WIDTH-40, 34)];
    [onebtn setTitle:@"提现" forState:(UIControlStateNormal )];
    [onebtn setBackgroundColor:[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100]];
    [self.view addSubview:onebtn];
    twotbtn=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.45, WIDTH-40, 34)];
    [twotbtn setTitle:@"充值" forState:(UIControlStateNormal )];
    [twotbtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
    [self.view addSubview:twotbtn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ys{
    
    YsViewController *vc=[[YsViewController alloc]init];
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
