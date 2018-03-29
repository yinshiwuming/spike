//
//  NoHavViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/28.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "NoHavViewController.h"
#import "HavTableViewCell.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface NoHavViewController (){
    
    
    
    UITableView *mytabview;
    UITextField *name;
    UITextField *number;
   
}

@end

@implementation NoHavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [[self navigationItem] setTitle:@"成为教练"];
    
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(8, 0, WIDTH,  260) style:UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 34;
    mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    HavTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[HavTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row==0) {
        cell.leftLabel.text=@"个人信息";
        cell.leftLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
        UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.75-7, 15, 80, 14)];
        right.text=@"信息仅用于审核";
        right.font=[UIFont fontWithName:@"Helvetica" size:11];
        [cell addSubview:right];
    }
    if (indexPath.row==3) {
        cell.leftLabel.text=@"身份证照片";
        UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(60, 0, WIDTH-120, 34)];
        right.text=@"请上传";
        right.textColor=[UIColor lightGrayColor];
        right.textAlignment=NSTextAlignmentRight  ;
        right.font=[UIFont fontWithName:@"Helvetica" size:12];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        [cell addSubview:right];
    }
    if (indexPath.row==1) {
        cell.leftLabel.text=@"教练姓名";
       
        name=[self createTextFielfFrame:CGRectMake(100, 0, WIDTH-160, 34) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        name.delegate=self;
        name.clearButtonMode = UITextFieldViewModeWhileEditing;
        name.backgroundColor=[UIColor whiteColor];
        name.borderStyle=UITextBorderStyleRoundedRect;
        name.textAlignment=NSTextAlignmentCenter ;
        name.enabled=YES;
        
        [name setBorderStyle:UITextBorderStyleNone];
        name.textAlignment = UITextAlignmentRight;
        name.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:name];
        
    }
    if (indexPath.row==2) {
        cell.leftLabel.text=@"身份证号";
        number=[self createTextFielfFrame:CGRectMake(100, 0, WIDTH-160, 34) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        number.delegate=self;
        number.clearButtonMode = UITextFieldViewModeWhileEditing;
        number.backgroundColor=[UIColor whiteColor];
        number.borderStyle=UITextBorderStyleRoundedRect;
        number.textAlignment=NSTextAlignmentCenter ;
        number.enabled=YES;
        
        [number setBorderStyle:UITextBorderStyleNone];
        number.textAlignment =  NSTextAlignmentRight;
        number.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:number];
    }
    
    return cell;
}
-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor grayColor];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
    
    return textField;
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
