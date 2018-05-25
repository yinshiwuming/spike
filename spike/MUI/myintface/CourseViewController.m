//
//  CourseViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/4.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "CourseViewController.h"
#import "courdata.h"
#import "courTableViewCell.h"
#import "MJExtension.h"
#import "AFNetworking.h"
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
    NSDictionary *dict;
    NSDictionary *dict1;
    NSDictionary *dict2;
    NSDictionary *dict3;
    NSDictionary *dict4;
    NSDictionary *dict5;
    NSDictionary *dict6;
    NSDictionary *dict7;
    NSMutableArray *idarry;
    UIButton* pickbtn1;
    
}
@property (nonatomic,strong)UIPickerView * pickerView;//自定义pickerview
@property (nonatomic,strong)NSArray * letter;//保存要展示的字母
@property (strong, nonatomic) NSMutableArray *selectIndexs;//选中行的数组

@end

@implementation CourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.navigationItem.title = @"课程选择";
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(addItemmmClick)];
    
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
    [self.navigationItem.rightBarButtonItem setImage:[[UIImage imageNamed:@"帮助与反馈"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    self.view.backgroundColor=[UIColor colorWithRed:237.0/255.0 green:237.0/255.0 blue:237.0/255.0 alpha:100];
    topview=[[UIView alloc]initWithFrame:CGRectMake(0, 74, WIDTH, HEIGHT*0.20)];
    topview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:topview];
    toplab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH, 13)];
    toplab.text=@"选课须知:";
    
   toplab.font= [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    toplab.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
    
    
    
    
    
    
    toplab.backgroundColor=[UIColor whiteColor];
    [toplab setNumberOfLines:0];
    UILabel *minlab=[[UILabel alloc]initWithFrame:CGRectMake(10, 15, WIDTH, 44)];
    minlab.text=@"请注意请注意请注意";
    minlab.backgroundColor=[UIColor whiteColor];
    minlab.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:12];
    minlab.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
    [minlab setNumberOfLines:0];
    
    
    
    
    
    
    
    [topview addSubview:minlab];
    [topview addSubview:toplab];
//    UIView*viow=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.165, WIDTH, 2)];
//    viow.backgroundColor=[UIColor lightGrayColor];
//    [topview addSubview:viow];
    leftlab=[[UILabel alloc]initWithFrame:CGRectMake(10, 130, WIDTH/4, 12)];
    leftlab.font=[UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    leftlab.text=@"雪场选择";
//    [topview addSubview:leftlab];
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
//    [topview addSubview:rigtex];
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
    

    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, HEIGHT*0.2+82, WIDTH,  HEIGHT*0.65) style:UITableViewStyleGrouped ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 44;
    mytabview.scrollEnabled =NO;
    mytabview.separatorInset=UIEdgeInsetsZero;
    
    mytabview.layoutMargins=UIEdgeInsetsZero;
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    [self.view addSubview:mytabview];
    
    _selectIndexs = [NSMutableArray new];
    
    
    
    
    confirm=[[UIButton alloc]initWithFrame:CGRectMake(30, HEIGHT-66, WIDTH-60, 44)];
    
    if (idarry.count>0) {
         confirm.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
        [confirm setEnabled:NO];
    }else{
        
        
         [confirm setEnabled:YES];
        
    }
    
    
    
    confirm.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [confirm setTitle:@"确认" forState:UIControlStateNormal];
    [confirm setTitleColor:[UIColor blackColor] forState: UIControlStateNormal ];
    [confirm addTarget:self action:@selector(ysClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirm];
    
    dict = @{
             @"name" : @"大班课500",
             
             };
    
    // 将字典转为User模型
    
    dict3 = @{
              @"name" : @"小班课500",
              
              
              };
    dict1 = @{
              @"name" : @"中班课300",
              
              };
    dict4= @{
             @"name" : @"中班课300",
             
             };
    dict5 = @{
              @"name" : @"中班课300",
              
              };
    dict6 = @{
              @"name" : @"中班课300",
              
              };
    
    arry=[NSMutableArray arrayWithObjects:dict,dict1,dict3, nil];
    // Do any additional setup after loading the view.
}

//tabview的数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return arry.count;
    
    
}
-(void)addItemmmClick{
    
    //帮助按钮实现
    
    
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
    courTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    
        cell = [[courTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
   
   
   
    
//    timelab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
//
//    timelab2.text= @"小班5次课250";
    
    timelab2.font=[UIFont fontWithName:@"PingFang-SC-Regular" size:15];
     pickbtn1=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-40, 12, 27, 20)];
    [pickbtn1 setImage:[UIImage imageNamed:@"椭圆 1 拷贝"] forState:UIControlStateNormal];
    [pickbtn1 setImage:[UIImage imageNamed:@"选中"] forState:UIControlStateSelected];
    [pickbtn1 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:timelab2];
    [cell addSubview:pickbtn1];
    
    cell.textLabel.text=arry[indexPath.row][@"name"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.separatorInset=UIEdgeInsetsZero;
    
    cell.layoutMargins=UIEdgeInsetsZero;
    cell.textLabel.font= [UIFont fontWithName:@"PingFang-SC-Regular" size:14];
    cell.textLabel.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1];
    
    
    
    
    NSLog(@"7777777777777%@",idarry);
    
   
        
        for (int i=0; i<idarry.count; i++) {
            
            for (int h=0; h<arry.count; h++) {
                
                if ([idarry[i]isEqual:arry[h][@"id"]]) {
                    
                    
                    NSLog(@"++++++_______%d",h);
                    
                    
                    
                    if (indexPath.row==h) {
                        
                        pickbtn1.selected=YES;
                        
                        
                        
                    }
                    
                    
                    
                }
                
                
                
            }
        }
    
    
    
    
    
    
    
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
        NSString *stringInt = arry[indexPath.row][@"id"];
        [_selectIndexs addObject:stringInt];
    NSLog(@"点击的是第%ld行按钮",indexPath.row);
        NSLog(@"++++++++%@++++++",_selectIndexs);
        
    ((UIButton *)sender).selected = YES;
    
}
else{
    
    ((UIButton *)sender).selected = NO;
    UITableViewCell *cell = (UITableViewCell *)[sender superview] ;
    // 获取cell的indexPath
    NSIndexPath *indexPath = [mytabview indexPathForCell:cell];
     NSString *stringInt = arry[indexPath.row][@"id"];
    [_selectIndexs removeObject:stringInt];
   
    
}
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)ysClick{
    
    
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
    
    params[@"courseIds"] =str;
    
    
    
    
    
    
    
    [manager POST:@"http://192.168.1.107:9191/coach/course/course" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        
        
        confirm.backgroundColor=[UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
    
}



-(void)loadData
{
    //需要展示的数据以数组的形式保存
    
    
    NSString *str =@"http://192.168.1.107:9191/coach/course/to/course";
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
          
          arry=responseObject[@"data"][@"courses"];
          idarry=responseObject[@"data"][@"courseIds"];
          
          NSLog(@"+++++%@",idarry);
          
         
          
          [mytabview reloadData];
          
       
          //
      }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"==========%@",error);
         }];
    
    
    
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
