//
//  TabSecondViewController.m
//  ShowFace
//
//  Created by Tonglin.jia on 15/6/12.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "TabSecondViewController.h"
#import "CircleCell.h"
@interface TabSecondViewController (){
    
    UITableView *_findTableView;
    UITableView *_circleTableView;
    
    NSArray *_findArr;
    NSArray *_circleArr;
    
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;

@end

@implementation TabSecondViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Second";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(NavigationViewController *)self.navigationController
                                                                            action:@selector(showMenu)];
    [self setSegmentView];
    
}

-(void)setSegmentView{
    
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 50)];
    self.segmentedControl.sectionTitles = @[@"发现", @"圈子"];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.39f green:0.43f blue:0.47f alpha:1.00f]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentedControl.selectionIndicatorColor = [UIColor colorWithRed:0.41f green:0.35f blue:0.59f alpha:1.00f];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleBox;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 2;
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(SCREEN_WIDTH * index, 0, SCREEN_WIDTH, 200) animated:YES];
    }];
    self.segmentedControl.selectionIndicatorHeight  = 4.0f;
    [self.view addSubview:self.segmentedControl];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 114, SCREEN_WIDTH, SCREEN_HEIGHT-50)];
    self.scrollView.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, 200);
    self.scrollView.tag = 200;
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, SCREEN_WIDTH, 200) animated:NO];
    [self.view addSubview:self.scrollView];
    
    _findArr = [[NSArray alloc]initWithObjects:@"1",@"2",@"1",@"2", nil];
    _circleArr = [[NSArray alloc]initWithObjects:@"1",@"1",@"2",@"1",@"2", nil];
    
    _findTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-94-49) style:UITableViewStylePlain];
    _findTableView.delegate = self;
    _findTableView.dataSource = self;
    _findTableView.tableFooterView = [[UITableView alloc]init];
    [self.scrollView addSubview:_findTableView];
    
    
    _circleTableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT-94-49) style:UITableViewStylePlain];
    _circleTableView.delegate = self;
    _circleTableView.dataSource = self;
    _circleTableView.tableFooterView = [[UITableView alloc]init];
    [self.scrollView addSubview:_circleTableView];
    
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
    
    if (self.scrollView.tag == 200) {
        
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == _findTableView) {
     
        return _findArr.count;
        
    }else{
        
        return _circleArr.count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:_findTableView]) {
        
        CircleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"circleCell"];
        if (cell == nil) {
            
            cell = [[[NSBundle mainBundle]loadNibNamed:@"CircleCell_x" owner:self options:nil] lastObject];
            
        }if (cell != nil) {
            
            cell.backgroundImage.image = [UIImage imageNamed:@"backgroundImage3.jpg"];
            cell.knowBtn.backgroundColor = [UIColor colorWithRed:54/255.0 green:54/255.0 blue:54/255.0 alpha:1];
            [cell.knowBtn.layer setMasksToBounds:YES];
            [cell.knowBtn.layer setCornerRadius:15];

        }
        return cell;
        
    }else{
    
        CircleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"circleCell"];
        if (cell == nil) {
            
            cell = [[[NSBundle mainBundle]loadNibNamed:@"CircleCell_x" owner:self options:nil] lastObject];
            
        }if (cell != nil) {
            
            cell.backgroundImage.image = [UIImage imageNamed:@"backgroundImage.jpg"];
            cell.knowBtn.backgroundColor = [UIColor colorWithRed:54/255.0 green:54/255.0 blue:54/255.0 alpha:1];
            [cell.knowBtn.layer setMasksToBounds:YES];
            [cell.knowBtn.layer setCornerRadius:15];
            
        }
        
        return cell;
        
    }
    
    
}


@end
