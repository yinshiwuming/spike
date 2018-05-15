//
//  successViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/12.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "successViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface successViewController (){
    
    
    UIImageView *img;
    UILabel*tslab;
    UILabel* piclab;
    UIButton *farbtn;
    UIButton *gobtn;

}

@end

@implementation successViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    img=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*0.46, 120, 37, 37)];
    img.image=[UIImage imageNamed:@"支付成功"];
    [self.view addSubview:img];
    farbtn=[[UIButton alloc]initWithFrame:CGRectMake(20, 274, WIDTH*0.89, 44)];
    farbtn.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [farbtn setTitle:@"去分享" forState:UIControlStateNormal ];
    [farbtn setTitleColor:[UIColor blackColor] forState: UIControlStateNormal ];
    tslab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.42, 176, 88, 15)];
    tslab.text=@"支付成功";
    
    
    gobtn=[[UIButton alloc]initWithFrame:CGRectMake(20, 350, WIDTH*0.89, 44)];
    //返回首页
    gobtn.backgroundColor=[UIColor colorWithRed:194/255.0 green:193/255.0 blue:193/255.0 alpha:1];
    [gobtn setTitle:@"返回首页" forState:UIControlStateNormal];
    [gobtn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState: UIControlStateNormal ];
    
    [self.view addSubview:farbtn];
    [self.view addSubview:gobtn];
    [self.view addSubview:tslab];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
