//
//  opinionViewController.h
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <AssetsLibrary/AssetsLibrary.h>
#import "XWPhotoCell.h"
#import "JJPhotoManeger.h"
#import "XWImagePickerSheet.h"
#import "MBProgressHUD.h"
@interface opinionViewController : UIViewController<UITextViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UICollectionView *pickerCollectionView;

@property (nonatomic, assign) CGFloat collectionFrameY;

//选择的图片数据
@property(nonatomic,strong) NSMutableArray *arrSelected;

//方形压缩图image 数组
@property(nonatomic,strong) NSMutableArray * imageArray;

//大图image 数组
@property(nonatomic,strong) NSMutableArray * bigImageArray;

//大图image 二进制
@property(nonatomic,strong) NSMutableArray * bigImgDataArray;

//图片选择器
@property(nonatomic,strong) UIViewController *showActionSheetViewController;


//图片总数量限制
@property(nonatomic,assign) NSInteger maxCount;



//获得collectionView 的 Frame
- (CGRect)getPickerViewFrame;

//获取选中的所有图片信息
- (NSArray*)getSmallImageArray;
- (NSArray*)getBigImageArray;
- (NSArray*)getALAssetArray;

@end
