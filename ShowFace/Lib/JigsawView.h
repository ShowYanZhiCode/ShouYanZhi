//
//  JigsawView.h
//  ShowFace
//
//  Created by 派喔得 on 15/6/19.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JigsawView : UIView
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *firstImageView;
@property (nonatomic,strong) UIImageView *secondImageView;

@property (nonatomic,strong) NSArray *images;
-(id)initWithPictureCellImages:(NSArray *)images;
-(id)initWithActivityCellImages:(NSArray *)images;

@end
