//
//  MyintViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/27.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "MyintViewController.h"
#import "MUIViewController.h"
#import "SETViewController.h"
#import "WPhotoViewController.h"
#import "BalanceViewController.h"
#import "NoticeViewController.h"
#import "invitationViewController.h"
#import "TimeViewController.h"
#import "CourseViewController.h"
#import "BuyViewController.h"
#import "buymyViewController.h"
#import "WebViewController.h"
#import "invitationMianViewController.h"
#import "PersonalViewController.h"
#import "SkiViewController.h"
@interface MyintViewController ()
{
    UIView *topvew;
    UITableView *mytabview;
    UIButton* orderbutton;
    UIButton *mybutton;
    UIButton *downleft;
    UIButton *downright;
    UIImageView *imageView;
     NSMutableArray *_photosArr;
}
@property(nonatomic, strong) UILabel*titlab;
@property(nonatomic, strong) UILabel*agelab;
@property(nonatomic,strong)  UILabel*namelab;
@end

@implementation MyintViewController
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:15],
       
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.view.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100];
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    //    self.navigationController.navigationBar.tintColor =
    //    [UIColor colorWithRed:0.99 green:0.50 blue:0.09 alpha:1.00];
    //主要是以下两个图片设置
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationItem.backBarButtonItem = backItem;
    topvew=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.35)];
    topvew.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"20140517014348962"]];
    
    imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(WIDTH*0.40,HEIGHT*0.12,WIDTH*0.2,HEIGHT*0.112);
    imageView.image=[UIImage imageNamed:@"Home_Scroll_03"];
//    imageView.layer.cornerRadius=imageView.frame.size.height/2;//裁成圆角
    if (WIDTH*0.2>HEIGHT*0.112){
         imageView.layer.cornerRadius=imageView.frame.size.height/2;
    }else{
        //这里适配iponex
        
      imageView.frame = CGRectMake(WIDTH*0.39,HEIGHT*0.12,88,88);
         imageView.layer.cornerRadius=44;
        
    }
   
    
    
    imageView.layer.masksToBounds=YES;//隐藏裁剪掉的部分
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addButClick)];
    [imageView addGestureRecognizer:tapGesture];
    imageView.userInteractionEnabled = YES;
    [topvew addSubview:imageView];
    _titlab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.4, HEIGHT*0.045, WIDTH*0.2, HEIGHT*0.112)];
    _titlab.text=@"雪飞扬";
    _titlab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    _titlab.textAlignment= NSTextAlignmentCenter;
    _titlab.textColor=[UIColor whiteColor];
    [topvew addSubview:_titlab];
    _agelab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.4, HEIGHT*0.24, WIDTH*0.2, 17)];
    _agelab.text=@"6年雪龄";
    _agelab.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:9.3];
    _agelab.textAlignment= NSTextAlignmentCenter;
    _agelab.backgroundColor=[UIColor colorWithRed:255/255.f green:214/255.f blue:0/255.f alpha:1];
    _agelab.layer.cornerRadius = 5;
    
    _agelab.clipsToBounds = YES;
    [topvew addSubview:_agelab];
    _namelab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.32, HEIGHT*0.24, WIDTH*0.38, HEIGHT*0.112)];
    _namelab.text=@"称谓 滑雪指导员";
    _namelab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    _namelab.textColor=[UIColor whiteColor];
    _namelab.textAlignment=NSTextAlignmentCenter;
    [topvew addSubview:_namelab];
    
    
    
    
    
    [self.view addSubview:topvew];
    
    downleft=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WIDTH/2, 49)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    downleft.backgroundColor=[UIColor whiteColor];
    [downleft setTitle: @"订单" forState: UIControlStateNormal];
    [downleft setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [downleft setImage:[UIImage imageNamed:@"订单"] forState:UIControlStateNormal];
     downleft.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    CGFloat offset = 4.0f;
    downleft.titleEdgeInsets = UIEdgeInsetsMake(0, -downleft.imageView.frame.size.width, -downleft.imageView.frame.size.height-offset/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    
    downleft.imageEdgeInsets = UIEdgeInsetsMake(-downleft.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -downleft.titleLabel.intrinsicContentSize.width);
    
    [self.view addSubview:downleft];
    
    
    
    
    
    downright=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT-49, WIDTH/2, 49)];
    
    
    downright.backgroundColor=[UIColor whiteColor];
    [downright setTitle: @"我的" forState: UIControlStateNormal];
    [downright setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [downright setImage:[UIImage imageNamed:@"我的"] forState: UIControlStateNormal];
     downright.titleLabel.font=[UIFont systemFontOfSize:14.0f];
    
    downright.titleEdgeInsets = UIEdgeInsetsMake(0, -downright.imageView.frame.size.width, -downright.imageView.frame.size.height-offset/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    downright.imageEdgeInsets = UIEdgeInsetsMake(-downright.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -downright.titleLabel.intrinsicContentSize.width);
    
    [downleft addTarget:self action:@selector(leftbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:downright];

    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, HEIGHT*0.35, WIDTH,  HEIGHT*0.56) style:UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = HEIGHT*0.065;
//    mytabview.scrollEnabled =NO;
    mytabview.separatorInset=UIEdgeInsetsZero;
    
    mytabview.layoutMargins=UIEdgeInsetsZero;
   mytabview.showsVerticalScrollIndicator = NO; 
    //这里设置顶部间距
       CGRect frame=CGRectMake(0, 0, 0, 2);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    mytabview.sectionHeaderHeight=6;
    mytabview.sectionFooterHeight=0;
    mytabview.contentInset=UIEdgeInsetsMake(0+6, 0, 0, 0);
    
    
    // Do any additional setup after loading the view.
}-(void)addButClick
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // 总共有多少个section，默认是1个
    
    return 3;
}- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    if (section == 0) {
        return 4;
    }else if (section == 1)
    {
        return 3;
    }
    else {
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
         cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    if (indexPath.section==0&&indexPath.row==1) {
        cell.textLabel.text = @"个人信息";
    } if (indexPath.section==0&&indexPath.row==2) {
        cell.textLabel.text = @"课程选择";
    } if (indexPath.section==0&&indexPath.row==3) {
        cell.textLabel.text = @"邀请教练";
    }if (indexPath.section==0&&indexPath.row==0) {
        cell.textLabel.text = @"雪场选择";
    }
    if (indexPath.section==1&&indexPath.row==0) {
        cell.textLabel.text = @"预约时间";
    } if (indexPath.section==1&&indexPath.row==1) {
        cell.textLabel.text = @"购买";
    } if (indexPath.section==1&&indexPath.row==2) {
        cell.textLabel.text = @"余额";
    } if (indexPath.section==2&&indexPath.row==0) {
        cell.textLabel.text = @"通知";
    } if (indexPath.section==2&&indexPath.row==1) {
        cell.textLabel.text = @"设置";
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize: 14.0];
    cell.separatorInset=UIEdgeInsetsZero;
    
    cell.layoutMargins=UIEdgeInsetsZero;
    return cell;
}- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==2&&indexPath.row==1) {
        
        SETViewController *vc=[[SETViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section==1&&indexPath.row==2) {
        
       BalanceViewController *vc=[[BalanceViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section==2&&indexPath.row==0) {
        NoticeViewController*vc=[[NoticeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section==0&&indexPath.row==2) {
//        invitationMianViewController *vc=[[invitationMianViewController alloc]init];
//
//        [self.navigationController pushViewController:vc animated:YES];
        CourseViewController *vc=[[CourseViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section==1&&indexPath.row==0) {
        TimeViewController *vc=[[TimeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    if (indexPath.section==0&&indexPath.row==1) {
//        CourseViewController *vc=[[CourseViewController alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
        PersonalViewController *vc=[[PersonalViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section==1&&indexPath.row==1) {
        //cell.textLabel.text = @"购买";
        BuyViewController *vc=[[ BuyViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
//        buymyViewController*vc=[[buymyViewController alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
   //个人信息
    if (indexPath.section==0&&indexPath.row==0) {
//        PersonalViewController *vc=[[PersonalViewController alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
        
        SkiViewController *vc=[[SkiViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        
    }
    if (indexPath.section==0&&indexPath.row==3) {
//        PersonalViewController *vc=[[PersonalViewController alloc]init];
//        [self.navigationController pushViewController:vc animated:YES];
        invitationMianViewController *vc=[[invitationMianViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
     [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(void)leftbuttonClick{
    
    
    
    [self.navigationController popViewControllerAnimated:NO];
    
    
    NSLog(@"++++%@+++++",self.navigationController.viewControllers);
    
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
