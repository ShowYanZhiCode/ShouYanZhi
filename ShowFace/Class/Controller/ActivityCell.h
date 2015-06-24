//
//  ActivityCell.h
//  ShowFace
//
//  Created by 派喔得 on 15/6/18.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JigsawView.h"
@interface ActivityCell : UITableViewCell
@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UILabel *createTimeLabel;

@property (nonatomic,strong) JigsawView *jigsaView;
+(CGFloat)getHeightWith:(NSArray *)images Text:(NSString *)text;

@end
