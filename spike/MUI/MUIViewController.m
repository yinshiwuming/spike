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
#import "detailedViewController.h"
#import "MUUITableViewCell.h"
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
    UIView *view2;
    UIView *view;
}

@end

@implementation MUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationItem.backBarButtonItem = backItem;
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.45)];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 0);
    [self.view addSubview:demoContainerView];
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  
                                  ];
    _imagesURLStrings = imagesURLStrings;
    
    SDCycleScrollView *cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.3) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    cycleScrollView3.imageURLStringsGroup = imagesURLStrings;
    
    [demoContainerView addSubview:cycleScrollView3];
    
    //
    
    
    
    // Do any additional setup after loading the view.
    
    
    topbtn1=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT*0.32, WIDTH/2, 44)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    topbtn1.backgroundColor=[UIColor whiteColor];
    [topbtn1 setTitle: @"已支付订单" forState: UIControlStateNormal];
//    topbtn1.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    [topbtn1 setTitleColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1]forState:UIControlStateNormal];
    topbtn1.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    view=[[UIView alloc]init];
    view.frame = CGRectMake(WIDTH/7,43,WIDTH/4.7,3);
    view.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:214.0f/255.0f blue:0.0f/255.0f alpha:1];
    [topbtn1 addSubview:view];
    [topbtn1 addTarget:self action:@selector(topbtn1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topbtn1];
  
    
    topbtn2=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2,  HEIGHT*0.32, WIDTH/2, 44)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    topbtn2.backgroundColor=[UIColor whiteColor];
    [topbtn2 setTitle: @"已完成订单" forState: UIControlStateNormal];
    [topbtn2 setTitleColor:[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1]forState:UIControlStateNormal];
//    topbtn2.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    topbtn2.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    view2 = [[UIView alloc] init];
    view2.frame = CGRectMake(WIDTH/7,43,WIDTH/4.7,3);
    view2.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:214.0f/255.0f blue:0.0f/255.0f alpha:1];
    view2.hidden=YES;
    [topbtn2 addSubview:view2];
    [topbtn2 addTarget:self action:@selector(topbtn2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topbtn2];
    
    downleft=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WIDTH/2, 49)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    downleft.backgroundColor=[UIColor whiteColor];
    [downleft setTitle: @"订单" forState: UIControlStateNormal];
    [downleft setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    downleft.titleLabel.font=[UIFont systemFontOfSize:12.0f];
    [downleft setImage:[UIImage imageNamed:@"选中订单"] forState:UIControlStateNormal];
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
     downright.titleLabel.font=[UIFont systemFontOfSize:12.0f];
    [downright setImage:[UIImage imageNamed:@"我的(2)"] forState: UIControlStateNormal];
    
    
    downright.titleEdgeInsets = UIEdgeInsetsMake(0, -downright.imageView.frame.size.width, -downright.imageView.frame.size.height-offset/2, 0);
    // button.imageEdgeInsets = UIEdgeInsetsMake(-button.titleLabel.frame.size.height-offset/2, 0, 0, -button.titleLabel.frame.size.width);
    // 由于iOS8中titleLabel的size为0，用上面这样设置有问题，修改一下即可
    downright.imageEdgeInsets = UIEdgeInsetsMake(-downright.titleLabel.intrinsicContentSize.height-offset/2, 0, 0, -downright.titleLabel.intrinsicContentSize.width);
    
    
    
    
    
    
    
    
    
    
    [downright addTarget:self action:@selector(rightbuttonClick) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:downright];
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, HEIGHT*0.405, WIDTH,  HEIGHT*0.51) style:UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
//    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.backgroundColor=[UIColor groupTableViewBackgroundColor];
//    mytabview.rowHeight = HEIGHT*0.16;
    //mytabview.scrollEnabled =NO;
    mytabview.separatorInset=UIEdgeInsetsZero;
    
    mytabview.layoutMargins=UIEdgeInsetsZero;
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 2);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    mytabview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:mytabview];
    
    
    
    
    
    
    
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier  = @"mucell";
    // 从重用队列中取出cell对象
    MUUITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    
    cell = [[[NSBundle mainBundle] loadNibNamed:@"MUIUEmpty" owner:nil options:nil] lastObject];
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsZero;
    return cell;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
    
}

-(void)rightbuttonClick{
    
    
    //跳转我的
    MyintViewController *vc=[[MyintViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
    
    
    
}
//点击刷新刷新数据源
-(void)topbtn1{
    
    view2.hidden=YES;
       [topbtn1 setTitleColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1]forState:UIControlStateNormal];
     [topbtn2 setTitleColor:[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1]forState:UIControlStateNormal];
    
    view.hidden=NO;
    
    
    
    
    
}
//点击刷新数据源
-(void)topbtn2{
    
    view2.hidden=NO;
     [topbtn2 setTitleColor:[UIColor colorWithRed:51.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1]forState:UIControlStateNormal];
     [topbtn1 setTitleColor:[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1]forState:UIControlStateNormal];
    view.hidden=YES;
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //这里跳转控制器并且把订单id传过去;
    detailedViewController *vc=[[detailedViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //在设置高度的回调中获取当前indexpath的cell 然后返回给他的frame的高度即可。在创建cell的时候记得最后把cell.frame.size.height 等于你内容的高。
    
    UITableViewCell *cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
    
    /*此写法会导致循环引用。引起崩溃
     UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
     */
    
    return cell.frame.size.height;
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
