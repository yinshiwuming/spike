//
//  PersonalViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "PersonalViewController.h"
#import "nicknameViewController.h"
#import "WPhotoViewController.h"
#import "AFNetworking.h"
@interface PersonalViewController (){
    
    UITableView*mytabview;
    UIImageView *imageView;
    NSMutableArray *_photosArr;
    UIButton *submitbtn;
    NSString*nicheng;
    NSString *sex;
    UIImage* image;
    UILabel *textlab;
    NSString *sextg;
    
    
}

@end

@implementation PersonalViewController


-(void)viewWillAppear:(BOOL)animated{
    
    [self loadNewData];
    [mytabview reloadData];
    
    
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewData];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.navigationItem setTitle:@"个人信息"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];

    [self.navigationController.navigationBar setTitleTextAttributes:

  @{NSFontAttributeName:[UIFont systemFontOfSize:15],

    NSForegroundColorAttributeName:[UIColor blackColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    mytabview = [[UITableView alloc] initWithFrame:CGRectMake(0,HEIGHT*0.115 , WIDTH,HEIGHT*0.4) style: UITableViewStylePlain ];
    // 设置tableView的数据源
    mytabview.dataSource = self;
    // 设置tableView的委托
    mytabview.delegate = self;
    // 设置tableView的背景图
    mytabview.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"47994"]];
    mytabview.rowHeight = 54;
    mytabview.scrollEnabled =NO;
    mytabview.backgroundColor=[UIColor groupTableViewBackgroundColor];
     self.automaticallyAdjustsScrollViewInsets = NO;
    //这里设置顶部间距
    CGRect frame=CGRectMake(0, 0, 0, 4);
    mytabview.tableHeaderView=[[UIView alloc]initWithFrame:frame];
   mytabview.separatorInset=UIEdgeInsetsZero;
    
    mytabview.layoutMargins=UIEdgeInsetsZero;
    [self.view addSubview:mytabview];
//    submitbtn=[[UIButton alloc]initWithFrame:CGRectMake(44, HEIGHT-60, WIDTH-88, 40)];
//    [submitbtn setTitle:@"提交" forState:UIControlStateNormal ];
//    submitbtn.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1]; 
//    [submitbtn setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
//    [self.view addSubview:submitbtn];
    
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // 设置每个section的row数量(都是从0下标开始)
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier  = @"cell";
    static NSString * mycellIdentifier  = @"mycell";
    // 从重用队列中取出cell对象
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UITableViewCell * mycell = [tableView dequeueReusableCellWithIdentifier:mycellIdentifier];
    // 如果没有,则创建(解释:一般刚进入界面的时候,是不需要重用的,当时显示的是能够映入界面的足够的cell,只有拖动的时候,才需要)
    
    cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
   
   mycell=[[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:mycellIdentifier];
    
    
    //    timelab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH/2, 12)];
    //
    //    timelab2.text= @"小班5次课250";
    
    
    if (indexPath.row==0) {
        cell.textLabel.text=@"头像";
        //这里添加cell的头像
        imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(WIDTH-74,10,38,38);
        if (image) {
            imageView.image=image;
        }
       
        imageView.layer.cornerRadius=imageView.frame.size.width/2;//裁成圆角
        imageView.layer.masksToBounds=YES;//隐藏裁剪掉的部分
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addButClick)];
        [imageView addGestureRecognizer:tapGesture];
        imageView.userInteractionEnabled = YES;
        [cell addSubview:imageView];
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
        
    }
    if (indexPath.row==1) {
        cell.textLabel.text=@"昵称";
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        UILabel *textlab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.2, 16, WIDTH*0.7, 14)];
        if (nicheng) {
            textlab.text=nicheng;
        }
       
        textlab.font = [UIFont systemFontOfSize:14];
        textlab.textAlignment=NSTextAlignmentRight;
        textlab.textColor=[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [cell addSubview:textlab];
        
    }
    
    if (indexPath.row==2) {
        cell.textLabel.text=@"性别";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        UILabel *textlab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.2, 16, WIDTH*0.7, 14)];
        textlab.text=sex;
        textlab.font = [UIFont systemFontOfSize:14];
        textlab.textAlignment=NSTextAlignmentRight;
        textlab.textColor=[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [cell addSubview:textlab];
    }
    
    if (indexPath.row==3) {
        cell.textLabel.text=@"称谓";
        
       textlab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.8, 16, HEIGHT*0.266, 14)];
        textlab.text=@"滑雪专家";
          textlab.font = [UIFont systemFontOfSize:14];
        textlab.textColor=[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        [cell addSubview:textlab];
        cell.accessoryType=UITableViewCellAccessoryNone;
        
    }
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.separatorInset = UIEdgeInsetsZero;
    
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
   
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==0) {
        
        
    }
    if (indexPath.row==1) {
        nicknameViewController*vc=[[nicknameViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row==2) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                                       message:@"性别"
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 NSLog(@"action = %@", action);
                                                                 
                                                             }];
        UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDestructive
                                                             handler:^(UIAlertAction * action) {
                                                                 //响应事件
                                                                 NSLog(@"action = %@", action);
                                                                 sex=@"男";
                                                                 sextg=@"2";
                                                                 [self btn];
                                                                 [mytabview reloadData];
                                                             }];
        UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action) {
                                                               //响应事件
                                                               NSLog(@"action = %@", action);
                                                               sex=@"女";
                                                               sextg=@"1";
                                                                [self btn];
                                                               [mytabview reloadData];
                                                           }];
        [alert addAction:saveAction];
        [alert addAction:cancelAction];
        [alert addAction:deleteAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if (indexPath.row==3) {
       
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addButClick
{
    WPhotoViewController *WphotoVC = [[WPhotoViewController alloc] init];
    //选择图片的最大数
    WphotoVC.selectPhotoOfMax = 1;
    [WphotoVC setSelectPhotosBack:^(NSMutableArray *phostsArr) {
        _photosArr = phostsArr;
        NSLog(@"++++++%@++++",[[_photosArr objectAtIndex:0] objectForKey:@"image"]);
        
        image=[[_photosArr objectAtIndex:0] objectForKey:@"image"];
        [self image];
        
        
        
    }];
    [self presentViewController:WphotoVC animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */-(void)loadNewData{
     //  NSUserDefaults* user=[NSUserDefaults  standardUserDefaults];
     //    NSString* xieyi=[user objectForKey:@"server_xieyi"];//协议
     //    NSString* tbm_ip=[user objectForKey:@"server_ip"];//ip
     //    NSString* tbm_port=[user objectForKey:@"server_port"];//port
     //    NSString* tbm_token=[user objectForKey:@"tbm_device_token"];//token
     //    NSString* tbm_device=[user objectForKey:@"tbm_device_id"];//token
     
     //    if([xieyi isEqualToString:@"http"]){
     
     //http://192.168.1.123:9191/coach/userLogin?mobile=15011218654&pwd=123456
     NSString *str =@"http://192.168.1.126:9191/page/myhome?status=1";
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
         //  NSNumber *status_range = responseObject[@"status"];//状态
           if (responseObject[@"data"][@"picImg"]) {
               NSString*imag=responseObject[@"data"][@"picImg"];
               NSString *urlString = @"http://p70kr2ki3.bkt.clouddn.com/15236086687651801.jpg";
               
               NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:urlString]];
               image = [UIImage imageWithData:data];
               imageView.image=image;
               
               
               
           }
          // NSString*imag=responseObject[@"data"][@"picImg"];
           nicheng=responseObject[@"data"][@"nickName"];
           
           if ([responseObject[@"data"][@"sex"] intValue]==1) {
               sex=@"女";
           }
           if ([responseObject[@"data"][@"sex"] intValue]==2) {
               sex=@"男";
           }
        
           //称谓的判断
           
           if ([responseObject[@"data"][@"masterType"] intValue]==0) {
               textlab.text=@"滑雪助教";
           }
           if ([responseObject[@"data"][@"masterType"] intValue]==1) {
               textlab.text=@"滑雪专家";
           }
           
           
           
           
           //http://p70kr2ki3.bkt.clouddn.com/15236086687651801.jpg
           //这里缓存教练我的基本信息
//           NSString *urlString = @"http://p70kr2ki3.bkt.clouddn.com/15236086687651801.jpg";
//           NSData *data = [NSData dataWithContentsOfURL:[NSURL  URLWithString:urlString]];
//           image = [UIImage imageWithData:data];
//           imageView.image=image;
          
           NSLog(@"+++++++%@_________",responseObject);
           
          // NSLog(@"%@",status_range);
           
           
           
           [mytabview reloadData];
           
           
           
           
           
           
           
       }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"==========%@",error);
          }];
 }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        return 64;
    }
    return 52;
}


-(void)image{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    for (int i =0; i<1; i++) {
        [manager POST:@"http://192.168.1.126:9191/coach/img" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            //上传文件参数
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            //        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            //        NSData *imageData = UIImageJPEGRepresentation(_imageArray[0], 0);
            //        [formData appendPartWithFileData:imageData name:@"photo" fileName:fileName mimeType:@"image/png"];
            
            
            NSData *data = UIImageJPEGRepresentation(image,0.7);
            
            NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
            
            [formData appendPartWithFileData:data name:@"mf" fileName:fileName mimeType:@"image/jpg"];
            
            
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
            //打印上传进度
            CGFloat progress = 100.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount;
            NSLog(@"%.2lf%%", progress);
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            //请求成功
            NSLog(@"请求成功：%@",responseObject);
            NSString *urlstr=responseObject[@"img"];
            
            NSLog(@"++++_____%@",urlstr);
            
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            //请求失败
            NSLog(@"请求失败：%@",error);
            
        }];
        
    }
    
    
    
    
    
}

-(void)btn{
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //AFN 2.5.4
    /**
     manager.securityPolicy.allowInvalidCertificates = YES;
     **/
    //AFN 2.6.1 包括现在的3.0.4,里面它实现了代理,信任服务器
    manager.securityPolicy.validatesDomainName = NO;
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    //
    //    NSString *str = [NSString stringWithFormat:@"%@,",string];
    //    NSLog(@"yyyyyyyy%@",str);
    
    params[@"sex"] =sextg;
    
    
    
    [manager POST:@"http://192.168.1.126:9191/coach/updateUser" parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功:%@", responseObject);
        
        if (responseObject[@"status"]) {
            
            //这里吧修改的昵称
            
        
            
        }
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        
    }];
    
    
    
    
    
    
    
}







@end
