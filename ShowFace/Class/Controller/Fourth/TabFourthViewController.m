//
//  TabFourthViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "TabFourthViewController.h"

@interface TabFourthViewController ()

@end

@implementation TabFourthViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Fourth";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(NavigationViewController *)self.navigationController
                                                                            action:@selector(showMenu)];
}


@end
