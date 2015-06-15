//
//  BaseViewController.h
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic,strong) UINavigationController *nav;
@property (nonatomic,strong) UINavigationBar *navBar;
@property (nonatomic,strong) UINavigationItem *navItem;
@property (nonatomic,strong) UIView *titleView;
@property (nonatomic,assign) double version;
@property (nonatomic,strong) UIBarButtonItem *leftBarBtnItem;
@property (nonatomic,strong) UIBarButtonItem *rightBarBtnItem;
@property (nonatomic,assign) BOOL isLoad;

-(void)addNotification;
-(void)removeNotification;
-(void)postNotification;
-(void)leftBarBtnEvent:(UIBarButtonItem*)leftBarBtn;
-(void)rightBarBtnEvent:(UIBarButtonItem*)rightBarBtn;


@end
