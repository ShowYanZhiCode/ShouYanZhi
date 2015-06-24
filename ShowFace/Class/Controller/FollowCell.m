//
//  FollowCell.m
//  ShowFace
//
//  Created by 派喔得 on 15/6/18.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "FollowCell.h"

@implementation FollowCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setIndex:(NSInteger)index
{
    
    
    if (self.label) {
        [self.label removeFromSuperview];
        [self.button removeFromSuperview];
        [self.headImgView removeFromSuperview];
    }
    self.label = [[UILabel alloc]init];
    self.label.frame = CGRectMake(60, 15, 200, 30);
    self.label.text = [NSString stringWithFormat:@"   韩梅梅%lu号",index];
    self.label.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.label];
    
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
    self.headImgView .autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.headImgView .image = [UIImage imageNamed:@"1.jpg"];
    self.headImgView .layer.masksToBounds = YES;
    self.headImgView .layer.cornerRadius = 20.0f;
    self.headImgView .layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.headImgView .layer.shouldRasterize = YES;
    self.headImgView .clipsToBounds = YES;
    
    [self.contentView addSubview:self.headImgView ];
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame =CGRectMake(SCREEN_WIDTH-80, 15, 60, 30);
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 15.0;
    
    [self.button setTitle:@" Follow " forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.button.backgroundColor = [UIColor colorWithRed:0.20f green:0.21f blue:0.23f alpha:1.00f];
    
    [self.contentView addSubview:self.button];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
