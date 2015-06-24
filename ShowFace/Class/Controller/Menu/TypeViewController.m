//
//  TypeViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/18.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "TypeViewController.h"
#import "TypeCollectionCell.h"
@interface TypeViewController (){

    UICollectionView *_collectionView;
    NSMutableArray *_collectionArr;

}

@end

@implementation TypeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
    [self typePageUI];
    
}

-(void)typePageUI{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,64)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 45, 30)];
    [btn addTarget:self action:@selector(btnDownClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    [view addSubview:btn];

    _collectionArr = [[NSMutableArray alloc]init];
    _collectionArr = [NSMutableArray arrayWithObjects:@"类似话题",@"志同道合",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"颜值最高",@"登陆最多",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"类似话题",@"志同道合",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"颜值最高",@"登陆最多",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"类似话题",@"志同道合",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"颜值最高",@"登陆最多",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"类似话题",@"志同道合",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",@"颜值最高",@"登陆最多",@"离你最近",@"点赞最多",@"转发最多",@"评论最多",nil];
    // 设置布局方式
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置cell大小
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64,SCREEN_WIDTH,SCREEN_HEIGHT-44) collectionViewLayout:flowLayout];
    _collectionView.backgroundColor = [UIColor colorWithRed:28/255.0 green:28/255.0 blue:28/255.0 alpha:1];
    _collectionView.userInteractionEnabled = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView setCollectionViewLayout:flowLayout];
    [_collectionView registerNib:[UINib nibWithNibName:@"TypeCollectionCell_x" bundle:nil] forCellWithReuseIdentifier:@"iden"];
    [self.view addSubview:_collectionView];

}

-(void)btnDownClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma---
#pragma collectionViewDelegate

//每个section中不同的行之间的行间距   行高
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 20;
}

//cell 宽高
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(100, 30);
}

// 每个分组中有多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 48;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"iden";
    TypeCollectionCell *cell = nil;
    cell = (TypeCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.titleLable.text = _collectionArr[indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    

}

@end
