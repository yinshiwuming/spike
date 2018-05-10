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
#import "MJExtension.h"
#import "timeTableViewCell.h"
#define RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]

#define randomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
// 宽度(自定义)
#define PIC_WIDTH 156
// 高度(自定义)
#define PIC_HEIGHT 48
// 列数(自定义)
#define COL_COUNT 2

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
    NSMutableArray*Askarry;
//    UIScrollView *newview;
    UIButton *lebt;
    UIButton *ribt;
    NSDictionary *dict;
    NSDictionary *dict1;
    NSDictionary *dict2;
    NSDictionary *dict3;
     NSDictionary *dict4;
     NSDictionary *dict5;
     NSDictionary *dict6;
     NSDictionary *dict7;
    UIScrollView *lebtscoview;
    UIScrollView *ribtscoview;
     NSMutableArray*myarry;
    UILabel *prompt;
    UIView *lefttimeview;
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
    self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
   
//    self.view.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100];
    self.view.backgroundColor=[UIColor whiteColor];
    topview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.125, WIDTH, HEIGHT*0.33)];
    
    [self.view addSubview:topview];
    toplab=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, WIDTH, HEIGHT*0.06)];
    toplab.text=@"   以下为您当前月授课时间";
    toplab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    toplab.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    
    UIView* vklab=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.058, WIDTH, 1)];
    vklab.backgroundColor=[UIColor colorWithRed:234.0f/255.0f green:234.0f/255.0f blue:234.0f/255.0f alpha:0.5];
    toplab.backgroundColor=[UIColor whiteColor];
    [toplab setNumberOfLines:0];
    [toplab addSubview:vklab];
    [topview addSubview:toplab];

    
    
    
    
    
    
    
    lebt=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT*0.075, WIDTH/2, HEIGHT*0.064)];
    ribt=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT*0.075, WIDTH/2, HEIGHT*0.064)];
    [topview addSubview:lebt];
    [topview addSubview:ribt];
    //外面嵌套scoview
    [lebt setTitle:@"平日班" forState:UIControlStateNormal];
    [ribt setTitle:@"周末班" forState:UIControlStateNormal];
    [ribt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lebt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ribt.layer setMasksToBounds:YES];
    [lebt.layer setMasksToBounds:YES];
    [ribt.layer setBorderWidth:0.3];
    [lebt.layer setBorderWidth:0.3];
    
    prompt=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT*0.202, WIDTH, HEIGHT*0.062)];
    prompt.text= @"   请选择可接受时间 ";
    prompt.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    prompt.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    prompt.textColor=[UIColor blackColor];
    prompt.backgroundColor=[UIColor whiteColor];
    UIView* kelikview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.058, WIDTH, 2)];
    kelikview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [prompt addSubview:kelikview];
     [self.view addSubview:prompt];
    
  lefttimeview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.14, WIDTH/2, HEIGHT*0.088)];
    
    
    [topview addSubview:lefttimeview];
    
   UIView *righttimeview=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT*0.14, WIDTH/2, HEIGHT*0.088)];
    
    [topview addSubview:righttimeview];
    
    
    
    twoview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.265, WIDTH,HEIGHT*0.59)];
    twoview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:twoview];
    topbtn1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 44)];
    topbtn1.backgroundColor=[UIColor whiteColor];
    [topbtn1 setTitle: @"平日班" forState: UIControlStateNormal];
    [topbtn1 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    topbtn1.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [topbtn1 addTarget:self action:@selector(topbtn1) forControlEvents:UIControlEventTouchUpInside];
    [twoview addSubview:topbtn1];
    topbtn2=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/2, 44)];
    topbtn2.backgroundColor=[UIColor whiteColor];
    [topbtn2 setTitle: @"周末班" forState: UIControlStateNormal];
    [topbtn2 setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
   
    [topbtn2 addTarget:self action:@selector(topbtn2) forControlEvents:UIControlEventTouchUpInside];
    [twoview addSubview:topbtn2];

    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, WIDTH,  HEIGHT*0.8) style:UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = HEIGHT*0.05;
//    mytabview.scrollEnabled =NO;
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
   
    [twoview addSubview:mytabview];
    

    //这里赋值请假时间的数组
    Askarry=[NSMutableArray arrayWithObjects:@"2018-01-04" ,@"2018-01-04",nil];
    restbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH*0.234, HEIGHT*0.3, WIDTH*0.49, HEIGHT*0.065)];
    [restbtn setTitle:@"休息时间选择" forState:UIControlStateNormal];
    [restbtn addTarget:self action:@selector(choos) forControlEvents:UIControlEventTouchUpInside];
    restbtn.layer.borderColor=[UIColor yellowColor].CGColor;
    restbtn.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [twoview addSubview:restbtn];
    

    confirm=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-44, WIDTH, 44)];
    confirm.backgroundColor=[UIColor lightGrayColor];
    [confirm setTitle:@"确认" forState:UIControlStateNormal];
    [self.view addSubview:confirm];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(walkVCClick:)name:@"buttonLoseResponse" object:nil];
    
    // Do any additional setup after loading the view.
    //关于传过来的数组
    
     _selectIndexs = [NSMutableArray new];
    dict = @{
             @"name" : @"9：00-12：00",
             
             };
    
    // 将字典转为User模型
    
    dict3 = @{
              @"name" : @"14：00-17：00",
              
              
              };
    dict1 = @{
              @"name" : @"19：00-21：00",
              
              };
    dict4= @{
              @"name" : @"19：00-21：00",
              
              };
    dict5 = @{
              @"name" : @"19：00-21：00",
              
              };
    dict6 = @{
              @"name" : @"19：00-21：00",
              
              };
    
    arry=[NSMutableArray arrayWithObjects:dict,dict1,dict3, nil];
    
  //这里是scoview
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    
    

    
    NSString *passWord = @"1";NSUserDefaults *user = [NSUserDefaults standardUserDefaults];[user setObject:passWord forKey:@"key"];
    [NSUserDefaults resetStandardUserDefaults];
    UIButton*sbt=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH*0.8, 0, 44, 44)];
    [sbt setImage:[UIImage imageNamed:@"更多"] forState:UIControlStateSelected];
    [sbt setImage:[UIImage imageNamed:@"下拉"] forState:UIControlStateNormal ];

    [sbt addTarget:self action:@selector(sbtlink:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:sbt];
    
    
    
    
    
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
    topbtn1.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    topbtn2.backgroundColor=[UIColor whiteColor];
    
}
-(void)topbtn2{
    
    [mytabview reloadData];
    topbtn2.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
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
    //这里是请假时间段选择时间
    
    NSInteger row=[self.pickerViewtime selectedRowInComponent:0];
    NSString *str=_letter[row];
    NSLog(@"++++++++++%@____________",str) ;
    
    
    
    
    [self.pickerViewtime removeFromSuperview];
    //[ybtn removeFromSuperview];
    [picview removeFromSuperview];
    [self btnallok];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return arry.count;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    timeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    
    cell = [[timeTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];

    UIButton* pickbtn1=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-32, 8, 20, 20)];
    [pickbtn1 setImage:[UIImage imageNamed:@"椭圆 1 拷贝"] forState:UIControlStateNormal];
    [pickbtn1 setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
    [pickbtn1 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:pickbtn1];
   celldata *myuse = [celldata objectWithKeyValues:arry[indexPath.row]];
   cell.celldata=myuse;
    
    return cell;
}
- (void)onClick:(UIButton *)sender
{
    
      if(((UIButton *)sender).selected==NO){
        
        UITableViewCell *cell = (UITableViewCell *)[sender superview];
        // 获取cell的indexPath
        NSIndexPath *indexPath = [mytabview indexPathForCell:cell];
        NSLog(@"点击的是第%ld行按钮",indexPath.row);
        NSString *stringInt = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        [_selectIndexs addObject:stringInt];
        NSLog(@"**********%@",_selectIndexs);
        ((UIButton *)sender).selected = YES;
     
    }
    else{
        
        ((UIButton *)sender).selected = NO;
        UITableViewCell *cell = (UITableViewCell *)[sender superview] ;
        // 获取cell的indexPath
        NSIndexPath *indexPath = [mytabview indexPathForCell:cell];
        NSLog(@"点击的是第%ld行按钮",indexPath.row);
        NSString *stringInt = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        [_selectIndexs removeObject:stringInt];}
    
}
-(void)btnallok{
    _newview =[[UIScrollView alloc]init];
    //依次为它的x y位置，长和宽
    _newview .frame =CGRectMake(0, HEIGHT*0.78, WIDTH,HEIGHT*0.125);
    _newview .backgroundColor=[UIColor whiteColor];
    [_newview  setContentSize:CGSizeMake(320, 420)];
    //把这个对象加到view中去。显示出来
    [self.view addSubview:_newview ];
   
    myarry=[NSMutableArray arrayWithObjects:@"9:00-12:00",@"9:00-12:00", nil];
    myarry=(NSMutableArray *)[[myarry reverseObjectEnumerator] allObjects];
    
    // [self loadImage];
    
    [self addPictures];
    //设置数组读取获得i值遍历数组后九宫格创建btn
    

}
- (void)addPictures {
    
    // 在for循环中添加
    // pictures.count中的pictures是一个图片数组，代表着要添加多少个图片
    for (int i = 0; i < myarry.count; i++) {
        //创建图片
        UIImageView *imageView = [[UIImageView alloc] init];
        
        imageView.backgroundColor=[UIColor yellowColor];
        
        //设置一个数组
        
        // 图片所在行
        NSInteger row = i / COL_COUNT;
        // 图片所在列
        NSInteger col = i % COL_COUNT;
        // 间距
        CGFloat margin = (self.view.bounds.size.width - (PIC_WIDTH * COL_COUNT)) / (COL_COUNT + 1);
        // PointX
        CGFloat picX = margin + (PIC_WIDTH + margin) * col;
        // PointY
        CGFloat picY = margin + (PIC_HEIGHT + margin) * row;
        
        // 图片的frame
        UIButton *btn=[[UIButton alloc]initWithFrame: CGRectMake(picX, picY, PIC_WIDTH, PIC_HEIGHT)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0,0, btn.titleLabel.bounds.size.width,btn.titleLabel.bounds.size.width)];
        
        [btn setTitle:myarry[i] forState: UIControlStateNormal];
        //btn.titleLabel.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:10];
        [btn setImage:[UIImage imageNamed:@"日历、日期 拷贝"]forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [btn.layer setCornerRadius:10];
        
        [btn.layer setBorderWidth:2];//设置边界的宽度
        //设置按钮的边界颜色
        CGColorRef cgColor = [UIColor groupTableViewBackgroundColor].CGColor;
        [btn.layer setBorderColor:cgColor];
        
        
        
        
        
        
        
//        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(20, 0, WIDTH/2-20, 34)];
//        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
//        [btn setImageEdgeInsets:UIEdgeInsetsMake(0,0, btn.titleLabel.bounds.size.width,btn.titleLabel.bounds.size.width)];
//        [btn setTitle:@"2018-11-4" forState: UIControlStateNormal ];
//        [btn setImage:[UIImage imageNamed:@"日历、日期 拷贝"] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
//        [btn.layer setCornerRadius:10];
//        [btn.layer setBorderWidth:2];//设置边界的宽度
//        //设置按钮的边界颜色
//        CGColorRef cgColor = [UIColor groupTableViewBackgroundColor].CGColor;
//        [btn.layer setBorderColor:cgColor];
//
        
        
        
        
        
        
        
        
        
        [_newview   addSubview:btn];
    }
}



- (void)sbtlink:(UIButton *)sender
{
    
//    CGRect frame = twoview.frame;
//    frame.origin.y=HEIGHT*0.41;
//
//    twoview.frame = frame;
    if(((UIButton *)sender).selected==NO){
            CGRect frame = twoview.frame;
          frame.origin.y=HEIGHT*0.41;
        
           twoview.frame = frame;
        
        CGRect frame1 = prompt.frame;
        frame1.origin.y=HEIGHT*0.35;
        
        prompt.frame = frame1;
        
         [self lettime];
        [self righttime];
        
      
        
        
        
        
        
        
        
        
        ((UIButton *)sender).selected = YES;
        
    }
    else{
        CGRect frame = twoview.frame;
        frame.origin.y=HEIGHT*0.265;
        
        
        twoview.frame = frame;
        
        CGRect frame2 = prompt.frame;
        frame2.origin.y=HEIGHT*0.202;
        
        prompt.frame = frame2;
        
        
        
        ((UIButton *)sender).selected = NO;
    }
   
}



- (void)lettime {
    
    
    for (int i = 1; i < 4; i++){
        
        int x=WIDTH/2;
        int y=i*11;
        
        int hy=(i-1)*3;
        
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, y+hy, x, 12)];
        lab.text=@"9:00-10:00";
        lab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
       lab.textAlignment = NSTextAlignmentCenter;
        [lefttimeview addSubview:lab];
        
    }
    
    
    
    
    
    
}


- (void)righttime {
    
    
    for (int i = 1; i < 4; i++){
        
        int x=WIDTH/2;
        int y=i*11;
        
        int hy=(i-1)*3;
        
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, y+hy, x, 11)];
        lab.text=@"9:00-10:00";
        lab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
        lab.textAlignment = NSTextAlignmentCenter;
        [lefttimeview addSubview:lab];
        
    }
    
    
    
    
    
    
}



@end
