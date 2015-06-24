//
//  JigsawView.m
//  ShowFace
//
//  Created by 派喔得 on 15/6/19.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "JigsawView.h"
#import "CommonDefine.h"
#import "BrowseImage.h"
@implementation JigsawView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithPictureCellImages:(NSArray *)images
{
    self = [super init];
    if (self) {
        
   
        if (images.count==1) {
            self.imageView = [[UIImageView alloc]init];
            self.imageView .frame = CGRectMake(0, 0, SCREEN_WIDTH,120);
            self.imageView .image = [UIImage imageNamed:[images objectAtIndex:0]];
            self.imageView .contentMode = UIViewContentModeScaleAspectFill;
            self.imageView .clipsToBounds = YES;
            self.imageView .layer.borderColor = [UIColor blackColor].CGColor;
            self.imageView .layer.borderWidth = 3.0f;
            self.imageView .userInteractionEnabled = YES;
            
        
            
            UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyImage)];
        
            [self.imageView  addGestureRecognizer:tap];
            
            [self addSubview:self.imageView ];
            
        }else
        {
            self.firstImageView = [[UIImageView alloc]init];
            self.firstImageView.frame = CGRectMake(0, 0, 160,120);
            self.firstImageView.image = [UIImage imageNamed:[images objectAtIndex:0]];
            self.firstImageView.contentMode = UIViewContentModeScaleAspectFill;
            self.firstImageView.clipsToBounds = YES;
            self.firstImageView.layer.borderColor = [UIColor blackColor].CGColor;
            self.firstImageView.layer.borderWidth = 2.0f;
            self.firstImageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *fisrtTap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifyFirstImage)];
            [self.firstImageView  addGestureRecognizer:fisrtTap];
            
            [self addSubview:self.firstImageView];
            
            self.secondImageView = [[UIImageView alloc]init];
            self.secondImageView.frame = CGRectMake(160, 0, SCREEN_WIDTH-160,120);
            self.secondImageView.image = [UIImage imageNamed:[images objectAtIndex:1]];
            self.secondImageView.contentMode = UIViewContentModeScaleAspectFill;
            self.secondImageView.clipsToBounds = YES;
            self.secondImageView.layer.borderColor = [UIColor blackColor].CGColor;
            self.secondImageView.layer.borderWidth = 3.0f;
            self.secondImageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *secondTap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(magnifySecondImage)];
            [self.secondImageView  addGestureRecognizer:secondTap];
            
            [self addSubview:self.secondImageView];
        
        }
        
    }
    return self;

}
-(id)initWithActivityCellImages:(NSArray *)images
{
    self = [super init];
    if (self) {
       
        CGFloat y = 0;
        int j = 0;
        CGFloat Width = SCREEN_WIDTH-70;
        Width = Width/3;
       
        for (int i = 0; i<images.count; i++) {
            
            self.imageView = [[UIImageView alloc]init];
            self.imageView.frame = CGRectMake(Width*j, y, Width, Width);
            self.imageView.image = [UIImage imageNamed:[images objectAtIndex:i]];
//            imageView.contentMode = UIViewContentModeCenter;
            self.imageView.layer.borderColor = [UIColor blackColor].CGColor;
            self.imageView.layer.borderWidth = 0.5f;
            self.imageView.userInteractionEnabled = YES;
            
            [self addSubview:self.imageView];
          
            j++;
            if (i==2) {
                j = 0;
                y = y+Width;
            }
            if (i==5) {
                j = 0;
                y = y+Width;
            }
            
        }
    }
    return self;
}
-(void)magnifyImage
{
    
    [BrowseImage showImage:self.imageView];
  
}
-(void)magnifySecondImage
{
    [BrowseImage showImage:self.secondImageView];

}
-(void)magnifyFirstImage
{
    [BrowseImage showImage:self.firstImageView];

}

@end
