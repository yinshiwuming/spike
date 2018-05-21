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
#import "AFNetworking.h"
#define RGB(x,y,z) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:1.0]

#define randomColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
// 宽度(自定义)
#define PIC_WIDTH 125
// 高度(自定义)
#define PIC_HEIGHT 37
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
    UIView *righttimeview;
    NSArray * rightarry;
    NSArray *leftarry;
    NSMutableArray*dayary;
    NSMutableArray *weekarry;
    NSString *dateString;
    NSArray *levarry;
    
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
    [self loadData];
    self.navigationItem.title = @"预约时间";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(addItemmmClick)];
    
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    [self.navigationItem.rightBarButtonItem setImage:[[UIImage imageNamed:@"帮助与反馈"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
//    self.navigationController.navigationBar.tintColor =
//    [UIColor colorWithRed:0.99 green:0.50 blue:0.09 alpha:1.00];
    //主要是以下两个图片设置
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"更多(4)"];
    self.navigationItem.backBarButtonItem = backItem;
    
    
    
    
    
    
    
    
    UIView*dcvie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.125)];
    dcvie.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:dcvie];
    
//    self.view.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100];
    self.view.backgroundColor=[UIColor whiteColor];
    topview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.125, WIDTH, 210)];
    
    [self.view addSubview:topview];
    toplab=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, WIDTH, HEIGHT*0.06)];
    toplab.text=@"   以下为您当前月授课时间";
//    toplab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    toplab.font = [UIFont systemFontOfSize: 12.0];
    toplab.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
    
    UIView* vklab=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.058, WIDTH, 2)];
    vklab.backgroundColor=[UIColor groupTableViewBackgroundColor];
    toplab.backgroundColor=[UIColor whiteColor];
    [toplab setNumberOfLines:0];
    [toplab addSubview:vklab];
    [topview addSubview:toplab];

    
    
    
    
    
    
    
    lebt=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT*0.075, WIDTH/2, HEIGHT*0.064)];
    ribt=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT*0.075, WIDTH/2, HEIGHT*0.064)];
    UIView *seview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.139, WIDTH, 1)];
    seview.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
    UIView *let=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT*0.075, 1, HEIGHT*0.06)];
    let.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    [topview addSubview:let];
    [topview addSubview:lebt];
    [topview addSubview:ribt];
    [topview addSubview:seview];
    lebt.layer.borderColor=[UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1].CGColor;
     ribt.layer.borderColor=[UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1].CGColor;
    //外面嵌套scoview
    [lebt setTitle:@"平日班" forState:UIControlStateNormal];
    [ribt setTitle:@"周末班" forState:UIControlStateNormal];
    [ribt setTitleColor:[UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1] forState:UIControlStateNormal];
    [lebt setTitleColor:[UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1] forState:UIControlStateNormal];
    lebt.titleLabel.font=[UIFont systemFontOfSize:13];
    ribt.titleLabel.font=[UIFont systemFontOfSize:13];
    
    
    
//    [ribt.layer setMasksToBounds:YES];
//    [lebt.layer setMasksToBounds:YES];
//    [ribt.layer setBorderWidth:0.2];
//    [lebt.layer setBorderWidth:0.2];
    
    prompt=[[UILabel alloc]initWithFrame:CGRectMake(5, HEIGHT*0.20, WIDTH, HEIGHT*0.0606+2)];
    prompt.text= @"   请选择可接受时间 ";
    prompt.font  = [UIFont systemFontOfSize: 12.0];
    
    prompt.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
  
    prompt.backgroundColor=[UIColor whiteColor];
   
    
    
    
    
    
    UIView* kelikview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.058, WIDTH, 2)];
    kelikview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [prompt addSubview:kelikview];
     [self.view addSubview:prompt];
  //左右view
  lefttimeview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.14, WIDTH/2, HEIGHT*0.088)];
    
    
    [topview addSubview:lefttimeview];
    
  righttimeview=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2, HEIGHT*0.14, WIDTH/2, HEIGHT*0.088)];
    
    [topview addSubview:righttimeview];
    
    
    
    twoview=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.265, WIDTH,HEIGHT*0.59)];
    twoview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:twoview];
    
    UIView*entview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 8)];
    entview.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [twoview addSubview:entview];
    
    topbtn1=[[UIButton alloc]initWithFrame:CGRectMake(0, 8, WIDTH/2, 40)];
    topbtn1.backgroundColor=[UIColor whiteColor];
    [topbtn1 setTitle: @"平日班" forState: UIControlStateNormal];
    topbtn1.titleLabel.font=[UIFont systemFontOfSize:15];
    
    [topbtn1 setTitleColor:[UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1]forState:UIControlStateNormal];
    topbtn1.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [topbtn1 addTarget:self action:@selector(topbtn1) forControlEvents:UIControlEventTouchUpInside];
    [twoview addSubview:topbtn1];
    topbtn2=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH/2, 8, WIDTH/2, 38)];
    topbtn2.backgroundColor=[UIColor whiteColor];
    [topbtn2 setTitle: @"周末班" forState: UIControlStateNormal];
    topbtn2.titleLabel.font=[UIFont systemFontOfSize:15];
    [topbtn2 setTitleColor:[UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1]forState:UIControlStateNormal];
   
    [topbtn2 addTarget:self action:@selector(topbtn2) forControlEvents:UIControlEventTouchUpInside];
    [twoview addSubview:topbtn2];

    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, WIDTH,  HEIGHT*0.8) style:UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundColor=[UIColor whiteColor];
        mytabview.rowHeight = 42;
  mytabview.scrollEnabled =NO;
    CGRect frame=CGRectMake(0, 0, 0, 0.2);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    mytabview.separatorInset=UIEdgeInsetsZero;
    
    
    
    mytabview.layoutMargins=UIEdgeInsetsZero;
    
    
    [twoview addSubview:mytabview];
    

    //这里赋值请假时间的数组
    Askarry=[NSMutableArray arrayWithObjects:@"2018-01-04" ,@"2018-01-04",nil];
    restbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH*0.12, HEIGHT*0.36, WIDTH*0.76, HEIGHT*0.065)];
    [restbtn setTitle:@"休息时间选择" forState:UIControlStateNormal];
    [restbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [restbtn.layer setMasksToBounds:YES];
    [restbtn.layer setCornerRadius:3.0]; //设置矩形四个圆角半径
    //边框宽度
    [restbtn.layer setBorderWidth:1.0];
    //设置边框颜色有两种方法：第一种如下:1
    
    
    [restbtn addTarget:self action:@selector(choos) forControlEvents:UIControlEventTouchUpInside];
    restbtn.layer.borderColor=[UIColor colorWithRed:255/255.f green:214/255.f blue:0/255.f alpha:1].CGColor;
    restbtn.backgroundColor=[UIColor whiteColor];
    [twoview addSubview:restbtn];
    

    confirm=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-44, WIDTH, 44)];
    confirm.backgroundColor=[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
    [confirm setTitle:@"确定" forState:UIControlStateNormal];
    [confirm setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [confirm addTarget:self action:@selector(working) forControlEvents:UIControlEventTouchUpInside];
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
    
   
    //arry=[NSMutableArray arrayWithObjects:dict,dict1,dict3, nil];
    
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
        
       title = self.letter[row][@"period"];
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
    arry=dayary;
    [mytabview reloadData];
    topbtn1.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    topbtn2.backgroundColor=[UIColor whiteColor];
    
}
-(void)topbtn2{
    arry=weekarry;
    [mytabview reloadData];
    
    
    
    topbtn2.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    topbtn1.backgroundColor=[UIColor whiteColor];
    
}
-(void)choos{
    
    NSLog(@"hhhhh");
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *selectDate) {
        
        dateString = [selectDate stringWithFormat:@"yyyy-MM-dd"];
        NSLog(@"选择的日期：%@",dateString);
        
        
        //请假时件
        
        
        [self levav];
        
        
        
       
    }];
    datepicker.dateLabelColor = [UIColor blackColor];//年-月-日-时-分 颜色
    datepicker.datePickerColor = [UIColor blackColor];//滚轮日期颜色
    datepicker.doneButtonColor = [UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];//确定按钮的颜色
    [datepicker show];
    
    
    
}
- (void)walkVCClick:(NSNotification *)noti

{
    //[self loadData];
    NSLog(@"_+_+_+_+_+_+%@",leftarry);
    self.letter =leftarry;
    
    
    
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
    self.pickerViewtime.backgroundColor=[UIColor whiteColor];
    //取消按钮和确认按钮
    
    ybtn=[[UIButton alloc]initWithFrame:CGRectMake(20, 8, 60, 20)];
   // ybtn.backgroundColor=[UIColor lightGrayColor];
    [ybtn setTitle:@"取消" forState:UIControlStateNormal];
    [ybtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [ybtn addTarget:self action:@selector(leftbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [picview addSubview:ybtn];
    
    
    yesbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-80, 8, 60, 20)];
    
    //yesbtn.backgroundColor=[UIColor yellowColor];
    
    [yesbtn setTitle:@"确定" forState:UIControlStateNormal];
     [yesbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [yesbtn addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
    [picview addSubview:yesbtn];

}

-(void)loadData
{
    //需要展示的数据以数组的形式保存
    
    
    NSString *str =@"http://192.168.1.107:9191/coach/working/to/working";
    NSLog(@"%@",str);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //AFN 2.5.4
    /**
     manager.securityPolicy.allowInvalidCertificates = YES;
     **/
    //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:str
      parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          //反序列化成字符串
          // NSMutableArray *arry =[NSArray arrayWithArray:responseObject[@""]
          NSNumber *status_range = responseObject[@"status"];//状态
          
          
          
          NSLog(@"+++++%@",status_range);
          
           leftarry =responseObject[@"data"][@"dayNTimes"];
          dayary=responseObject[@"data"][@"dayNTimes"];
          arry=responseObject[@"data"][@"dayNTimes"];
          weekarry=responseObject[@"data"][@"endNTimes"];
          
          
          
          NSLog(@"uuuuuuuuuuuuu%@",arry);
          
          [mytabview reloadData];
          
          NSLog(@"%@",leftarry);
          
          //              NSString *status_msg   = responseObject[@"msg"];//msg
          //              if([status_range isEqual:@1]){
          //                  NSArray * ary =  responseObject[@"data"][@"data"];
          //                  //   NSUserDefaults *dd= [NSUserDefaults standardUserDefaults];
          //                  //[dd setObject:ary forKey:@"dataary"];
          //                  //  [dd synchronize];
          //                  _tgArry =  [myrang  tgWitharry:ary];
          //                  [_rtableView setHidden:NO];
          //                  NSLog(@"%@",_tgArry);
          //                  [self.rtableView reloadData];
          //                  [self.rtableView.header endRefreshing];
          //
      }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"==========%@",error);
         }];
    
    
    
    
    
    
    
    
    
    
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
   NSString *str=_letter[row][@"id"];
   NSLog(@"++++++++++%@____________",str) ;
    
    [self Ask];
    
    
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

    UIButton* pickbtn1=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-40, 12, 27, 20)];
    [pickbtn1 setImage:[UIImage imageNamed:@"椭圆 1 拷贝"] forState:UIControlStateNormal];
    [pickbtn1 setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
    [pickbtn1 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:pickbtn1];
//   celldata *myuse = [celldata objectWithKeyValues:arry[indexPath.row]];
//   cell.celldata=myuse;
    
    
    cell.textLabel.text=arry[indexPath.row][@"period"];
    
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.textLabel.textColor=[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
   
    
    cell.separatorInset=UIEdgeInsetsZero;
    
    cell.layoutMargins=UIEdgeInsetsZero;
    return cell;
}
- (void)onClick:(UIButton *)sender
{
    
      if(((UIButton *)sender).selected==NO){
        
        UITableViewCell *cell = (UITableViewCell *)[sender superview];
        // 获取cell的indexPath
        NSIndexPath *indexPath = [mytabview indexPathForCell:cell];
        NSLog(@"点击的是第%ld行按钮",indexPath.row);
        NSString *stringInt = [NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
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
        NSString *stringInt = [NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
        [_selectIndexs removeObject:stringInt];}
    
}
-(void)btnallok{
    _newview =[[UIScrollView alloc]init];
    //依次为它的x y位置，长和宽
    
    _newview .frame =CGRectMake(WIDTH*0.09, HEIGHT*0.5, WIDTH*0.9,HEIGHT*0.125);
    _newview .backgroundColor=[UIColor whiteColor];
    [_newview  setContentSize:CGSizeMake(WIDTH*0.9, 380)];
    //把这个对象加到view中去。显示出来
    [twoview addSubview:_newview ];
   
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
        CGFloat margin = (self.view.bounds.size.width*0.85 - (PIC_WIDTH * COL_COUNT)) / (COL_COUNT + 1);
        // PointX
        CGFloat picX = margin + (PIC_WIDTH + margin) * col;
        // PointY
        CGFloat picY = margin + (PIC_HEIGHT + margin) * row;
        
        // 图片的frame
       UIView *btn=[[UIView alloc]initWithFrame: CGRectMake(picX+2, picY+2, PIC_WIDTH, PIC_HEIGHT)];
        btn.layer.borderWidth = 1;
        
        btn.layer.borderColor = [[UIColor colorWithRed:194/255.0 green:193.2/255.0 blue:193.2/255.0 alpha:1] CGColor];
        

//        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, btn.imageView.frame.size.width+4, 0, btn.imageView.frame.size.width)];
//        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -btn.titleLabel.bounds.size.width, 0, -btn.titleLabel.bounds.size.width)];
//
//        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -btn.imageView.frame.size.width, 0, btn.imageView.frame.size.width)];
//        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, btn.titleLabel.frame.size.width, 0, -btn.titleLabel.frame.size.width)];
        
//        [btn setTitle:myarry[i] forState: UIControlStateNormal];
//        btn.titleLabel.font=[UIFont systemFontOfSize:13];
//
//        //btn.titleLabel.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:10];
//        [btn setImage:[UIImage imageNamed:@"日历、日期 拷贝"]forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
//        [btn.layer setCornerRadius:3];
//
//        [btn.layer setBorderWidth:1];//设置边界的宽度
//        //设置按钮的边界颜色
//        CGColorRef cgColor = [UIColor groupTableViewBackgroundColor].CGColor;
//        [btn.layer setBorderColor:cgColor];
//
//
         self.automaticallyAdjustsScrollViewInsets=NO;
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(6, 0, PIC_WIDTH*0.7, PIC_HEIGHT)];
        lab.text=@" 04-01-2018";
        lab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:11];
        lab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [btn addSubview:lab];
        UIView *el1=[[UIView alloc]initWithFrame:CGRectMake(PIC_WIDTH*0.7, 6, 1, PIC_HEIGHT*0.7)];
        el1.backgroundColor=[UIColor colorWithRed:194/255.0 green:193.2/255.0 blue:193.2/255.0 alpha:1];
        [btn addSubview:el1];
        UIImageView *ima=[[UIImageView alloc]initWithFrame:CGRectMake(PIC_WIDTH*0.78, PIC_HEIGHT*0.25, PIC_WIDTH*0.15, PIC_HEIGHT*0.5)];
        ima.image=[UIImage imageNamed:@"日历、日期 拷贝"];
        [btn addSubview:ima];
        
        
        
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
        
        
        if (leftarry.count>=rightarry.count) {
            
            if (leftarry.count==0) {
                
            }
            if (leftarry.count==1) {
                
            }
            if (leftarry.count==2) {
                CGRect frame = twoview.frame;
                frame.origin.y=HEIGHT*0.41+44;
                
                twoview.frame = frame;
                
                CGRect frame1 = prompt.frame;
                frame1.origin.y=HEIGHT*0.35+44;
                
                prompt.frame = frame1;
                
                [self lettime];
                [self righttime];
                
            }
            
            CGRect frame = twoview.frame;
            frame.origin.y=HEIGHT*0.41+89;
            
            twoview.frame = frame;
            
            CGRect frame1 = prompt.frame;
            frame1.origin.y=HEIGHT*0.35+89;
            
            prompt.frame = frame1;
            
            [self lettime];
            [self righttime];
            
            
            
            
        }
        
        
        
        
      
        
        
        
        
        
        
        
        
        ((UIButton *)sender).selected = YES;
        
    }
    else{
        CGRect frame = twoview.frame;
        frame.origin.y=HEIGHT*0.265;
        
        
        twoview.frame = frame;
        
        CGRect frame2 = prompt.frame;
        frame2.origin.y=HEIGHT*0.20;
        
        prompt.frame = frame2;
        
        
        
        ((UIButton *)sender).selected = NO;
    }
   
}



- (void)lettime {
    
    
//    for (int i = 1; i < 3; i++){
//
//        int x=WIDTH/2;
//        int y=i*11;
//
//        int hy=(i-1)*3;
//
//        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(0, y+hy, x, 12)];
//        lab.text=@"9:00-10:00";
//        lab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
//       lab.textAlignment = NSTextAlignmentCenter;
//        [lefttimeview addSubview:lab];
    
  //  }
    
    if (leftarry.count==1) {
        UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 43)];
        lab1.text = @"9：00-12：00";
        lab1.textAlignment=NSTextAlignmentCenter;
        lab1.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
        lab1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [lefttimeview addSubview:lab1];
        UIView *vil1=[[UIView alloc]initWithFrame:CGRectMake(0, 43, WIDTH, 1)];
        vil1.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [lefttimeview addSubview:vil1];
        
        UIView*kil1=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2, 0, 1, 44)];
        kil1.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [lefttimeview addSubview:kil1];
        
        
        UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(0, 44, WIDTH/2, 43)];
        lab2.text = @"14：00-17：00";
        lab2.textAlignment=NSTextAlignmentCenter;
        lab2.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
        lab2.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [lefttimeview addSubview:lab2];
        UIView *vi2=[[UIView alloc]initWithFrame:CGRectMake(0, 87, WIDTH, 1)];
        vi2.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [lefttimeview addSubview:vi2];
        UIView*kil2=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2,44, 1, 44)];
        kil2.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [lefttimeview addSubview:kil2];
        
    }
    
    
    if (leftarry.count==2) {
        
        UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 43)];
        lab1.text = @"9：00-12：00";
        lab1.textAlignment=NSTextAlignmentCenter;
        lab1.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
        lab1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [lefttimeview addSubview:lab1];
        UIView *vil1=[[UIView alloc]initWithFrame:CGRectMake(0, 43, WIDTH, 1)];
        vil1.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [lefttimeview addSubview:vil1];
        
        UIView*kil1=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2, 0, 1, 44)];
        kil1.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [lefttimeview addSubview:kil1];
        
        
        
        
        UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(0, 44, WIDTH/2, 43)];
        lab2.text = @"14：00-17：00";
        lab2.textAlignment=NSTextAlignmentCenter;
        lab2.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
        lab2.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [lefttimeview addSubview:lab2];
        UIView *vi2=[[UIView alloc]initWithFrame:CGRectMake(0, 87, WIDTH, 1)];
        vi2.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [lefttimeview addSubview:vi2];
        UIView*kil2=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2,44, 1, 44)];
        kil2.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
        [lefttimeview addSubview:kil2];
    }
    
    
     if (leftarry.count==3) {
    
         UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 43)];
         lab1.text = @"9：00-12：00";
         lab1.textAlignment=NSTextAlignmentCenter;
         lab1.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
         lab1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
         [lefttimeview addSubview:lab1];
         UIView *vil1=[[UIView alloc]initWithFrame:CGRectMake(0, 43, WIDTH, 1)];
         vil1.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
         [lefttimeview addSubview:vil1];
         
         UIView*kil1=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2, 0, 1, 44)];
         kil1.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
         [lefttimeview addSubview:kil1];
         
         
         
         
         UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(0, 44, WIDTH/2, 43)];
         lab2.text = @"14：00-17：00";
         lab2.textAlignment=NSTextAlignmentCenter;
         lab2.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
         lab2.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
         [lefttimeview addSubview:lab2];
         UIView *vi2=[[UIView alloc]initWithFrame:CGRectMake(0, 87, WIDTH, 1)];
         vi2.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
         [lefttimeview addSubview:vi2];
         UIView*kil2=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2,44, 1, 44)];
         kil2.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
         [lefttimeview addSubview:kil2];
         
         
         UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(0, 89, WIDTH/2, 43)];
         lab3.text = @"14：00-17：00";
         lab3.textAlignment=NSTextAlignmentCenter;
         lab3.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
         lab3.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
         [lefttimeview addSubview:lab3];
         UIView *vi3=[[UIView alloc]initWithFrame:CGRectMake(0, 131, WIDTH, 1)];
         vi3.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
         [lefttimeview addSubview:vi3];
         UIView*kil3=[[UIView alloc]initWithFrame:CGRectMake(WIDTH/2,88, 1, 44)];
         kil3.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
         [lefttimeview addSubview:kil3];
         
         
         
         
         
         
         
         
     }
    
}


- (void)righttime {
    
//
//    for (int i = 1; i < 2; i++){
//
//        int x=WIDTH/2;
//        int y=i*11;
//
//        int hy=(i-1)*3;
//
//        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2, y+hy, x, 11)];
//        lab.text=@"9:00-10:00";
//        lab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
//        lab.textAlignment = NSTextAlignmentCenter;
//        [lefttimeview addSubview:lab];
    
   // }
    
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH/2, 44)];
    lab1.text = @"9：00-12：00";
    lab1.textAlignment=NSTextAlignmentCenter;
    lab1.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
    lab1.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [righttimeview addSubview:lab1];
//    UIView *vil1=[[UIView alloc]initWithFrame:CGRectMake(0, 44, WIDTH, 1)];
//    vil1.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
//    [righttimeview addSubview:vil1];
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(0, 45, WIDTH/2, 44)];
    lab2.text = @"14：00-17：00";
    lab2.textAlignment=NSTextAlignmentCenter;
    lab2.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:9.3];
    lab2.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [righttimeview addSubview:lab2];
//    UIView *vi2=[[UIView alloc]initWithFrame:CGRectMake(0, 90, WIDTH, 1)];
//    vi2.backgroundColor=[UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1];
//    [righttimeview addSubview:vi2];
    
    
    
    
}





-(void)levav{
    
    //请假时间日期上传获取所选日期时间段
    //http://192.168.1.107:9191/coach/working/to/leaving?date=2018-06-12&snowPackId=1
   
    NSString *data=dateString;
    NSString *str = [NSString stringWithFormat:@"http://192.168.1.107:9191/coach/working/to/leaving?date=%@&snowPackId=1",data];
    NSLog(@"%@",str);
    
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //AFN 2.5.4
    /**
     manager.securityPolicy.allowInvalidCertificates = YES;
     **/
    //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    [manager GET:str
      parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          //反序列化成字符串
          // NSMutableArray *arry =[NSArray arrayWithArray:responseObject[@""]
          NSNumber *status_range = responseObject[@"status"];//状态
          levarry =responseObject[@"data"];
          NSLog(@"************%@",status_range);
          
         
          
          //              NSString *status_msg   = responseObject[@"msg"];//msg
          //              if([status_range isEqual:@1]){
          //                  NSArray * ary =  responseObject[@"data"][@"data"];
          //                  //   NSUserDefaults *dd= [NSUserDefaults standardUserDefaults];
          //                  //[dd setObject:ary forKey:@"dataary"];
          //                  //  [dd synchronize];
          //                  _tgArry =  [myrang  tgWitharry:ary];
          //                  [_rtableView setHidden:NO];
          //                  NSLog(@"%@",_tgArry);
          //                  [self.rtableView reloadData];
          //                  [self.rtableView.header endRefreshing];
          //
      }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"==========%@",error);
         }];
    
    
    
    
    
    
    
    
    
    
}
     
     -(void)Ask{
         
         
      
       //  NSString *str = @"http://192.168.1.107:9191/coach/working/leaving?timesId=2&date=2018-05-22";
         //NSLog(@"%@",str);
         
         
         
         
         AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
         //AFN 2.5.4
         /**
          manager.securityPolicy.allowInvalidCertificates = YES;
          **/
         //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
         manager.securityPolicy.validatesDomainName = NO;
         
         NSMutableDictionary *params = [NSMutableDictionary dictionary];
            params[@"timesId"] = @"2";
            params[@"date"] = @"2018-05-22";
         
         
         
         
         
         
         [manager POST:@"http://192.168.1.107:9191/coach/working/leaving" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            
                  } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         NSLog(@"请求成功:%@", responseObject);
                
                      
                
                      
                 
                 
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    
                        
                     
                         }];
         
         
         
         
         
         
         
         
         
         
         
     }
     
     
-(void)addItemmmClick{
    
    
    //帮助界面
    
    
}
-(void)working{
    
    NSLog(@"电器选国美");
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //AFN 2.5.4
    /**
     manager.securityPolicy.allowInvalidCertificates = YES;
     **/
    //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *string = [_selectIndexs componentsJoinedByString:@","];
    
 
    
        NSString *str = [NSString stringWithFormat:@"%@,",string];
    NSLog(@"yyyyyyyy%@",str);
    params[@"timesIds"] =str;
   
    
    
    
    
    
    
    [manager POST:@"http://192.168.1.107:9191/coach/working/working" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        
        
        confirm.backgroundColor=[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
    
    
}


@end
