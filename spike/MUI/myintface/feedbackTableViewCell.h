//
//  feedbackTableViewCell.h
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mydata.h"
@interface feedbackTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *onelab;
@property (weak, nonatomic) IBOutlet UILabel *twolab;

@property (strong ,nonatomic)  mydata * data;

@end
