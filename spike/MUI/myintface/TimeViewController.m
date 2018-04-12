//
//  TimeViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/3.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "TimeViewController.h"
#import "TimeViewController.h"
#import "WSDatePickerView.h"
#define RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]

#define randomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface TimeViewController (){
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
    UIButton*pickbtn1;
    UIButton*pickbtn2;
    UIButton*pickbtn3;
    UIButton* restbtn;
    UIButton*confirm;
   
    UIButton *ybtn;
    UIView * picview;
    UIButton *yesbtn;
    UITableView *mytabview;
    NSMutableArray*arry;
}
@property (nonatomic,strong)UIPickerView * pickerViewtime;
@property (nonatomic,strong)UIPickerView *pickerView;
//自定义pickerview
@property (nonatomic,strong)NSArray * letter;//保存要展示的字母
@property (strong, nonatomic) NSMutableArray *selectIndexs;//选中行的数组
@end

@implementation TimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"预约时间";
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
    topbtn1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 44)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    topbtn1.backgroundColor=[UIColor whiteColor];
    [topbtn1 setTitle: @"平日班" forState: UIControlStateNormal];
    [topbtn1 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    topbtn1.backgroundColor=[UIColor yellowColor];
    [topbtn1 addTarget:self action:@selector(topbtn1) forControlEvents:UIControlEventTouchUpInside];
    [twoview addSubview:topbtn1];
    
    
    topbtn2=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/2, 44)];
    //topbtn1.backgroundColor=[UIColor whiteColor];
    topbtn2.backgroundColor=[UIColor whiteColor];
    [topbtn2 setTitle: @"周末班" forState: UIControlStateNormal];
    [topbtn2 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
   
    [topbtn2 addTarget:self action:@selector(topbtn2) forControlEvents:UIControlEventTouchUpInside];
    [twoview addSubview:topbtn2];
//    view1=[[UIView alloc]initWithFrame:CGRectMake(0, 44, WIDTH, 44)];
//    view1.backgroundColor=[UIColor redColor];
//    timelab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
//    timelab.text=@"9：00-12：00";
//    timelab.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:15];
//    pickbtn1=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-20, 10, 20, 20)];
//    [pickbtn1 setImage:[UIImage imageNamed:@"选中"]forState:UIControlStateNormal];
//    [view1 addSubview:pickbtn1];
//    [view1 addSubview:timelab];
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, WIDTH,  HEIGHT*0.56) style:UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = HEIGHT*0.05;
    mytabview.scrollEnabled =NO;
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
   
    [twoview addSubview:mytabview];
//    view2=[[UIView alloc]initWithFrame:CGRectMake(0, 84, WIDTH, 44)];
//     view2.backgroundColor=[UIColor yellowColor];
//    timelab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
//
//    timelab2.text= @"14：00-17：00";
//    timelab2.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:15];
//    [view2 addSubview:timelab2];
//    //[pickbtn2 setImage:[UIImage imageNamed:@"选中"]forState:UIControlStateNormal];
//
//    [twoview addSubview:view2];
//
    
//    view3=[[UIView alloc]initWithFrame:CGRectMake(0, 128, WIDTH, 44)];
//    view3.backgroundColor=[UIColor blueColor];
//
//    timelab3=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
//    timelab3.text=@"9：00-12：00";
//    timelab3.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:15];
//    //[pickbtn3 setImage:[UIImage imageNamed:@"选中"]forState:UIControlStateNormal];
//    [view3 addSubview:timelab3];
//     [twoview addSubview:view3];
    
    restbtn=[[UIButton alloc]initWithFrame:CGRectMake(88, HEIGHT*0.3, 186, 44)];
    [restbtn setTitle:@"休息时间选择" forState:UIControlStateNormal];
     [restbtn addTarget:self action:@selector(choos) forControlEvents:UIControlEventTouchUpInside];
    
    restbtn.layer.borderColor=[UIColor yellowColor].CGColor;
    restbtn.backgroundColor=[UIColor yellowColor];
    [twoview addSubview:restbtn];
    confirm=[[UIButton alloc]initWithFrame:CGRectMake(88, HEIGHT-44, 186, 44)];
    confirm.backgroundColor=[UIColor lightGrayColor];
    [confirm setTitle:@"确认" forState:UIControlStateNormal];
    [self.view addSubview:confirm];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(walkVCClick:) name:@"buttonLoseResponse" object:nil];
    
    // Do any additional setup after loading the view.
    //关于传过来的数组
    arry=[NSMutableArray arrayWithObjects:@"9：00-12：00",@"14：00-17：00",@"19：00-21：00", nil];
     _selectIndexs = [NSMutableArray new];
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;//第一个展示字母、第二个展示数字
}

//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView.tag==100) {
        NSInteger result = 0;
        
        result = self.letter.count;//根据数组的元素个数返回几行数据
        
        
        
        return result;
    } else {
        return 2;
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag==100) {
        NSString * title = nil;
        
        title = self.letter[row];
        
        
        
        return title;
    } else {
        
        if (row==0) {
            return @"北京奥数";
        }
        else{
            
            return @"南京奥数";
            
        }
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
    
    [mytabview reloadData];
     topbtn1.backgroundColor=[UIColor yellowColor];
    topbtn2.backgroundColor=[UIColor whiteColor];
    
}
-(void)topbtn2{
    
    [mytabview reloadData];
    topbtn2.backgroundColor=[UIColor yellowColor];
    topbtn1.backgroundColor=[UIColor whiteColor];
    
}
-(void)choos{
    
    NSLog(@"hhhhh");
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        
        NSString *dateString = [selectDate stringWithFormat:@"yyyy-MM-dd"];
        NSLog(@"选择的日期：%@",dateString);
       
    }];
    datepicker.dateLabelColor = randomColor;//年-月-日-时-分 颜色
    datepicker.datePickerColor = randomColor;//滚轮日期颜色
    datepicker.doneButtonColor = randomColor;//确定按钮的颜色
    [datepicker show];
    
    
    
}
- (void)walkVCClick:(NSNotification *)noti

{
    
    
    [self loadData];
    picview=[[UIView alloc]initWithFrame:CGRectMake(0, 400, WIDTH, 30)];
    picview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:picview];
    // 初始化pickerView
    self.pickerViewtime = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 430, self.view.bounds.size.width, HEIGHT-430)];
    self.pickerViewtime.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.pickerViewtime];
    
    //指定数据源和委托
    self.pickerViewtime.delegate = self;
    self.pickerViewtime.dataSource = self;
    self.pickerViewtime.tag=100;
    self.pickerViewtime.backgroundColor=[UIColor yellowColor];
    //取消按钮和确认按钮
    
  ybtn=[[UIButton alloc]initWithFrame:CGRectMake(20, 8, 60, 20)];
    ybtn.backgroundColor=[UIColor lightGrayColor];
    [ybtn setTitle:@"取消" forState:UIControlStateNormal];
    
    
     [ybtn addTarget:self action:@selector(leftbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [picview addSubview:ybtn];
    
    
    yesbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-80, 8, 60, 20)];
    
    yesbtn.backgroundColor=[UIColor yellowColor];
    
    [yesbtn setTitle:@"确定" forState:UIControlStateNormal];
    
    
    [yesbtn addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
    [picview addSubview:yesbtn];
    
    
    
}

-(void)loadData
{
    //需要展示的数据以数组的形式保存
    self.letter = @[@"9：00-12：00",@"14：00-17：00",@"19：00-21：00"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
-(void)leftbuttonClick{
    
    
    [self.pickerViewtime removeFromSuperview];
    //[ybtn removeFromSuperview];
    [picview removeFromSuperview];
}
-(void)right{
    [self.pickerViewtime removeFromSuperview];
    //[ybtn removeFromSuperview];
    [picview removeFromSuperview];
}

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
