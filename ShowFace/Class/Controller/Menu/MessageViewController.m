//
//  MessageViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self messagePageUI];
}

-(void)messagePageUI{

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,64)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 45, 30)];
    [btn addTarget:self action:@selector(BtndownClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    [view addSubview:btn];

}

-(void)BtndownClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
