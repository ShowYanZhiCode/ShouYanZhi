//
//  MyHomepageViewController.m
//  ShowFace
//
//  Created by 派喔得 on 15/6/23.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "MyHomepageViewController.h"
#import "HMSegmentedControl.h"
#import "MyFollowCell.h"
#import "MyPictureCell.h"
@interface MyHomepageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) UIView *segmentView;
@property (nonatomic, strong) UICollectionView *colletionView;
@end

@implementation MyHomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:self.titleView.bounds];
    label.text = @"我的主页";
    label.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:label];
    [self setHeadView];
    
    
}
-(void)setHeadView
{
    self.segmentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,50)];

    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 50)];
    self.segmentedControl.sectionTitles = @[@"动态图片（231）", @"关注（2313）", @"粉丝（121）"];
    
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.39f green:0.43f blue:0.47f alpha:1.00f]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:0.41f green:0.35f blue:0.59f alpha:1.00f];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 1;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        weakSelf.colletionView.tag = index;
        [weakSelf.colletionView reloadData];
      
    }];
    self.segmentedControl.selectionIndicatorHeight  = 4.0f;
    
    
    
    [self.segmentView addSubview:self.segmentedControl];
 
    [self setCollectionView];

}
-(void)setCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 50);
    self.colletionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT+20) collectionViewLayout:flowLayout];
    self.colletionView.tag = 0;
    self.colletionView.dataSource = self;
    self.colletionView.delegate = self;

    [self.view addSubview:self.colletionView];
    
    [self.colletionView registerClass:[MyPictureCell class] forCellWithReuseIdentifier:@"MyPicture Cell"];
    [self.colletionView registerClass:[MyFollowCell class] forCellWithReuseIdentifier:@"MyFollow Cell"];
    [self.colletionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *PictureCellID = @"MyPicture Cell";
     static NSString *FollowCellID = @"MyFollow Cell";
    if (collectionView.tag == 0) {
        
     MyPictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PictureCellID forIndexPath:indexPath];
     [cell sizeToFit];
    if (!cell) {
     
    }
    cell.images = [[NSArray alloc]initWithObjects:@"2.jpg", nil];
    return cell;
    }else
    {
        
        MyFollowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FollowCellID forIndexPath:indexPath];
        if (!cell) {
            
        }
        if (collectionView.tag == 1) {
            cell.users = [[NSArray alloc]initWithObjects:@"1.jpg", nil];
        }else
        {
        
           cell.users = [[NSArray alloc]initWithObjects:@"2.jpg", nil];
        
        }
        
        return cell;
    }

}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headrView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
    [headrView addSubview:self.segmentView];
    return headrView;
    
}
//定义每个UICollectionView 的大小（返回CGSize：宽度和高度）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView.tag == 0) {
        return CGSizeMake((SCREEN_WIDTH-20)/2, 250);
    }else
    {
        return CGSizeMake(SCREEN_WIDTH-20, 60);
    }
    
}
//定义每个UICollectionView 的间距（返回UIEdgeInsets：上、左、下、右）
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}
//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 0;


}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"index  %ld",indexPath.row);

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
