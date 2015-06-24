//
//  PictureCell.m
//  ShowFace
//
//  Created by 派喔得 on 15/6/24.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "PictureCell.h"

@implementation PictureCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setImages:(NSArray *)images
{

    if (self.jigsawView) {
        [self.jigsawView removeFromSuperview];
    }
    
    self.jigsawView = [[JigsawView alloc]initWithPictureCellImages:images];
    self.jigsawView.frame = self.bounds;
    [self.contentView addSubview:self.jigsawView];


}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
