//
//  FollowCell.h
//  ShowFace
//
//  Created by 派喔得 on 15/6/18.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FollowCell : UITableViewCell
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UIImageView *headImgView;
@end
