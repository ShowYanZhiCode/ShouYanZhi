//
//  TabFourthViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "TabFourthViewController.h"

@interface TabFourthViewController (){

    UITableView *_wineCabinetTableView;
    UITableView *_myWineCabinetTableView;
    
    NSArray *_wineCabinetArr;
    NSArray *_myWineCabinetArr;

}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@end

@implementation TabFourthViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Fourth";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(NavigationViewController *)self.navigationController
                                                                            action:@selector(showMenu)];
    [self setSegmentView];
    
}

-(void)setSegmentView{
    
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
    self.segmentedControl.sectionTitles = @[@"酒柜", @"我的酒柜"];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.39f green:0.43f blue:0.47f alpha:1.00f]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:0.41f green:0.35f blue:0.59f alpha:1.00f];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 3;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH * index, 0, SCREEN_WIDTH, 200) animated:YES];
    }];
    self.segmentedControl.selectionIndicatorHeight  = 4.0f;
    [self.view addSubview:self.segmentedControl];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 114, SCREEN_WIDTH, SCREEN_HEIGHT-94-49)];
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, 200);
    self.scrollView.tag = 300;
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, SCREEN_WIDTH, 200) animated:NO];
    [self.view addSubview:self.scrollView];
    
    _wineCabinetTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-94) style:UITableViewStylePlain];
    _wineCabinetTableView.delegate = self;
    _wineCabinetTableView.dataSource = self;
    [self.scrollView addSubview:_wineCabinetTableView];
    
    _myWineCabinetTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-94) style:UITableViewStylePlain];
    _myWineCabinetTableView.delegate = self;
    _myWineCabinetTableView.dataSource = self;
    [self.scrollView addSubview:_myWineCabinetTableView];
    
}

- (void)setApperanceForLabel:(UILabel *)label {
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    label.backgroundColor = color;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:21.0f];
    label.textAlignment = NSTextAlignmentCenter;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (self.scrollView.tag == 300) {
        
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
        
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _wineCabinetTableView) {
        
        return _wineCabinetArr.count;
        
    }else{
        
        return _myWineCabinetArr.count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    return cell;
    
}


@end
