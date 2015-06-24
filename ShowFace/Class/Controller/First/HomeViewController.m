//
//  HomeViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionCell.h"
#import "HomeCollectionHederView.h"
#import "PersonalHomepageViewController.h"
@interface HomeViewController (){

    UICollectionView *_nearbyCollectionView;
    UICollectionView *_friendCollectionView;
    UICollectionView *_moodCollectionView;
    UICollectionView *_wholeCollectionView;
    
    NSArray *_nearbyArr;
    NSArray *_friendArr;
    NSArray *_moodArr;
    NSArray *_wholeArr;

}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Home";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
    style:UIBarButtonItemStylePlain  target:(NavigationViewController *)self.navigationController
     action:@selector(showMenu)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"Balloon"];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    [self setSegmentView];
 
}

-(void)setSegmentView{
    
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
    self.segmentedControl.sectionTitles = @[@"附近", @"朋友", @"心情",@"所有"];
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
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH * index, 0, SCREEN_WIDTH, 200) animated:YES];
    }];
    self.segmentedControl.selectionIndicatorHeight  = 4.0f;
    [self.view addSubview:self.segmentedControl];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 114, SCREEN_WIDTH, SCREEN_HEIGHT-94-49)];
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 4, 200);
    self.scrollView.tag = 100;
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, SCREEN_WIDTH, 200) animated:NO];
    [self.view addSubview:self.scrollView];

    _nearbyArr = [[NSArray alloc]init];
    _nearbyArr = [NSMutableArray arrayWithObjects:@"类似话题",@"志同道合",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"颜值最高",@"登陆最多",nil];
    _friendArr = [[NSArray alloc]init];
    _friendArr = [NSMutableArray arrayWithObjects:@"类似话题",@"志同道合",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"颜值最高",@"登陆最多",nil];
    _moodArr = [[NSArray alloc]init];
    _moodArr = [NSMutableArray arrayWithObjects:@"类似话题",@"志同道合",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"颜值最高",@"登陆最多",nil];
    _wholeArr = [[NSArray alloc]init];
    _wholeArr = [NSMutableArray arrayWithObjects:@"类似话题",@"志同道合",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"颜值最高",@"登陆最多",nil];
    
    UICollectionViewFlowLayout *flowLayout0 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout0.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout0.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout0.minimumInteritemSpacing = 10;
    flowLayout0.minimumLineSpacing = 10;
    [flowLayout0 setHeaderReferenceSize:CGSizeMake(SCREEN_WIDTH, 60)];

    _nearbyCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT-94-49) collectionViewLayout:flowLayout0];
    _nearbyCollectionView.backgroundColor = [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    _nearbyCollectionView.userInteractionEnabled = YES;
    _nearbyCollectionView.delegate = self;
    _nearbyCollectionView.dataSource = self;
    [_nearbyCollectionView setCollectionViewLayout:flowLayout0];
    [_nearbyCollectionView registerNib:[UINib nibWithNibName:@"HomeCollectionCell_x" bundle:nil] forCellWithReuseIdentifier:@"iden"];
    [_nearbyCollectionView registerClass:[HomeCollectionHederView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"iden"];
    [self.view addSubview:_nearbyCollectionView];
    [self.scrollView addSubview:_nearbyCollectionView];
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout1.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout1.minimumInteritemSpacing = 10;
    flowLayout1.minimumLineSpacing = 10;
    _friendCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0,SCREEN_WIDTH,SCREEN_HEIGHT-94-49) collectionViewLayout:flowLayout1];
    _friendCollectionView.backgroundColor = [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    _friendCollectionView.userInteractionEnabled = YES;
    _friendCollectionView.delegate = self;
    _friendCollectionView.dataSource = self;
    [_friendCollectionView setCollectionViewLayout:flowLayout1];
    [_friendCollectionView registerNib:[UINib nibWithNibName:@"HomeCollectionCell_x" bundle:nil] forCellWithReuseIdentifier:@"iden"];
    [self.view addSubview:_friendCollectionView];
    [self.scrollView addSubview:_friendCollectionView];
    
    UICollectionViewFlowLayout *flowLayout2 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout2.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout2.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout2.minimumInteritemSpacing = 10;
    flowLayout2.minimumLineSpacing = 10;
    _moodCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 2, 0,SCREEN_WIDTH,SCREEN_HEIGHT-94-49) collectionViewLayout:flowLayout2];
    _moodCollectionView.backgroundColor = [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    _moodCollectionView.userInteractionEnabled = YES;
    _moodCollectionView.delegate = self;
    _moodCollectionView.dataSource = self;
    [_moodCollectionView setCollectionViewLayout:flowLayout2];
    [_moodCollectionView registerNib:[UINib nibWithNibName:@"HomeCollectionCell_x" bundle:nil] forCellWithReuseIdentifier:@"iden"];
    [self.view addSubview:_moodCollectionView];
    [self.scrollView addSubview:_moodCollectionView];

    UICollectionViewFlowLayout *flowLayout3 = [[UICollectionViewFlowLayout alloc] init];
    flowLayout3.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout3.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout3.minimumInteritemSpacing = 10;
    flowLayout3.minimumLineSpacing = 10;
    _wholeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 3, 0,SCREEN_WIDTH,SCREEN_HEIGHT-94-49) collectionViewLayout:flowLayout3];
    _wholeCollectionView.backgroundColor = [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    _wholeCollectionView.userInteractionEnabled = YES;
    _wholeCollectionView.delegate = self;
    _wholeCollectionView.dataSource = self;
    [_wholeCollectionView setCollectionViewLayout:flowLayout3];
    [_wholeCollectionView registerNib:[UINib nibWithNibName:@"HomeCollectionCell_x" bundle:nil] forCellWithReuseIdentifier:@"iden"];
    [self.view addSubview:_wholeCollectionView];
    [self.scrollView addSubview:_wholeCollectionView];

}

- (void)setApperanceForLabel:(UILabel *)label {
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    label.backgroundColor = color;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:21.0f];
    label.textAlignment = NSTextAlignmentCenter;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (scrollView.tag == 100) {
        
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
    }
   
    
}

#pragma---
#pragma collectionViewDelegate

//每个section中不同的行之间的行间距   行高
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 10;
}

//有多少个Section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

//cell 宽高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(170, 200);
}

// 每个分组中有多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (collectionView == _nearbyCollectionView) {
        
        return _nearbyArr.count;
        
    }else if (collectionView == _friendCollectionView){
    
        return _friendArr.count;
        
    }else if (collectionView == _friendCollectionView){
        
        return _moodArr.count;
        
    }else{
        
          return _wholeArr.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"iden";
    HomeCollectionCell *cell = nil;
    cell = (HomeCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.titleLable.text = _nearbyArr[indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
    HomeCollectionHederView *headerView = (HomeCollectionHederView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"iden" forIndexPath:indexPath];
    headerView.titleLable.text =@"头部视图";
    [_nearbyCollectionView addSubview:headerView];
    
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 50, 50)];
    [icon setImage:[UIImage imageNamed:@"avatar@2x.jpg"]];
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = 25;
    [_nearbyCollectionView addSubview:icon];
        
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(75, 10, 100, 60)];
    titleLable.text = @"Zach";
    [titleLable setTextColor:[UIColor whiteColor]];
    [_nearbyCollectionView addSubview:titleLable];
    
    UIButton *maleBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/27, 80, 30)];
    maleBtn.tag = 101;
    [maleBtn setTitle:@"男性" forState:UIControlStateNormal];
    [maleBtn addTarget:self action:@selector(maleBtnDownClick) forControlEvents:UIControlEventTouchUpInside];
    [_nearbyCollectionView addSubview:maleBtn];
        
    UIButton *femaleBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/1.3,SCREEN_HEIGHT/27, 80, 30)];
    femaleBtn.tag = 102;
    femaleBtn.backgroundColor = [UIColor colorWithRed:147.0/255.0 green:112.0/255.0 blue:219.0/255.0 alpha:1];
    [femaleBtn.layer setMasksToBounds:YES];
    [femaleBtn.layer setCornerRadius:15];
    [femaleBtn setTitle:@"女性" forState:UIControlStateNormal];
    [femaleBtn addTarget:self action:@selector(femaleBtnDownClick) forControlEvents:UIControlEventTouchUpInside];
    [_nearbyCollectionView addSubview:femaleBtn];
    reusableview = headerView;
        
    }
    
    return reusableview;
  
}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PersonalHomepageViewController *phvc = [[PersonalHomepageViewController alloc]init];
    [self.navigationController pushViewController:phvc animated:YES];
    
}
-(void)maleBtnDownClick{

    UIButton *myButton1 = (UIButton *)[self.view viewWithTag:101];
    [myButton1.layer setMasksToBounds:YES];
    [myButton1.layer setCornerRadius:15];
    myButton1.backgroundColor = [UIColor colorWithRed:147.0/255.0 green:112.0/255.0 blue:219.0/255.0 alpha:1];
    
    UIButton *myButton2 = (UIButton *)[self.view viewWithTag:102];
    myButton2.backgroundColor = [UIColor clearColor];
    
}

-(void)femaleBtnDownClick{
 
    UIButton *myButton1 = (UIButton *)[self.view viewWithTag:101];
    myButton1.backgroundColor = [UIColor clearColor];
    
    UIButton *myButton2 = (UIButton *)[self.view viewWithTag:102];
    [myButton2.layer setMasksToBounds:YES];
    [myButton2.layer setCornerRadius:15];
    myButton2.backgroundColor = [UIColor colorWithRed:147.0/255.0 green:112.0/255.0 blue:219.0/255.0 alpha:1];
    
}

@end
