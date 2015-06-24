//
//  HelpViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.


#import "HelpViewController.h"
#import "MyHomepageViewController.h"
@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self helpPageUI];
}

-(void)helpPageUI{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,SCREEN_HEIGHT)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, 45, 30)];
    [btn addTarget:self action:@selector(btnDownClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    [view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 64, 105, 30)];
    
    [btn2 addTarget:self action:@selector(BtndownClick2) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"我的主页" forState:UIControlStateNormal];
    [btn2 setTintColor:[UIColor whiteColor]];
    
    [view addSubview:btn2];
    
    
}

-(void)btnDownClick{
   
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)BtndownClick2
{
    MyHomepageViewController *mhvc = [[MyHomepageViewController alloc]init];
    [self.navigationController pushViewController:mhvc animated:YES];
}

@end
