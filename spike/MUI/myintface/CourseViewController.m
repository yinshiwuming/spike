//
//  CourseViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/4.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "CourseViewController.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface CourseViewController (){
    
    
    UIView *topview;
    UIView *twoview;
    UILabel* toplab;
    UILabel*leftlab;
    UITextField*rigtex;
   UIButton *topbtn1;
    UIButton *topbtn2;
    UIView*view1;
    UIView*view2;
    UIView*view3;
    UILabel*timelab;
    UILabel*timelab2;
    UILabel*timelab3;
    
    UIButton* restbtn;
    UIButton*confirm;
    UITableView *mytabview;
    NSMutableArray*arry;
    
    
}
@property (nonatomic,strong)UIPickerView * pickerView;//自定义pickerview
@property (nonatomic,strong)NSArray * letter;//保存要展示的字母
@property (strong, nonatomic) NSMutableArray *selectIndexs;//选中行的数组

@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"课程选择";
    self.view.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100];
    topview=[[UIView alloc]initWithFrame:CGRectMake(0, 84, WIDTH, 180)];
    topview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:topview];
    toplab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH, 80)];
    toplab.text=@"请选择可接受时间\n预约教练选择须知:......";
    toplab.backgroundColor=[UIColor whiteColor];
    [toplab setNumberOfLines:0];
    [topview addSubview:toplab];
    UIView*viow=[[UIView alloc]initWithFrame:CGRectMake(0, 110, WIDTH, 2)];
    viow.backgroundColor=[UIColor lightGrayColor];
    [topview addSubview:viow];
    leftlab=[[UILabel alloc]initWithFrame:CGRectMake(10, 130, WIDTH/4, 12)];
    leftlab.font=[UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    leftlab.text=@"雪场选择";
    [topview addSubview:leftlab];
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 200)];
    
    
    //指定数据源和委托
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    rigtex=[[UITextField alloc]initWithFrame:CGRectMake(WIDTH/2, 130, WIDTH/2, 12)];
    rigtex.delegate=self;
    rigtex.inputView=_pickerView;
    rigtex.text=@"北京奥森→";
    rigtex.textAlignment=NSTextAlignmentRight;
    rigtex.font=[UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    [topview addSubview:rigtex];
    twoview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.41, WIDTH,HEIGHT*0.59)];
    twoview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:twoview];
    topbtn1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    topbtn1.backgroundColor=[UIColor whiteColor];
    [topbtn1 setTitle: @"课程选择" forState: UIControlStateNormal];
    [topbtn1 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    topbtn1.backgroundColor=[UIColor yellowColor];
//    [topbtn1 addTarget:self action:@selector(topbtn1) forControlEvents:UIControlEventTouchUpInside];
    [twoview addSubview:topbtn1];
    

    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, HEIGHT*0.35, WIDTH,  HEIGHT*0.56) style:UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = HEIGHT*0.05;
    mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    
    _selectIndexs = [NSMutableArray new];
    
    
    
    
    confirm=[[UIButton alloc]initWithFrame:CGRectMake(30, HEIGHT-66, WIDTH-60, 44)];
    confirm.backgroundColor=[UIColor yellowColor];
    [confirm setTitle:@"确认" forState:UIControlStateNormal];
    [confirm addTarget:self action:@selector(ysClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirm];
     arry=[NSMutableArray arrayWithObjects:@"小班课",@"大班课",@"大班课5次", nil];
    // Do any additional setup after loading the view.
}

//tabview的数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return arry.count;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    for (int i=0; i<arry.count; i++) {
        timelab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
        timelab2.text= arry[i];
        
    }
   
   
    
//    timelab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
//
//    timelab2.text= @"小班5次课250";
    
    timelab2.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:15];
    UIButton* pickbtn1=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-20, 10, 20, 20)];
    [pickbtn1 setImage:[UIImage imageNamed:@"椭圆 1 拷贝"] forState:UIControlStateNormal];
    [pickbtn1 setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
    [pickbtn1 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:timelab2];
    [cell addSubview:pickbtn1];

    
    
    
    
    
    
    
    
    
    
    return cell;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;//第一个展示字母、第二个展示数字
}

//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (row==0) {
        return @"北京奥数";
    }
    else{
        
        return @"南京奥数";
        
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (row==0) {
        rigtex.text = @"北京奥数";
    }else{ rigtex.text = @"南京奥数";}
    
    [rigtex resignFirstResponder];
    
}
-(void)topbtn1{
    
    
    
    
    
}

- (void)ysClick:(id)sender{
    
    
    NSLog(@"=====%@======",_selectIndexs);
    
    
    NSLog(@"+++++%@",_selectIndexs[0]);
    NSIndexPath *path=_selectIndexs[0];
    NSLog(@"+++++%ld+++++",(long)path.row);
   // 这里看后期传字符串或者数组小标
    
}
- (void)onClick:(UIButton *)sender
{
    
   
    
    
    if(((UIButton *)sender).selected==NO){
    
    UITableViewCell *cell = (UITableViewCell *)[sender superview];
    // 获取cell的indexPath
    NSIndexPath *indexPath = [mytabview indexPathForCell:cell];
    NSLog(@"点击的是第%ld行按钮",indexPath.row);
   [_selectIndexs addObject:indexPath];
    ((UIButton *)sender).selected = YES;
    
}
else{
    
    ((UIButton *)sender).selected = NO;
    UITableViewCell *cell = (UITableViewCell *)[sender superview] ;
    // 获取cell的indexPath
    NSIndexPath *indexPath = [mytabview indexPathForCell:cell];
    
    [_selectIndexs removeObject:indexPath];
    
}
    
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
