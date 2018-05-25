//
//  HavViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/3/28.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "HavViewController.h"
#import "HavTableViewCell.h"

#import "CZHDatePickerView.h"
#import "DatePickerHeader.h"
#import "UIViewController+XHPhoto.h"
#import "CCTextView.h"
#import "AFNetworking.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface HavViewController (){
    
    UITableView *mytabview;
    UITextField *name;
    UITextField *number;
    UIImage *myimg;
    
}
@property(nonatomic,strong)UILabel * rightdate;
@property (nonatomic,strong) CCTextView *ccTextView;
@end

@implementation HavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [[self navigationItem] setTitle:@"成为教练"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]; 
   
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT ) style:UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 44;
    //mytabview.scrollEnabled =NO;
    
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
    UIView *footv=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.5)];
   
    mytabview.tableFooterView=footv;
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(15, 20, 100, 16)];
    lab.text=@"主要经历";
    [footv addSubview:lab];
    self.ccTextView = [[CCTextView alloc]initWithFrame:CGRectMake(12, 50, WIDTH-24, 130)];
    self.ccTextView.layer.borderWidth = .2;
    self.ccTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.ccTextView.layer.cornerRadius = 2;
    self.ccTextView.placeholder = @"请输入你的主要经历";
    [self.ccTextView setPlaceholderOpacity:.5];
    [self.ccTextView setPlaceholderColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]];
    [self.ccTextView setPlaceholderFont:[UIFont boldSystemFontOfSize:15]];
    [self.ccTextView setFont:[UIFont systemFontOfSize:15]];
    self.ccTextView.shouldAutoUpdateHeight = YES;
    [footv addSubview:self.ccTextView];
    
    [self.ccTextView addTextViewBeginEvent:^(CCTextView *textView) {
        NSLog(@"CCTextView开始编辑");
    }];
    
    [self.ccTextView addTextViewEndEvent:^(CCTextView *textView) {
        NSLog(@"CCTextView结束编辑");
        
        NSLog(@"%@",textView.text);
        
        
        
        
    }];
    
    [self.ccTextView TextViewDidUpdateHeightEvent:^(CCTextView *textView) {
        NSLog(@"CCTextView更新高度了%f",textView.frame.size.height);
         NSLog(@"%@",textView.text);
    }];
    [self.ccTextView addMaxTextLengthWithMaxLength:20 andEvent:^(CCTextView *textView) {
        
    }];
    
    UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(25, 200, WIDTH-50, 44)];
    [btn setTitle:@"提交" forState: UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [btn addTarget:self action:@selector(btnpush) forControlEvents:UIControlEventTouchUpInside];
   
    [footv addSubview:btn];
    [self.view addSubview:mytabview];
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 13;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell的重用标识(
    static NSString * cellIdentifier  = @"cell";
    // 从重用队列中取出cell对象
   HavTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    if (!cell) {
        cell = [[HavTableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row==0) {
        cell.textLabel.text=@"滑雪证信息";
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
        UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.75-7, 11, 80, 14)];
        right.text=@"信息仅用于审核";
        right.font=[UIFont systemFontOfSize:11];
        [cell addSubview:right];
    }
    if (indexPath.row==1) {
        cell.textLabel.text=@"雪场选择";
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(250, 4, 80, 30)];
        right.text=@"请选择";
        right.font=[UIFont systemFontOfSize:12];
        right.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [cell addSubview:right];
    }
    if (indexPath.row==2) {
         cell.textLabel.text=@"姓名";
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];

        name=[self createTextFielfFrame:CGRectMake(250, 4, 80, 30) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        name.delegate=self;
        //name.clearButtonMode = UITextFieldViewModeWhileEditing;
               name.backgroundColor=[UIColor whiteColor];
             name.borderStyle=UITextBorderStyleRoundedRect;
            // name.textAlignment=NSTextAlignmentCenter ;
              name.enabled=YES;
       
        [name setBorderStyle:UITextBorderStyleNone];
       // name.textAlignment = UITextAlignmentRight;
        name.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:name];
        
    }
    if (indexPath.row==3) {
         cell.textLabel.text=@"照片";
        UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(250, 4, 80, 30)];
        right.text=@"请上传";
        right.font=[UIFont systemFontOfSize:12];
        right.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [cell addSubview:right];
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row==4) {
         cell.textLabel.text=@"年龄";
        name=[self createTextFielfFrame:CGRectMake(250, 4, 80, 30) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        name.delegate=self;
       // name.clearButtonMode = UITextFieldViewModeWhileEditing;
        name.backgroundColor=[UIColor whiteColor];
        name.borderStyle=UITextBorderStyleRoundedRect;
        // name.textAlignment=NSTextAlignmentCenter ;
        name.enabled=YES;
        
        [name setBorderStyle:UITextBorderStyleNone];
        // name.textAlignment = UITextAlignmentRight;
        name.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:name];
       // cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
    }
    
    if (indexPath.row==5) {
        cell.textLabel.text=@"身份证号";
        name=[self createTextFielfFrame:CGRectMake(250, 4, 80, 30) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        name.delegate=self;
        //name.clearButtonMode = UITextFieldViewModeWhileEditing;
        name.backgroundColor=[UIColor whiteColor];
        name.borderStyle=UITextBorderStyleRoundedRect;
        // name.textAlignment=NSTextAlignmentCenter ;
        name.enabled=YES;
        
        [name setBorderStyle:UITextBorderStyleNone];
        // name.textAlignment = UITextAlignmentRight;
        name.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:name];
    }
    
    if (indexPath.row==6) {
        cell.textLabel.text=@"户籍";
        name=[self createTextFielfFrame:CGRectMake(250, 4, 80, 30) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        name.delegate=self;
        //name.clearButtonMode = UITextFieldViewModeWhileEditing;
        name.backgroundColor=[UIColor whiteColor];
        name.borderStyle=UITextBorderStyleRoundedRect;
        // name.textAlignment=NSTextAlignmentCenter ;
        name.enabled=YES;
        
        [name setBorderStyle:UITextBorderStyleNone];
        // name.textAlignment = UITextAlignmentRight;
        name.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:name];
    }
    
    if (indexPath.row==7) {
        cell.textLabel.text=@"毕业院校";
        name=[self createTextFielfFrame:CGRectMake(250, 4, 80, 30) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        name.delegate=self;
        //name.clearButtonMode = UITextFieldViewModeWhileEditing;
        name.backgroundColor=[UIColor whiteColor];
        name.borderStyle=UITextBorderStyleRoundedRect;
        // name.textAlignment=NSTextAlignmentCenter ;
        name.enabled=YES;
        
        [name setBorderStyle:UITextBorderStyleNone];
        // name.textAlignment = UITextAlignmentRight;
        name.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:name];
    }
    
    if (indexPath.row==8) {
        cell.textLabel.text=@"其他体育特长";
        name=[self createTextFielfFrame:CGRectMake(250, 4, 80, 30) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        name.delegate=self;
       // name.clearButtonMode = UITextFieldViewModeWhileEditing;
        name.backgroundColor=[UIColor whiteColor];
        name.borderStyle=UITextBorderStyleRoundedRect;
        // name.textAlignment=NSTextAlignmentCenter ;
        name.enabled=YES;
        
        [name setBorderStyle:UITextBorderStyleNone];
        // name.textAlignment = UITextAlignmentRight;
        name.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:name];
    }
    
    if (indexPath.row==9) {
        cell.textLabel.text=@"雪龄";
        name=[self createTextFielfFrame:CGRectMake(250, 4, 80, 30) font:[UIFont systemFontOfSize:16] placeholder:@"请输入"];
        name.delegate=self;
       // name.clearButtonMode = UITextFieldViewModeWhileEditing;
        name.backgroundColor=[UIColor whiteColor];
        name.borderStyle=UITextBorderStyleRoundedRect;
        // name.textAlignment=NSTextAlignmentCenter ;
        name.enabled=YES;
        
        [name setBorderStyle:UITextBorderStyleNone];
        // name.textAlignment = UITextAlignmentRight;
        name.font=[UIFont fontWithName:@"Helvetica" size:12];
        [cell addSubview:name];
    }
    
    
    if (indexPath.row==10) {
        cell.textLabel.text=@"单双板";
        UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(250, 4, 80, 30)];
        right.text=@"请选择";
        right.font=[UIFont systemFontOfSize:12];
        right.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [cell addSubview:right];
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.row==11) {
        cell.textLabel.text=@"证书照片";
        UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(250, 4, 80, 30)];
        right.text=@"请上传";
        right.font=[UIFont systemFontOfSize:12];
        right.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [cell addSubview:right];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row==12) {
        cell.textLabel.text=@"比赛证书照片";
        UILabel *right=[[UILabel alloc]initWithFrame:CGRectMake(250, 4, 80, 30)];
        right.text=@"请上传";
        right.font=[UIFont systemFontOfSize:12];
        right.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [cell addSubview:right];
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
  [textField setValue:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    
    return textField;
}
-(void) yin:(UITapGestureRecognizer *)recognizer{
    
    CZHWeakSelf(self);
    [CZHDatePickerView sharePickerViewWithCurrentDate:self.rightdate.text DateBlock:^(NSString *dateString) {
        CZHStrongSelf(self);
        self.rightdate.text = dateString;
    }];


    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if (indexPath.row==3) {
        [self photoAction];
    }
    
    if (indexPath.row==11) {
        [self photoAction];
    }
    
    if (indexPath.row==12) {
         [self photoAction];
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
- (void)photoAction{
    
    //使用系统UIActionSheet来选择打开相机、相册
    //edit:照片需要裁剪:传YES,不需要裁剪传NO(默认NO)
    [self showCanEdit:YES photo:^(UIImage *photo) {
        myimg=photo;
//        [sender setBackgroundImage:photo forState:UIControlStateNormal];
        
    }];
    
}


-(void)btnpush{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //AFN 2.5.4
    /**
     manager.securityPolicy.allowInvalidCertificates = YES;
     **/
    //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"realname"] = @"哈哈哈哈或";
   // params[@"date"] = dateString;
    
    
    [manager POST:@"http://192.168.1.123:9191/coach/applyCoach" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        
        
       
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
    
    
    [self image];
    
    
}

-(void)image{
      AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager POST:@"http://192.168.1.126:9191/coach/img" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        //上传文件参数
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
         NSData *imageData = UIImageJPEGRepresentation(myimg, 0);
        [formData appendPartWithFileData:imageData name:@"photo" fileName:fileName mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //打印上传进度
        CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
        NSLog(@"%.2lf%%", progress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //请求成功
       NSLog(@"请求成功：%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //请求失败
        NSLog(@"请求失败：%@",error);
        
    }];
    
    
    
    
    
    
    
}





@end
