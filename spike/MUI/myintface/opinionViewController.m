//
//  opinionViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "opinionViewController.h"

@interface opinionViewController ()
@property (nonatomic, retain) UITextView *textView;
@end

@implementation opinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(2, 76, 375, 111)];
    
    //初始化大小并自动释放
    
    self.textView.textColor = [UIColor lightGrayColor];//设置textview里面的字体颜色
    
    self.textView.font = [UIFont fontWithName:@"Arial" size:11.0];//设置字体名字和字体大小
    
    self.textView.delegate = self;//设置它的委托方法
    
    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    
    
    
    self.textView.text = @"编写10个字以上内容最多不超过200字";//设置它显示的内容
    
    self.textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
    
    self.textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
    
    self.textView.scrollEnabled = YES;//是否可以拖动
    
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    
    
    [self.view addSubview: self.textView];
    
    UIView *vie=[[UIView alloc]initWithFrame:CGRectMake(0, 190, 375, 100)];
    vie.backgroundColor=[UIColor whiteColor];
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(13, 10, 64, 53)];
    [btn setImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
    
    [self.view addSubview:vie];
    [vie addSubview:btn];
    UILabel *titlab=[[UILabel alloc]initWithFrame:CGRectMake(13, 76, 375, 10)];
    titlab.text = @"请上传图片，有助于客服审核 ";
    titlab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
    titlab.textColor = [UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1];
    [vie addSubview:titlab];
    UILabel *toplab=[[UILabel alloc]initWithFrame:CGRectMake(287, 13, 88, 10)];
    toplab.text = @"上传凭证 最多3张 ";
    toplab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
    toplab.textColor = [UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1];
    [vie addSubview:toplab];
    
    UITextField*textField=[[UITextField alloc]initWithFrame:CGRectMake(0, 331, 375, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;//圆角
    textField.placeholder = @"请输入手机号";
    textField.keyboardType = UIKeyboardTypeNumberPad;
    UIButton *btnlik=[[UIButton alloc]initWithFrame:CGRectMake(0, 618, 375, 49)];
    btnlik.backgroundColor=[UIColor yellowColor];
    [btnlik setTitle:@"确认" forState:UIControlStateNormal];
    [self.view addSubview:textField];
    [self.view addSubview:btnlik];
    // Do any additional setup after loading the view.
}
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView ==_textView) {
        if (textView.text.length > 200) {
            textView.text = [textView.text substringToIndex:20];
        }
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
