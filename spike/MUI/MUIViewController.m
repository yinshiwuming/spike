//
//  MUIViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/22.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "MUIViewController.h"
#import "SDCycleScrollView.h"
#import "MyintViewController.h"
#import "UIImageView+WebCache.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface MUIViewController ()<SDCycleScrollViewDelegate>{
    
    
    NSArray *_imagesURLStrings;
    SDCycleScrollView *_customCellScrollViewDemo;
    UIButton *topbtn1;
    UIButton *topbtn2;
    UIButton *downleft;
    UIButton *downright;
    UITableView *mytabview;
}

@end

@implementation MUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor colorWithRed:230.0/255.0 green:245.0/255.0 blue:253.0/255.0 alpha:100];
    
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 300)];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 0);
    [self.view addSubview:demoContainerView];
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    SDCycleScrollView *cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, 200) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    cycleScrollView3.imageURLStringsGroup = imagesURLStrings;
    
    [demoContainerView addSubview:cycleScrollView3];
    
    //
    
    
    
    // Do any additional setup after loading the view.
    
    
    topbtn1=[[UIButton alloc]initWithFrame:CGRectMake(0, 219, WIDTH/2, 44)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    topbtn1.backgroundColor=[UIColor whiteColor];
    [topbtn1 setTitle: @"已完成订单" forState: UIControlStateNormal];
    [topbtn1 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(WIDTH/6,43,WIDTH/6,2);
    view.backgroundColor = [UIColor yellowColor];
    [topbtn1 addSubview:view];
   // [topbtn1 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topbtn1];
  
    
    topbtn2=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, 219, WIDTH/2, 44)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    topbtn2.backgroundColor=[UIColor whiteColor];
    [topbtn2 setTitle: @"已支付订单" forState: UIControlStateNormal];
    [topbtn2 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    // [topbtn1 addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topbtn2];
    
    downleft=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WIDTH/2, 49)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    downleft.backgroundColor=[UIColor whiteColor];
    [downleft setTitle: @"订单" forState: UIControlStateNormal];
    [downleft setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [downleft setImage:[UIImage imageNamed:@"选中订单"] forState:UIControlStateNormal];
     CGFloat offset = 20.0f;
    downleft.titleEdgeInsets = UIEdgeInsetsMake(0, -downleft.imageView.frame.size.width, -downleft.imageView.frame.size.height-offset/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    
    downleft.imageEdgeInsets = UIEdgeInsetsMake(-downleft.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -downleft.titleLabel.intrinsicContentSize.width);
    
    [self.view addSubview:downleft];
    
    
    
    
    
    downright=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT-49, WIDTH/2, 49)];
    
    
    downright.backgroundColor=[UIColor whiteColor];
    [downright setTitle: @"我的" forState: UIControlStateNormal];
    [downright setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [downright setImage:[UIImage imageNamed:@"我的(2)"] forState: UIControlStateNormal];
    
    
    downright.titleEdgeInsets = UIEdgeInsetsMake(0, -downright.imageView.frame.size.width, -downright.imageView.frame.size.height-offset/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    downright.imageEdgeInsets = UIEdgeInsetsMake(-downright.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -downright.titleLabel.intrinsicContentSize.width);
    
    
    
    
    
    
    
    
    
    
    [downright addTarget:self action:@selector(rightbuttonClick) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:downright];
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(8, HEIGHT*0.41, WIDTH-16,  HEIGHT*0.48) style:UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 124;
    //mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    
    
    
    
    
    
    
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    //    if (indexPath.section == 1) {
    //        cell.imageView.image = [UIImage imageNamed:@"image1.png"];
    //    }else{
    //        cell.imageView.image = [UIImage imageNamed:@"image.png"];
    //    }
    //
    //    if (indexPath.row == 1) {
    //        cell.textLabel.text = @"尖峰";
    //    }else{
    //        cell.textLabel.text = @"尖峰";
    //    }
    //
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(18,7,124,110);
    
    imageView.image = [UIImage imageNamed:@"Home_Scroll_04"];
    [cell addSubview:imageView];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(164,7,66,13.5);
    label.text = @"预约教练";
    label.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    label.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [cell addSubview:label];
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(162.5,44,38,11);
    label1.text = @"成人票";
    label1.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    label1.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [cell addSubview:label1];
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(164,70,38,9);
    label2.text = @"6-5";
    label2.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    label2.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [cell addSubview:label2];
        return cell;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    
}

-(void)rightbuttonClick{
    
    
    //跳转我的
    MyintViewController *vc=[[MyintViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}
- (void)viewWillAppear:(BOOL)animated {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
