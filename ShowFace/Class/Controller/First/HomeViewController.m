//
//  HomeViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>{

    UITableView *_nearbyTableView;
    UITableView *_friendTableView;
    UITableView *_moodTableView;
    UITableView *_wholeTableView;
    
    NSArray *_nearbyArr;
    NSArray *_friendArr;
    NSArray *_moodArr;
    NSArray *_wholeArr;

}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Home";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
    style:UIBarButtonItemStylePlain  target:(NavigationViewController *)self.navigationController
     action:@selector(showMenu)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"Balloon"];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    
    [self setSegmentView];
 
}

-(void)setSegmentView{
    
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
    self.segmentedControl.sectionTitles = @[@"附近", @"朋友", @"心情",@"所有"];
    
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.39f green:0.43f blue:0.47f alpha:1.00f]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:0.41f green:0.35f blue:0.59f alpha:1.00f];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 1;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        NSLog(@"  %lu",index);
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH * index, 0, SCREEN_WIDTH, 200) animated:YES];
    }];
    self.segmentedControl.selectionIndicatorHeight  = 4.0f;
    [self.view addSubview:self.segmentedControl];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 114, SCREEN_WIDTH, SCREEN_HEIGHT-50)];
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 4, 200);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, SCREEN_WIDTH, 200) animated:NO];
    [self.view addSubview:self.scrollView];
    
    _nearbyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-94) style:UITableViewStylePlain];
    _nearbyTableView.backgroundColor = [UIColor redColor];
    _nearbyTableView.delegate = self;
    _nearbyTableView.dataSource = self;
    [self.scrollView addSubview:_nearbyTableView];
    
    _friendTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-94) style:UITableViewStylePlain];
    _friendTableView.backgroundColor = [UIColor orangeColor];
    _friendTableView.delegate = self;
    _friendTableView.dataSource = self;
    [self.scrollView addSubview:_friendTableView];
    
    _moodTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 2, 0, SCREEN_WIDTH, SCREEN_HEIGHT-94) style:UITableViewStylePlain];
    _moodTableView.backgroundColor = [UIColor yellowColor];
    _moodTableView.delegate = self;
    _moodTableView.dataSource = self;
    [self.scrollView addSubview:_moodTableView];
    
    _wholeTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH * 3, 0, SCREEN_WIDTH, SCREEN_HEIGHT-94) style:UITableViewStylePlain];
    _wholeTableView.backgroundColor = [UIColor greenColor];
    _wholeTableView.delegate = self;
    _wholeTableView.dataSource = self;
    [self.scrollView addSubview:_wholeTableView];

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
    
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    NSLog(@"page %lu",page);
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (tableView == _nearbyTableView) {
        
        return _nearbyArr.count;
        
    }else if (tableView == _friendTableView){
    
        return _friendArr.count;
        
    }else if (tableView == _moodTableView){
        
        return _moodArr.count;
        
    }else{
    
        return _wholeArr.count;
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
