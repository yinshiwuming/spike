//
//  opinionViewController.m
//  spike
//
//  Created by 泽联教育 on 2018/4/13.
//  Copyright © 2018年 泽联教育. All rights reserved.
//

#import "opinionViewController.h"
#import "CCTextView.h"
#define HEIGHT    [[UIScreen mainScreen] bounds].size.height
#define WIDTH     [[UIScreen mainScreen] bounds].size.width
@interface opinionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,JJPhotoDelegate,XWImagePickerSheetDelegate>{
    NSString *pushImageName;
    //添加图片提示
    UILabel *addImageStrLabel;
}

@property (nonatomic, strong) XWImagePickerSheet *imgPickerActionSheet;

//@property (nonatomic, retain) UITextView *textView;
@property (nonatomic,strong) CCTextView *ccTextView;
@end

@implementation opinionViewController
-(instancetype)init{
    self = [super init];
    if (self) {
        if (!_showActionSheetViewController) {
            _showActionSheetViewController = self;
        }
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.navigationItem setTitle:@"意见反馈"];
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.view addGestureRecognizer:tapGesturRecognizer];
//    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(2, 76, 375, 111)];
//
//    //初始化大小并自动释放
//
//    self.textView.textColor = [UIColor lightGrayColor];//设置textview里面的字体颜色
//
//    self.textView.font = [UIFont fontWithName:@"Arial" size:11.0];//设置字体名字和字体大小
//
//    self.textView.delegate = self;//设置它的委托方法
//
//    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
//
//
//
//    self.textView.text = @"编写10个字以上内容最多不超过200字";//设置它显示的内容
//
//    self.textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
//
//    self.textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
//
//    self.textView.scrollEnabled = YES;//是否可以拖动
//
//    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
//
//
//    [self.view addSubview: self.textView];
    
    self.ccTextView = [[CCTextView alloc]initWithFrame:CGRectMake(0, 76, WIDTH, HEIGHT*0.166)];
    self.ccTextView.layer.borderWidth = .2;
    self.ccTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.ccTextView.layer.cornerRadius = 2;
    self.ccTextView.placeholder = @"请输入10字以上小于200字";
    [self.ccTextView setPlaceholderOpacity:.5];
    [self.ccTextView setPlaceholderColor:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]];
    [self.ccTextView setPlaceholderFont:[UIFont boldSystemFontOfSize:15]];
    [self.ccTextView setFont:[UIFont systemFontOfSize:15]];
    self.ccTextView.shouldAutoUpdateHeight = YES;
    [self.view addSubview:self.ccTextView];
    
    [self.ccTextView addTextViewBeginEvent:^(CCTextView *textView) {
        NSLog(@"CCTextView开始编辑");
    }];
    
    [self.ccTextView addTextViewEndEvent:^(CCTextView *textView) {
        NSLog(@"CCTextView结束编辑");
    }];
    
    [self.ccTextView TextViewDidUpdateHeightEvent:^(CCTextView *textView) {
        NSLog(@"CCTextView更新高度了%f",textView.frame.size.height);
    }];
    [self.ccTextView addMaxTextLengthWithMaxLength:20 andEvent:^(CCTextView *textView) {
        
    }];
    
    UIView *vie=[[UIView alloc]initWithFrame:CGRectMake(0, 190, WIDTH, HEIGHT*0.15)];
    vie.backgroundColor=[UIColor whiteColor];
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(13, 10, 64, 53)];
    [btn setImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
    
    [self.view addSubview:vie];
    [vie addSubview:btn];
    UILabel *titlab=[[UILabel alloc]initWithFrame:CGRectMake(13, 76, 375, 10)];
    titlab.text = @"请上传图片，有助于客服审核 ";
    titlab.backgroundColor=[UIColor redColor];
    
    titlab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
    titlab.textColor = [UIColor colorWithRed:153/255 green:153/255 blue:153/255 alpha:1];
    [self.pickerCollectionView addSubview:titlab];
    UILabel *toplab=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH*0.68, 13, 84, 10)];
    toplab.text = @"上传凭证 最多3张 ";
    toplab.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:10];
    toplab.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.pickerCollectionView addSubview:toplab];
    UIView * ke=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT*0.57, WIDTH, 40)];
    ke.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:ke];
    UITextField*textField=[[UITextField alloc]initWithFrame:CGRectMake(6, 0, WIDTH-6, 40)];
    //textField.borderStyle = UITextBorderStyleRoundedRect;//圆角
    textField.placeholder = @"请输入手机号";
    textField.keyboardType = UIKeyboardTypeNumberPad;
    UIButton *btnlik=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WIDTH, 49)];
    btnlik.backgroundColor=[UIColor colorWithRed:255/255.0 green:214/255.0 blue:0/255.0 alpha:1];
    [btnlik setTitle:@"确认" forState:UIControlStateNormal];
    [btnlik setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    [ke addSubview:textField];
    [self.view addSubview:btnlik];
    
    _showActionSheetViewController = self;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.pickerCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 190, [UIScreen mainScreen].bounds.size.width, (((float)[UIScreen mainScreen].bounds.size.width-64.0) /4.0 +20.0)* ((int)(_arrSelected.count)/4 +1)+20.0) collectionViewLayout:layout];
    [self.view addSubview:self.pickerCollectionView];
    
    self.pickerCollectionView.delegate=self;
    self.pickerCollectionView.dataSource=self;
    self.pickerCollectionView.backgroundColor = [UIColor whiteColor];
    
    if(_imageArray.count == 0)
    {
        _imageArray = [NSMutableArray array];
    }
    if(_bigImageArray.count == 0)
    {
        _bigImageArray = [NSMutableArray array];
    }
    pushImageName = @"plus.png";
    
    _pickerCollectionView.scrollEnabled = NO;
    
    //添加图片提示
    addImageStrLabel = [[UILabel alloc]initWithFrame:CGRectMake(13, HEIGHT*0.148, WIDTH, 10)];
    addImageStrLabel.text = @"请上传图片，有助于客服审核 ";
    addImageStrLabel.font=[UIFont systemFontOfSize:10];
    addImageStrLabel.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    [self.pickerCollectionView addSubview:addImageStrLabel];
    
    //[self.pickerCollectionView addSubview:titlab];
    [self.pickerCollectionView addSubview:toplab];
    
    // Do any additional setup after loading the view.
}
//- (void)textViewDidChange:(UITextView *)textView
//{
//    if (textView ==_textView) {
//        if (textView.text.length > 200) {
//            textView.text = [textView.text substringToIndex:20];
//        }
//    }
//}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageArray.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Register nib file for the cell
    UINib *nib = [UINib nibWithNibName:@"XWPhotoCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"XWPhotoCell"];
    // Set up the reuse identifier
    XWPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"XWPhotoCell" forIndexPath:indexPath];
    
    if (indexPath.row == _imageArray.count) {
        [cell.profilePhoto setImage:[UIImage imageNamed:pushImageName]];
        cell.closeButton.hidden = YES;
        
        //没有任何图片
        if (_imageArray.count == 0) {
            addImageStrLabel.hidden = NO;
        }
        else{
            addImageStrLabel.hidden = YES;
        }
    }
    else{
        [cell.profilePhoto setImage:_imageArray[indexPath.item]];
        cell.closeButton.hidden = NO;
    }
    [cell setBigImgViewWithImage:nil];
    cell.profilePhoto.tag = [indexPath item];
    
    //添加图片cell点击事件
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapProfileImage:)];
    singleTap.numberOfTapsRequired = 1;
    cell.profilePhoto .userInteractionEnabled = YES;
    [cell.profilePhoto  addGestureRecognizer:singleTap];
    cell.closeButton.tag = [indexPath item];
    [cell.closeButton addTarget:self action:@selector(deletePhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
#pragma mark <UICollectionViewDelegate>
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-64) /4 ,([UIScreen mainScreen].bounds.size.width-64) /4);
}

//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 8, 20, 8);
}

#pragma mark - 图片cell点击事件
//点击图片看大图
- (void) tapProfileImage:(UITapGestureRecognizer *)gestureRecognizer{
    [self.view endEditing:YES];
    
    UIImageView *tableGridImage = (UIImageView*)gestureRecognizer.view;
    NSInteger index = tableGridImage.tag;
    
    if (index == (_imageArray.count)) {
        [self.view endEditing:YES];
        //添加新图片
        [self addNewImg];
    }
    else{
        //点击放大查看
        XWPhotoCell *cell = (XWPhotoCell*)[_pickerCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        if (!cell.BigImgView || !cell.BigImgView.image) {
            
            [cell setBigImgViewWithImage:[self getBigIamgeWithALAsset:_arrSelected[index]]];
        }
        
        JJPhotoManeger *mg = [JJPhotoManeger maneger];
        mg.delegate = self;
        [mg showLocalPhotoViewer:@[cell.BigImgView] selecImageindex:0];
    }
}
- (UIImage*)getBigIamgeWithALAsset:(ALAsset*)set{
    //压缩
    // 需传入方向和缩放比例，否则方向和尺寸都不对
    UIImage *img = [UIImage imageWithCGImage:set.defaultRepresentation.fullResolutionImage
                                       scale:set.defaultRepresentation.scale
                                 orientation:(UIImageOrientation)set.defaultRepresentation.orientation];
    NSData *imageData = UIImageJPEGRepresentation(img, 0.5);
    [_bigImgDataArray addObject:imageData];
    
    return [UIImage imageWithData:imageData];
}
#pragma mark - 选择图片
- (void)addNewImg{
    if (!_imgPickerActionSheet) {
        _imgPickerActionSheet = [[XWImagePickerSheet alloc] init];
        _imgPickerActionSheet.delegate = self;
    }
    if (_arrSelected) {
        _imgPickerActionSheet.arrSelected = _arrSelected;
    }
    _imgPickerActionSheet.maxCount = _maxCount;
    [_imgPickerActionSheet showImgPickerActionSheetInView:_showActionSheetViewController];
}

#pragma mark - 删除照片
- (void)deletePhoto:(UIButton *)sender{
    
    [_imageArray removeObjectAtIndex:sender.tag];
    [_arrSelected removeObjectAtIndex:sender.tag];
    
    
    [self.pickerCollectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:sender.tag inSection:0]]];
    
    for (NSInteger item = sender.tag; item <= _imageArray.count; item++) {
        XWPhotoCell *cell = (XWPhotoCell*)[self.pickerCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0]];
        cell.closeButton.tag--;
        cell.profilePhoto.tag--;
    }
    
}

/**
 *  相册完成选择得到图片
 */
-(void)getSelectImageWithALAssetArray:(NSArray *)ALAssetArray thumbnailImageArray:(NSArray *)thumbnailImgArray{
    //（ALAsset）类型 Array
    _arrSelected = [NSMutableArray arrayWithArray:ALAssetArray];
    //正方形缩略图 Array
    _imageArray = [NSMutableArray arrayWithArray:thumbnailImgArray] ;
    
    [self.pickerCollectionView reloadData];
}

#pragma mark - 防止奔溃处理
-(void)photoViwerWilldealloc:(NSInteger)selecedImageViewIndex
{
    NSLog(@"最后一张观看的图片的index是:%zd",selecedImageViewIndex);
}

- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}
//获得大图
- (NSArray*)getBigImageArrayWithALAssetArray:(NSArray*)ALAssetArray{
    _bigImgDataArray = [NSMutableArray array];
    NSMutableArray *bigImgArr = [NSMutableArray array];
    for (ALAsset *set in ALAssetArray) {
        [bigImgArr addObject:[self getBigIamgeWithALAsset:set]];
    }
    _bigImageArray = bigImgArr;
    return _bigImgDataArray;
}
#pragma mark - 获得选中图片各个尺寸
- (NSArray*)getALAssetArray{
    return _arrSelected;
}

- (NSArray*)getBigImageArray{
    if (_bigImageArray.count>0) {
        return _bigImageArray;
    }
    
    return [self getBigImageArrayWithALAssetArray:_arrSelected];
}

- (NSArray*)getSmallImageArray{
    return _imageArray;
}

- (CGRect)getPickerViewFrame{
    return self.pickerCollectionView.frame;
}
-(void)tapAction:(id)tap

{
    
    [self.view endEditing:YES];
    
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
