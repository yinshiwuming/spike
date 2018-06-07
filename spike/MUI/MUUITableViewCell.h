//
//  MUUITableViewCell.h
//  spike
//
//  Created by 泽联教育 on 2018/4/12.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "muuidata.h"
@interface MUUITableViewCell : UITableViewCell
@property(nonatomic,strong)muuidata*muudata;
@property (weak, nonatomic) IBOutlet UIImageView *myimage;
@property (weak, nonatomic) IBOutlet UILabel *mytitle;
@property (weak, nonatomic) IBOutlet UILabel *mytopy;
@property (weak, nonatomic) IBOutlet UILabel *mydata;
@property (weak, nonatomic) IBOutlet UILabel *mytime;

@end
