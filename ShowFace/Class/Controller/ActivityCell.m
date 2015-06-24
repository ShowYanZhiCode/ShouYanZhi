//
//  ActivityCell.m
//  ShowFace
//
//  Created by 派喔得 on 15/6/18.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "ActivityCell.h"

@implementation ActivityCell

- (void)awakeFromNib {
    // Initialization code
}
+(CGFloat)getHeightWith:(NSArray *)images Text:(NSString *)text
{

    CGRect rect=[text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-70,INT16_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14]} context:nil];

    CGFloat height  = SCREEN_WIDTH-70;
    height = height/3;
    CGFloat Height = height;
    if (images.count > 3) {
       Height =Height+height;
    }
    if (images.count > 6) {
        Height = Height+height ;
    }
    return rect.size.height+Height+50;


}
-(void)setImages:(NSArray *)images
{
    if (self.label) {
        [self.label removeFromSuperview];
        [self.createTimeLabel removeFromSuperview];
        [self.jigsaView removeFromSuperview];
    }
   
    self.label = [[UILabel alloc]init];
    self.label.text = [NSString stringWithFormat:@"公元前278年  屈原用了四倍杠杆 买入楚国股票  结果4天3天大跌  他非常绝望 愿赌服输 就投江而去  人们为了警醒后人  就用 绿色的粽叶包红色的猪肉 再用绳子扎牢 以此表达 阴包阳  被套牢的意思"];
    if (images.count == 6) {
       self.label.text = [NSString stringWithFormat:@"无论你考了多少分 能不能去你想去的学校 都不用担心 你能去的地方 一定会带给你你预想不到的惊喜 你会遇见一些人 觉得相见恨晚 或者遇到一个人觉得在哪里值得 这是命 遇见你该遇见的 接受你所不能改变的其实不错 中考高考的迷人之处 不是如愿以偿 而是阴差阳错"];
    }
    self.label.numberOfLines = 0;
    self.label.textColor = [UIColor whiteColor];
    self.label.font = [UIFont systemFontOfSize:14];
    CGSize labelSize=[self.label.text sizeWithFont:self.label.font constrainedToSize:CGSizeMake(SCREEN_WIDTH-70, INT16_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    self.label.frame = CGRectMake(50, 10, SCREEN_WIDTH-70, labelSize.height);
    [self.contentView addSubview:self.label];
    
    self.createTimeLabel = [[UILabel alloc]init];
    self.createTimeLabel.frame = CGRectMake(50, labelSize.height+10, 100, 30);
    self.createTimeLabel.text = [NSString stringWithFormat:@"20 Sept 2012"];
    self.createTimeLabel.textColor = [UIColor lightGrayColor];
    self.createTimeLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:self.createTimeLabel];
    
    CGFloat height  = SCREEN_WIDTH-70;
    height = height/3;
    CGFloat Height = height;
    if (images.count > 3) {
        Height =Height+height;
    }
    if (images.count > 6) {
        Height = Height+height ;
    }

    self.jigsaView = [[JigsawView alloc]initWithActivityCellImages:images];
    self.jigsaView.frame = CGRectMake(50, labelSize.height+10+30, SCREEN_WIDTH-70, Height);
    
    [self.contentView addSubview:self.jigsaView];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
