//
//  CredViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/28.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "CredViewController.h"
#import "HavViewController.h"
#import "NoHavViewController.h"
@interface CredViewController ()
@property(nonatomic,strong)UIView *oneview;
@property(nonatomic,strong)UIView *twoview;
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@end

@implementation CredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor=[UIColor whiteColor];
   [[self navigationItem] setTitle:@"成为教练"];
    _oneview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT/2-1)];
    _oneview.backgroundColor=[UIColor blueColor];
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.35, WIDTH-40, 44)];
    btn.backgroundColor=[UIColor yellowColor];
    
    [btn setTitle: @"有滑雪证" forState: UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [_oneview addSubview:btn];
    [self.view addSubview:_oneview];
    
    
    
    _twoview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/2+1, WIDTH, HEIGHT/2-1)];
    _twoview.backgroundColor=[UIColor yellowColor];
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.35, WIDTH-40, 44)];
    btn2.backgroundColor=[UIColor blueColor];
    [btn2 setTitle: @"无滑雪证" forState: UIControlStateNormal];
    [btn2 addTarget:self action:@selector(buttonClick2) forControlEvents:UIControlEventTouchUpInside];
    [_twoview addSubview:btn2];
    [self.view addSubview:_twoview];
   
    // Do any additional setup after loading the view.
}-(void)buttonClick{
    
    HavViewController * vc=[[HavViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    UIBarButtonItem *barbuttonitm=[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem=barbuttonitm;
    
    
    
}
-(void)buttonClick2{
    
    NoHavViewController * vc=[[NoHavViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
   
    UIBarButtonItem *barbuttonitm=[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem=barbuttonitm;
    
    
    
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
