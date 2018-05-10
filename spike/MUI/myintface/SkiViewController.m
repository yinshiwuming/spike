//
//  SkiViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/27.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "SkiViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface SkiViewController (){
    
    UITableView* mytabview;
    
    UIButton*buybtn;
    NSMutableArray*ary;
    
}
@property (assign, nonatomic) NSIndexPath *selIndex;
@end

@implementation SkiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"雪场选择";
    self.view.backgroundColor=[UIColor whiteColor];
    
    ary=[NSMutableArray arrayWithObjects:@"奥森雪场",@"张北雪场", nil];
    
    
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH,  HEIGHT*0.5) style:UITableViewStylePlain];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = HEIGHT*0.05;
    
    
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    mytabview.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    buybtn=[UIButton buttonWithType:UIButtonTypeCustom];
    buybtn.frame= CGRectMake(40, HEIGHT*0.61, WIDTH-80, 44);
    [buybtn setTitle:@"确定" forState:UIControlStateNormal ];
     [buybtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buybtn setBackgroundColor:[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]];
    
    [self.view addSubview:buybtn];
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return ary.count;
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
    
    
    
    
    
    cell.textLabel.text=ary[indexPath.row];
    
    
    
    
 
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //之前选中的，取消选择
    
   
        NSLog(@"++++++++++%@",_selIndex);
    
    UITableViewCell *celled = [tableView cellForRowAtIndexPath:_selIndex];
    celled.accessoryType = UITableViewCellAccessoryNone;
    //记录当前选中的位置索引
    _selIndex = indexPath;
    //当前选择的打勾
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSLog(@"++++++++++%@",_selIndex);
    
    
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
