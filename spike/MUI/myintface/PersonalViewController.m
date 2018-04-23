//
//  PersonalViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "PersonalViewController.h"
#import "nicknameViewController.h"
#import "WPhotoViewController.h"
@interface PersonalViewController (){
    
    UITableView*mytabview;
    UIImageView *imageView;
    NSMutableArray *_photosArr;
    
}

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationItem setTitle:@"个人信息"];
    
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, WIDTH-40,  266) style: UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 44;
    mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    
    
    
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier  = @"cell";
    static NSString * mycellIdentifier  = @"mycell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UITableViewCell * mycell = [tableView dequeueReusableCellWithIdentifier:mycellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    
    cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
   
   mycell=[[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:mycellIdentifier];
    
    
    //    timelab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
    //
    //    timelab2.text= @"小班5次课250";
    
    
    if (indexPath.row==0) {
        cell.textLabel.text=@"头像";
        //这里添加cell的头像
        imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(WIDTH-118,3,38,38);
        imageView.image=[UIImage imageNamed:@"Home_Scroll_03"];
        imageView.layer.cornerRadius=imageView.frame.size.width/2;//裁成圆角
        imageView.layer.masksToBounds=YES;//隐藏裁剪掉的部分
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addButClick)];
        [imageView addGestureRecognizer:tapGesture];
        imageView.userInteractionEnabled = YES;
        [cell addSubview:imageView];
        
        
        
    }
    if (indexPath.row==1) {
        cell.textLabel.text=@"昵称";
    }
    
    if (indexPath.row==2) {
        cell.textLabel.text=@"性别";
    }
    
    if (indexPath.row==3) {
        cell.textLabel.text=@"称谓";
    }
    
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        
        
    }
    if (indexPath.row==1) {
        nicknameViewController*vc=[[nicknameViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row==2) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                       message:@"性别"
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 NSLog(@"action = %@", action);
                                                                 
                                                             }];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDestructive
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 NSLog(@"action = %@", action);
                                                                 
                                                             }];
        UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action) {
                                                               //响应事件
                                                               NSLog(@"action = %@", action);
                                                           }];
        [alert addAction:saveAction];
        [alert addAction:cancelAction];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if (indexPath.row==3) {
       
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addButClick
{
    WPhotoViewController *WphotoVC = [[WPhotoViewController alloc] init];
    //选择图片的最大数
    WphotoVC.selectPhotoOfMax = 1;
    [WphotoVC setSelectPhotosBack:^(NSMutableArray *phostsArr) {
        
        
        _photosArr = phostsArr;
        NSLog(@"++++++%@++++",[[_photosArr objectAtIndex:0] objectForKey:@"image"]);
        
        imageView.image=[[_photosArr objectAtIndex:0] objectForKey:@"image"];
        
    }];
    [self presentViewController:WphotoVC animated:YES completion:nil];
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
