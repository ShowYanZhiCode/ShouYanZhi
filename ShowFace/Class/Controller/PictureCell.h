//
//  PictureCell.h
//  ShowFace
//
//  Created by 派喔得 on 15/6/24.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JigsawView.h"
@interface PictureCell : UITableViewCell
@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) JigsawView *jigsawView;
@end
