//
//  MyFollowCell.m
//  ShowFace
//
//  Created by 派喔得 on 15/6/24.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "MyFollowCell.h"

@implementation MyFollowCell
-(void)setUsers:(NSArray *)users
{
    if (self.userNameLabel) {
        [self.userNameLabel removeFromSuperview];
        [self.userImgView removeFromSuperview];
    }
    
    self.userNameLabel = [[UILabel alloc]init];
    self.userNameLabel.frame = CGRectMake(60, 15, 200, 30);
    self.userNameLabel.text = [NSString stringWithFormat:@"     Bill S Kenney"];
    self.userNameLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.userNameLabel];
    
    self.userImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
    self.userImgView .autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.userImgView .image = [UIImage imageNamed:[users objectAtIndex:0]];
    self.userImgView .layer.masksToBounds = YES;
    self.userImgView .layer.cornerRadius = 20.0f;
    self.userImgView .layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.userImgView .layer.shouldRasterize = YES;
    self.userImgView .clipsToBounds = YES;
    
    [self.contentView addSubview:self.userImgView ];

}
@end
