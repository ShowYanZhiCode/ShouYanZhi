//
//  BaseViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.isLoad = false;
    
    if (self.titleView == nil) {
        self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self addNotification];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!self.isLoad) {
        [self postNotification];
        self.isLoad = true;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self removeNotification];
}

-(UINavigationController *)nav
{
    return self.navigationController;
}

-(UINavigationBar *)navBar
{
    return self.nav.navigationBar;
}


-(UINavigationItem *)navItem
{
    return self.navigationItem;
}

-(UIView *)titleView
{
    return self.navItem.titleView;
}

-(void)setTitleView:(UIView *)titleView
{
    self.navItem.titleView = titleView;
}

-(UIBarButtonItem *)leftBarBtnItem
{
    return self.navItem.leftBarButtonItem;
}

-(void)setLeftBarBtnItem:(UIBarButtonItem *)leftBarBtnItem
{
    leftBarBtnItem.target = self;
    leftBarBtnItem.action = @selector(leftBarBtnEvent:);
    self.navItem.leftBarButtonItem = leftBarBtnItem;
}

-(UIBarButtonItem *)rightBarBtnItem
{
    return self.navItem.rightBarButtonItem;
}

-(void)setRightBarBtnItem:(UIBarButtonItem *)rightBarBtnItem
{
    rightBarBtnItem.target = self;
    rightBarBtnItem.action = @selector(rightBarBtnEvent:);
    self.navItem.rightBarButtonItem = rightBarBtnItem;
}


-(void)addNotification
{
    [self removeNotification];
}

-(void)postNotification
{
    
}

-(void)removeNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)leftBarBtnEvent:(UIBarButtonItem *)leftBarBtn
{
    
}

-(void)rightBarBtnEvent:(UIBarButtonItem *)rightBarBtn
{
    
}

@end
