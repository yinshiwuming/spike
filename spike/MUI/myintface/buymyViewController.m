//
//  buymyViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/19.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "buymyViewController.h"

#define PIC_WIDTH 74
// 高度(自定义)
#define PIC_HEIGHT 62
// 列数(自定义)
#define COL_COUNT 3
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface buymyViewController (){
    
    NSMutableArray*myarry;
    
    
}

@end

@implementation buymyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addPictures];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}- (void)addPictures {
    
    // 在for循环中添加
    // pictures.count中的pictures是一个图片数组，代表着要添加多少个图片
    for (int i = 0; i < myarry.count; i++) {
        //创建图片
       
        
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
        
        btn.backgroundColor=[UIColor yellowColor];
        
        
        [self.view  addSubview:btn];
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
