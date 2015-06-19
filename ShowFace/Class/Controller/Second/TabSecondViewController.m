//
//  TabSecondViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "TabSecondViewController.h"

@interface TabSecondViewController ()

@end

@implementation TabSecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Second";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(NavigationViewController *)self.navigationController
                                                                            action:@selector(showMenu)];
    
}


@end
