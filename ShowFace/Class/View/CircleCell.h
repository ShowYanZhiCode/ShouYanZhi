//
//  CircleCell.h
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/24.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleCell : UITableViewCell

@property(nonatomic,assign)IBOutlet UIImageView *backgroundImage;
@property(nonatomic,assign)IBOutlet UILabel *nameLable;
@property(nonatomic,assign)IBOutlet UILabel *ageLable;
@property(nonatomic,assign)IBOutlet UILabel *constellationLable;
@property(nonatomic,assign)IBOutlet UILabel *hobbiesLable;
@property(nonatomic,assign)IBOutlet UIButton *knowBtn;

@end
