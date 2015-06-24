//
//  MyPictureCell.h
//  ShowFace
//
//  Created by 派喔得 on 15/6/24.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPictureCell : UICollectionViewCell
@property (nonatomic ,strong) NSArray *images;
@property (nonatomic ,strong) UIImageView *imgView;
@property (nonatomic ,strong) UILabel *nameLabel;
@property (nonatomic ,strong) UIImageView *headImgView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *likeLabel;
@property (nonatomic ,strong) UILabel *commentLabel;

@end
