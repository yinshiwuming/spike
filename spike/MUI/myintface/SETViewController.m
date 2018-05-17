//
//  SETViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/29.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "SETViewController.h"
#import "MBProgressHUD.h"
#import "LBClearCacheTool.h"
#import "HelpViewController.h"
#import "SVProgressHUD.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
#define filePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
@interface SETViewController (){
     UITableView *mytabview;
    MBProgressHUD *HUD;
    UIButton *exit;
}

@end

@implementation SETViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self.navigationItem setTitle:@"设置"];
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    
    
    self.view.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100];
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,  HEIGHT) style:UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    //mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 44;
    mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
  
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    mytabview.sectionHeaderHeight=8;
    mytabview.sectionFooterHeight=0;
    mytabview.contentInset=UIEdgeInsetsMake(0+4, 0, 0, 0);
    [self.view addSubview:mytabview];
 
    
    
    
    exit=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-40, WIDTH, 40)];
    exit.backgroundColor= [UIColor colorWithRed:255./256. green:214./256. blue:0./256. alpha:1.];
    [exit setTitle:@"退出登录" forState:UIControlStateNormal];
    [exit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:exit];
   
    
    
    // Do any additional setup after loading the view.
}





- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 总共有多少个section，默认是1个
    
    return 2;
}- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    if (section == 0) {
        return 3;
    }else{
        
        return 2;
        
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(*******************不是很懂,不知道是不是为了标识各种不同的cell)
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section==0&&indexPath.row==0) {
        NSString *fileSize = [LBClearCacheTool getCacheSizeWithFilePath:filePath];
        if ([fileSize integerValue] == 0) {
            cell.textLabel.text = @"清除缓存";
        }else {
            cell.textLabel.text = [NSString stringWithFormat:@"清除缓存(%@)",fileSize];
        }
    } if (indexPath.section==0&&indexPath.row==1) {
        cell.textLabel.text = @"帮助与反馈";
    } if (indexPath.section==0&&indexPath.row==2) {
        cell.textLabel.text = @"用户协议";
    } if (indexPath.section==1&&indexPath.row==0) {
        cell.textLabel.text = @"去评分";
    } if (indexPath.section==1&&indexPath.row==1) {
        cell.textLabel.text = @"关于我们";
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font= [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0&&indexPath.section==0) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"确定清除缓存吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        //创建一个取消和一个确定按钮
        UIAlertAction *actionCancle=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        //因为需要点击确定按钮后改变文字的值，所以需要在确定按钮这个block里面进行相应的操作
        UIAlertAction *actionOk=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            //清楚缓存
            BOOL isSuccess = [LBClearCacheTool clearCacheWithFilePath:filePath];
            if (isSuccess) {
                [mytabview reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
                [SVProgressHUD showSuccessWithStatus:@"清除成功"];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                });
            }
            
            
            
        }   ];
        //将取消和确定按钮添加进弹框控制器
        [alert addAction:actionCancle];
        [alert addAction:actionOk];
        //添加一个文本框到弹框控制器
        
        
        //显示弹框控制器
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    if (indexPath.section==0&&indexPath.row==1) {
        
        //跳转帮住反馈
        
        HelpViewController*vc=[[HelpViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}
-(void)mbProgressHUDUntil:(NSString *)title {
    
    
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text = title;}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
