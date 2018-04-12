//
//  BuyViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/8.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "BuyViewController.h"

@interface BuyViewController (){
    
    UIButton*view1;
     UIButton*view2;
     UIButton*view3;
    UIButton*view4;
    UILabel*time1;
    UILabel*time2;
    UILabel*time3;
    UILabel*time4;
    UILabel*pick1;
    UILabel*pick2;
    UILabel*pick3;
    UILabel*pick4;
    UIButton *checkBox;
    UIButton*buybtn;
    
    
    
    
    
    
}

@end
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    view1=[[UIButton alloc]initWithFrame:CGRectMake(41, HEIGHT*0.18, WIDTH*0.3, 62)];
    view2=[[UIButton alloc]initWithFrame:CGRectMake(41+WIDTH*0.17+WIDTH*0.3, HEIGHT*0.18, WIDTH*0.3, 62)];
     view3=[[UIButton alloc]initWithFrame:CGRectMake(41, HEIGHT*0.18+HEIGHT*0.16, WIDTH*0.3, 62)];
     view4=[[UIButton alloc]initWithFrame:CGRectMake(41+WIDTH*0.17+WIDTH*0.3, HEIGHT*0.18+HEIGHT*0.16, WIDTH*0.3, 62)];
    [view1 setBackgroundColor:[UIColor yellowColor]];
    [view2 setBackgroundColor:[UIColor yellowColor]];
    [view3 setBackgroundColor:[UIColor yellowColor]];
    [view4 setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    
    time1=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH*0.3, 14)];
    time1.text=@"30小时";
    pick1=[[UILabel alloc]initWithFrame:CGRectMake(0, 28, WIDTH*0.3, 14)];
    pick1.text=@"75元";
    pick1.textAlignment = UITextAlignmentCenter;
    time1.textAlignment = UITextAlignmentCenter;
    
    time2=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH*0.3, 14)];
    time2.text=@"30小时";
    pick2=[[UILabel alloc]initWithFrame:CGRectMake(0, 28, WIDTH*0.3, 14)];
    pick2.text=@"75元";
    pick2.textAlignment = UITextAlignmentCenter;
    time2.textAlignment = UITextAlignmentCenter;
    time3=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH*0.3, 14)];
    time3.text=@"30小时";
    pick3=[[UILabel alloc]initWithFrame:CGRectMake(0, 28, WIDTH*0.3, 14)];
    pick3.text=@"75元";
    pick3.textAlignment = UITextAlignmentCenter;
    time3.textAlignment = UITextAlignmentCenter;
    time4=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH*0.3, 14)];
    time4.text=@"30小时";
    pick4=[[UILabel alloc]initWithFrame:CGRectMake(0, 28, WIDTH*0.3, 14)];
    pick4.text=@"75元";
    pick4.textAlignment = UITextAlignmentCenter;
    time4.textAlignment = UITextAlignmentCenter;
    
    
    
    [view1 addSubview:time1];
    [view1 addSubview:pick1];
    [view2 addSubview:time2];
    [view2 addSubview:pick2];
    [view3 addSubview:time3];
    [view3 addSubview:pick3];
    [view4 addSubview:time4];
    [view4 addSubview:pick4];
    
    checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
    checkBox.frame=CGRectMake(88, HEIGHT*0.5, 20, 20);
    checkBox.backgroundColor=[UIColor whiteColor];
    [checkBox setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
    [checkBox addTarget:self action:@selector(check:) forControlEvents:UIControlEventTouchUpInside];
    checkBox.layer.cornerRadius=5;
    checkBox.layer.masksToBounds=YES;
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(110, HEIGHT*0.5, 166, 20)];
    label.text=@"点击完成则同意《用户协议》";
    label.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    label.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:label];
    [self.view addSubview:checkBox];
    
    
    buybtn=[UIButton buttonWithType:UIButtonTypeCustom];
    buybtn.frame= CGRectMake(40, HEIGHT*0.61, WIDTH-80, 44);
    [buybtn setTitle:@"立即购买" forState:UIControlStateNormal ];
    [buybtn setBackgroundColor:[UIColor yellowColor]];
     [buybtn addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buybtn];
    // Do any additional setup after loading the view.
}
- (void)check:(UIButton *)btn{
    
    checkBox.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)buy:(UIButton *)btn{
    
    NSLog(@"买界面跳转");
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"MM"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    NSLog(@"+++++%@++++++",dateStr);
    
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
