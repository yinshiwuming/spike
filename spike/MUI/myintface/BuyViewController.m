//
//  BuyViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/8.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "BuyViewController.h"
#import "successViewController.h"
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
    UIView *down1;
    UIView *down2;
    UIView *down3;
    UIView *down4;
    UIView *figure;
    UIButton *cancel;
    UIButton *determine;
    UIImageView*imag1;
     UIImageView*imag2;
     UIImageView*imag3;
    
    UILabel*dowlab1;
    
     UILabel*dowlab2;
     UILabel*dowlab3;
    UIButton*rightbtn1;
    UIButton*rightbtn2;
    UIButton*rightbtn3;
    
    
    
    
    
}

@end
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationItem setTitle:@"购买"];
    view1=[[UIButton alloc]initWithFrame:CGRectMake(41, HEIGHT*0.18, WIDTH*0.3, 62)];
    view2=[[UIButton alloc]initWithFrame:CGRectMake(41+WIDTH*0.17+WIDTH*0.3, HEIGHT*0.18, WIDTH*0.3, 62)];
     view3=[[UIButton alloc]initWithFrame:CGRectMake(41, HEIGHT*0.18+HEIGHT*0.16, WIDTH*0.3, 62)];
     view4=[[UIButton alloc]initWithFrame:CGRectMake(41+WIDTH*0.17+WIDTH*0.3, HEIGHT*0.18+HEIGHT*0.16, WIDTH*0.3, 62)];
   [view1 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
//    [view2 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
//    [view3 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
//    [view4 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
    [view1.layer setMasksToBounds:YES];
    [view1.layer setCornerRadius:5.0];
    [view2.layer setMasksToBounds:YES];
    [view2.layer setCornerRadius:5.0];
    [view3.layer setMasksToBounds:YES];
    [view3.layer setCornerRadius:5.0];
    [view4.layer setMasksToBounds:YES];
    [view4.layer setCornerRadius:5.0];
    [view1.layer setBorderWidth:1.0];
    [view1.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view2.layer setBorderWidth:1.0];
    [view2.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view3.layer setBorderWidth:1.0];
    [view3.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view4.layer setBorderWidth:1.0];
    [view4.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [buybtn.layer setBorderWidth:1.0];
    [buybtn.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor]; [buybtn.layer setBorderWidth:1.0];
    [buybtn.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor]; [buybtn.layer setBorderWidth:1.0];
    [buybtn.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    
    [view1 addTarget:self action:@selector(doSth1) forControlEvents:UIControlEventTouchUpInside];
     [view2 addTarget:self action:@selector(doSth2) forControlEvents:UIControlEventTouchUpInside];
     [view3 addTarget:self action:@selector(doSth3) forControlEvents:UIControlEventTouchUpInside];
     [view4 addTarget:self action:@selector(doSth4) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    
    time1=[[UILabel alloc]initWithFrame:CGRectMake(0, 13, WIDTH*0.3, 14)];
    time1.text=@"30小时";
    
    pick1=[[UILabel alloc]initWithFrame:CGRectMake(0, 36, WIDTH*0.3, 11)];
    pick1.text=@"75元";
    pick1.textAlignment =UITextAlignmentCenter;
    time1.textAlignment =UITextAlignmentCenter;
    time1.font=[UIFont systemFontOfSize:15.0f];
   pick1.font=[UIFont systemFontOfSize:12.0f];
    time2=[[UILabel alloc]initWithFrame:CGRectMake(0, 13, WIDTH*0.3, 14)];
    time2.text=@"60小时";
    pick2=[[UILabel alloc]initWithFrame:CGRectMake(0, 36, WIDTH*0.3, 14)];
    pick2.text=@"300元";
    pick2.textAlignment = UITextAlignmentCenter;
    time2.textAlignment = UITextAlignmentCenter;
    time2.font=[UIFont systemFontOfSize:15.0f];
    pick2.font=[UIFont systemFontOfSize:12.0f];
    time3=[[UILabel alloc]initWithFrame:CGRectMake(0, 13, WIDTH*0.3, 14)];
    time3.text=@"90小时";
    pick3=[[UILabel alloc]initWithFrame:CGRectMake(0, 36, WIDTH*0.3, 14)];
    pick3.text=@"600元";
    pick3.textAlignment = UITextAlignmentCenter;
    time3.textAlignment = UITextAlignmentCenter;
    time3.font=[UIFont systemFontOfSize:15.0f];
    pick3.font=[UIFont systemFontOfSize:12.0f];
    time4=[[UILabel alloc]initWithFrame:CGRectMake(0, 13, WIDTH*0.3, 14)];
    time4.text=@"120小时";
    pick4=[[UILabel alloc]initWithFrame:CGRectMake(0, 36, WIDTH*0.3, 14)];
    pick4.text=@"1200元";
    pick4.textAlignment = UITextAlignmentCenter;
    time4.textAlignment = UITextAlignmentCenter;
    time4.font=[UIFont systemFontOfSize:15.0f];
    pick4.font=[UIFont systemFontOfSize:12.0f];
    [view1 addSubview:time1];
    [view1 addSubview:pick1];
    [view2 addSubview:time2];
    [view2 addSubview:pick2];
    [view3 addSubview:time3];
    [view3 addSubview:pick3];
    [view4 addSubview:time4];
    [view4 addSubview:pick4];
    
//    checkBox=[UIButton buttonWithType:UIButtonTypeCustom];
//    checkBox.frame=CGRectMake(88, HEIGHT*0.5, 20, 20);
//    checkBox.backgroundColor=[UIColor whiteColor];
//    [checkBox setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateNormal];
//    [checkBox setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
//    [checkBox addTarget:self action:@selector(check:) forControlEvents:UIControlEventTouchUpInside];
//    checkBox.layer.cornerRadius=5;
//    checkBox.layer.masksToBounds=YES;
//    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(110, HEIGHT*0.5, 166, 20)];
//    label.text=@"点击完成则同意《用户协议》";
//    label.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:12];
//    label.textAlignment=NSTextAlignmentLeft;
//    [self.view addSubview:label];
//    [self.view addSubview:checkBox];
    buybtn=[UIButton buttonWithType:UIButtonTypeCustom];
    buybtn.frame= CGRectMake(40, HEIGHT*0.61, WIDTH-80, 44);
    [buybtn setTitle:@"立即购买" forState:UIControlStateNormal];
    [buybtn setTintColor:[UIColor blackColor]];
    [buybtn setTitleColor:[UIColor blackColor] forState: UIControlStateNormal ];
    [buybtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
     [buybtn addTarget:self action:@selector(buy:) forControlEvents:UIControlEventTouchUpInside];
    
    [buybtn.layer setMasksToBounds:YES];
    [buybtn.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    //边框宽度
    [buybtn.layer setBorderWidth:1.0];
    //设置边框颜色有两种方法：第一种如下:
    //        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 1 });
    //        [btn.layer setBorderColor:colorref];//边框颜色
    //第二种方法如下:
   
[buybtn.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    
    
    
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
    self.extendedLayoutIncludesOpaqueBars = YES;
    figure=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    figure.backgroundColor=[UIColor colorWithRed:26.6/255.0 green:26.6/255.0 blue:26.6/255.0 alpha:0.5];
    
    UIView *downsuperview=[[UIView alloc]initWithFrame:CGRectMake(10, HEIGHT*0.71, WIDTH-20, HEIGHT*0.26)];
    downsuperview.backgroundColor=[UIColor colorWithRed:224/255.f green:224/255.f blue:224/255.f alpha:0.5];
    
    downsuperview.layer.cornerRadius = 3;
    
    downsuperview.layer.masksToBounds = YES;
    [figure addSubview:downsuperview];
    
    down1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH-20, HEIGHT*0.065)];
    down2=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.065+0.5, WIDTH-20, HEIGHT*0.065)];
    down3=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.13+1, WIDTH-20, HEIGHT*0.065)];
    down4=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.195+1.5, WIDTH-20, HEIGHT*0.065)];
    down1.backgroundColor=[UIColor whiteColor];
     down2.backgroundColor=[UIColor whiteColor];
     down3.backgroundColor=[UIColor whiteColor];
     down4.backgroundColor=[UIColor whiteColor];
    [downsuperview addSubview:down1];
    [downsuperview addSubview:down2];
    [downsuperview addSubview:down3];
    [downsuperview addSubview:down4];
    
    
    
   //[UIColor colorWithRed:26.6/255.0 green:26.6/255.0 blue:26.6/255.0 alpha:0.5]];
    [self.view addSubview:figure];
    
    //确定和取消按钮添加
    cancel=[[UIButton alloc]initWithFrame:CGRectMake(10, 12, 66, 14)];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    cancel.titleLabel.font=[UIFont systemFontOfSize:14];
    
    [cancel setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(cancel)  forControlEvents:UIControlEventTouchUpInside];
    
    
    
    determine=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-85, 12, 66, 14)];
    [determine setTitle:@"确定" forState:UIControlStateNormal];
    determine.titleLabel.font=[UIFont systemFontOfSize:14];
    
     [determine setTitleColor:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1] forState:UIControlStateNormal];
     [determine addTarget:self action:@selector(determine)  forControlEvents:UIControlEventTouchUpInside];
    [down1 addSubview:cancel];
    [down1 addSubview:determine];
    //添加支付状态
    imag1=[[UIImageView alloc]initWithFrame:CGRectMake(12, 11, 16, 16)];
    imag1.image=[UIImage imageNamed:@"余额支付"];
    dowlab1=[[UILabel alloc]initWithFrame:CGRectMake(38, 12, 66, 14)];
    dowlab1.text=@"余额";
    dowlab1.font = [UIFont systemFontOfSize:14];
    dowlab1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    rightbtn1=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-60, 11, 16, 16)];
    [rightbtn1 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
     [rightbtn1 addTarget:self action:@selector(selectpay1)  forControlEvents:UIControlEventTouchUpInside];
    
    [down2 addSubview:dowlab1];
    [down2 addSubview:rightbtn1];
    [down2 addSubview:imag1];
    //微信
    
    
    imag2=[[UIImageView alloc]initWithFrame:CGRectMake(12, 11, 16, 16)];
    imag2.image=[UIImage imageNamed:@"微信支付"];
    dowlab2=[[UILabel alloc]initWithFrame:CGRectMake(38, 12, 66, 14)];
    dowlab2.text=@"微信";
    dowlab2.font = [UIFont systemFontOfSize:14];
    dowlab2.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    rightbtn2=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-60, 11, 16, 16)];
    [rightbtn2 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
     [rightbtn2 addTarget:self action:@selector(selectpay2)  forControlEvents:UIControlEventTouchUpInside];
    [down3 addSubview:dowlab2];
    [down3 addSubview:rightbtn2];
    [down3 addSubview:imag2];
    //支付宝
    
    imag3=[[UIImageView alloc]initWithFrame:CGRectMake(12, 11, 16, 16)];
    imag3.image=[UIImage imageNamed:@"支付宝支付"];
    dowlab3=[[UILabel alloc]initWithFrame:CGRectMake(38, 12, 66, 14)];
    dowlab3.text=@"支付宝";
    dowlab3.font = [UIFont systemFontOfSize:14];
    dowlab3.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    rightbtn3=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-60, 11, 16, 16)];
    [rightbtn3 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
     [rightbtn3 addTarget:self action:@selector(selectpay3)  forControlEvents:UIControlEventTouchUpInside];
    [down4 addSubview:dowlab3];
    [down4 addSubview:rightbtn3];
    [down4 addSubview:imag3];
    
    
    
    
   // successViewController *vc=[[successViewController alloc]init];
  //  [self.navigationController pushViewController:vc animated:YES];

}




-(void)cancel{
    
    [figure removeFromSuperview];
    
    
    
    
}

-(void)selectpay1{
    
   [rightbtn1 setImage:[UIImage imageNamed:@"选中 (3)"] forState:UIControlStateNormal ];
    [rightbtn2 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    [rightbtn3 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    
    
    
}


-(void)selectpay2{
    
    [rightbtn2 setImage:[UIImage imageNamed:@"选中 (3)"] forState:UIControlStateNormal ];
    [rightbtn1 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    [rightbtn3 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    
    
    
}

-(void)selectpay3{
    
    [rightbtn3 setImage:[UIImage imageNamed:@"选中 (3)"] forState:UIControlStateNormal ];
    [rightbtn2 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    [rightbtn1 setImage:[UIImage imageNamed:@"未选中 (2)"] forState:UIControlStateNormal ];
    
    
    
}




-(void)determine{
    
    
//    successViewController *vc=[[successViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
}
-(void)doSth1{
     [view1 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
    [view2.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view3.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view4.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view2 setBackgroundColor:[UIColor whiteColor]];
     [view3 setBackgroundColor:[UIColor whiteColor]];
     [view4 setBackgroundColor:[UIColor whiteColor]];
    
}
-(void)doSth2{
    
    [view2 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
    [view1.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view3.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view4.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
     [view1 setBackgroundColor:[UIColor whiteColor]];
     [view3 setBackgroundColor:[UIColor whiteColor]];
     [view4 setBackgroundColor:[UIColor whiteColor]];
    
}-(void)doSth3{
    
    [view3 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
    [view2.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view1.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view4.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
     [view1 setBackgroundColor:[UIColor whiteColor]];
     [view2 setBackgroundColor:[UIColor whiteColor]];
     [view4 setBackgroundColor:[UIColor whiteColor]];
    
    
}-(void)doSth4{
    
    
    [view4 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
    [view2.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view3.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
    [view1.layer setBorderColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1].CGColor];
     [view1 setBackgroundColor:[UIColor whiteColor]];
     [view2 setBackgroundColor:[UIColor whiteColor]];
     [view3 setBackgroundColor:[UIColor whiteColor]];
    
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
