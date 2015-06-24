//
//  MyPictureCell.m
//  ShowFace
//
//  Created by 派喔得 on 15/6/24.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "MyPictureCell.h"

@implementation MyPictureCell
-(void)setImages:(NSArray *)images
{
    if (self.imgView) {
        [self.imgView removeFromSuperview];
        [self.nameLabel removeFromSuperview];
        [self.headImgView removeFromSuperview];
        [self.titleLabel removeFromSuperview];
    }
    self.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
    self.imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"10.jpg"]];
    self.imgView.frame = CGRectMake(0, 0, self.bounds.size.width, 150);
    self.imgView.clipsToBounds = YES;
    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:self.imgView];
    
    self.nameLabel= [[UILabel alloc]init];
    self.nameLabel.frame = CGRectMake(60, 160, 200, 30);
    self.nameLabel.text = [NSString stringWithFormat:@" Leoi"];
    self.nameLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.nameLabel];
    
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 155, 40, 40)];
    self.headImgView .autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.headImgView .image = [UIImage imageNamed:[images objectAtIndex:0]];
    self.headImgView .layer.masksToBounds = YES;
    self.headImgView .layer.cornerRadius = 20.0f;
    self.headImgView .layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.headImgView .layer.shouldRasterize = YES;
    self.headImgView .clipsToBounds = YES;
    
    [self.contentView addSubview:self.headImgView ];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.frame = CGRectMake(10, 200, self.bounds.size.width-20, 30);
    self.titleLabel.text = [NSString stringWithFormat:@"Union Jack skater girl"];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.titleLabel];

}
@end
