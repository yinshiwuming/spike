//
//  MHeadImaView.h
//  QQImagePicker
//
//  Created by mac on 2016/11/25.
//  Copyright © 2016年 com.rongniu.caifuwang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {

    headImaCheckMark = 1,
    headImaSelectBig = 2,
    headImaCheckCancel = 3
    
}headImaSelectType;

@protocol MHeadImaViewDelegate <NSObject>

- (void)selectIndex:(NSUInteger)index headImaSelectType:(headImaSelectType)type;

@end

@interface MHeadImaView : UIView

@property (nonatomic, weak) id<MHeadImaViewDelegate> delegate;
- (void)reloadDataWithArr:(NSArray *)arrData arrSelected:(NSMutableArray *)arrSelected;
@end
