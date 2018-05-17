//
//  WithdrawalViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/5/15.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "WithdrawalViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface WithdrawalViewController (){
    
    UIView *topview;
    UILabel* toplab;
    UILabel *titlelab;
    UILabel *account;
    UILabel *amount;
    UITextField *accountfie;
    UITextField *amountfie;
    UIView *downview;
    UIButton *submit;
    UILabel*leftmin;
    UIButton*rightmin;
    
}

@end

@implementation WithdrawalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.navigationItem setTitle:@"提现"];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    topview=[[UIView alloc]initWithFrame:CGRectMake(0, 72, WIDTH, HEIGHT*0.18)];
    topview.backgroundColor=[UIColor whiteColor];
    toplab=[[UILabel alloc]initWithFrame:CGRectMake(20, HEIGHT*0.05, WIDTH-40, HEIGHT*0.108)];
    toplab.backgroundColor=[UIColor whiteColor];
    titlelab=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH-40, HEIGHT*0.07)];
    
    titlelab.text=@"提现需知:";
        titlelab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    titlelab.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    
    
    
    
    toplab.text=@"提现账户必须为该注册账号主体人所有，若填写他人账号则会提现失败";
   toplab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    toplab.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    toplab.numberOfLines=0;
    account=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT*0.18+80, WIDTH, 44)];
    account.backgroundColor=[UIColor whiteColor];
    account.text=@"   填写你的支付宝账号;";
    account.font = [UIFont systemFontOfSize:14];
    account.textColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
    amount=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT*0.18+126, WIDTH, 44)];

    amount.text=@"    输入提现金额;";
    
    amount.backgroundColor=[UIColor whiteColor];
    amount.font = [UIFont systemFontOfSize:14];
    
    amount.textColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:1];
    downview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.18+171, WIDTH, HEIGHT*0.82-171)];
    downview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:downview];
    submit=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WIDTH, 49)];
    submit.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [submit setTitle:@"提现" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    [self.view addSubview:submit];
    [self.view addSubview:amount];
    [self.view addSubview:account];
    [topview addSubview:titlelab];
    [topview addSubview:toplab];
    [self.view addSubview:topview];
    
    leftmin=[[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 12)];
    leftmin.text=@"余额189,";
    leftmin.font = [UIFont systemFontOfSize:12];
    [downview addSubview:leftmin];
    rightmin=[[UIButton alloc]initWithFrame:CGRectMake(54, 20, 100, 12)];
    [rightmin setTitle:@"全额提现" forState:UIControlStateNormal ];
    [rightmin setTitleColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1] forState: UIControlStateNormal];
    //rightmin.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    rightmin.titleLabel.font=[UIFont systemFontOfSize:13];
    [downview addSubview:rightmin];
    
    // Do any additional setup after loading the view.
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
