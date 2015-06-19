//
//  HelpViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.


#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self helpPageUI];
}

-(void)helpPageUI{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,64)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 45, 30)];
    [btn addTarget:self action:@selector(btnDownClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    [view addSubview:btn];
    
}

-(void)btnDownClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
