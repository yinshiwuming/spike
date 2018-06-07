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
    
    
 
    [[self navigationItem] setTitle:@"成为教练"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationItem.backBarButtonItem = backItem;
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    _oneview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT/2-1)];
    UIColor *bgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"20170628_185023"]];
    _oneview.backgroundColor=bgColor;
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.35, WIDTH-40, 44)];
    btn.backgroundColor= [UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    
    [btn setTitle: @"有滑雪证" forState: UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:51.0026/255.0 green:51.0026/255.0 blue:51.0026/255.0 alpha:1] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [_oneview addSubview:btn];
    [self.view addSubview:_oneview];
    
    
    
    _twoview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT/2+1, WIDTH, HEIGHT/2-1)];
     UIColor *bbgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"20170628_201450"]];
    _twoview.backgroundColor=bbgColor;
    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(20, HEIGHT*0.35, WIDTH-40, 44)];
    btn2.backgroundColor=[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
    [btn2 setTitle: @"无滑雪证" forState: UIControlStateNormal];
    [btn2 setTitleColor: [UIColor colorWithRed:101.997/255.0 green:101.997/255.0 blue:101.997/255.0 alpha:1] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(buttonClick2) forControlEvents:UIControlEventTouchUpInside];
    [_twoview addSubview:btn2];
    [self.view addSubview:_twoview];
   
    // Do any additional setup after loading the view.
}-(void)buttonClick{
    
    HavViewController * vc=[[HavViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
//    UIBarButtonItem *barbuttonitm=[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
//    self.navigationItem.backBarButtonItem=barbuttonitm;
    
    
    
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
