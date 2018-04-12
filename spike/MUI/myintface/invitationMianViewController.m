//
//  invitationMianViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/9.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "invitationMianViewController.h"
#import "invitationViewController.h"
#import "WebViewController.h"
@interface invitationMianViewController (){
    
    UIButton*imm;
    UIButton*alread;
    
    
}
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@end

@implementation invitationMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    imm=[[UIButton alloc]initWithFrame:CGRectMake(0.3*WIDTH, HEIGHT*0.42, WIDTH*0.38, 44)];
    [imm setTitle:@"立即邀请" forState:UIControlStateNormal ];
    imm.backgroundColor=[UIColor yellowColor];
    [imm addTarget:self action:@selector(now) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:imm];
    alread=[[UIButton alloc]initWithFrame:CGRectMake(0.3*WIDTH, HEIGHT*0.42+88, WIDTH*0.38, 44)];
    [alread setTitle:@"已经邀请" forState:UIControlStateNormal ];
    alread.backgroundColor=[UIColor lightGrayColor];
    
    
    [alread addTarget:self action:@selector(Method) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:alread];
    
    // Do any additional setup after loading the view.
}
-(void)Method{
    
    invitationViewController *vc=[[invitationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
-(void)now{
    
    WebViewController* vc=[[WebViewController alloc]init];
    
    
     [self.navigationController pushViewController:vc animated:YES];
    
    
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
