//
//  PersonalHomepageViewController.m
//  ShowFace
//
//  Created by 派喔得 on 15/6/17.
//  Copyright (c) 2015年 Tonglin.jia. All rights reserved.
//

#import "PersonalHomepageViewController.h"

#import "HMSegmentedControl.h"
#import "PictureCell.h"
#import "ActivityCell.h"
#import "FollowCell.h"

@interface PersonalHomepageViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic, strong) UIView *segmentView;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation PersonalHomepageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.nav.navigationItem.title  = @"他人主页";
    [self setHeadView];
    [self setFootView];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;

    self.frostedViewController.panGestureEnabled= NO ;
    [[self rdv_tabBarController]setTabBarHidden:YES animated:YES];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[self rdv_tabBarController]setTabBarHidden:NO animated:YES];
    self.frostedViewController.panGestureEnabled= YES ;
//    self.navigationController.navigationBar.hidden = NO;
    [super viewWillDisappear:animated];
    
}

#pragma mark - headView Setting
-(void)setHeadView
{
    
    self.segmentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,200)];
   
   
    UIImage *backgroundImage = [UIImage imageNamed:@"11.jpg"];
    CGRect backgroundRect = CGRectMake(0,-40, SCREEN_WIDTH, 200);
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:backgroundRect];
    backgroundImageView.image = backgroundImage;
    backgroundImageView.userInteractionEnabled = YES;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.clipsToBounds = YES;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 140, 40, 40)];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    imageView.image = [UIImage imageNamed:@"2.jpg"];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 20.0;
    imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    imageView.layer.shouldRasterize = YES;
    imageView.clipsToBounds = YES;
    
    [backgroundImageView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(70, 140, 100, 30)];
    label.text = @"Leoi'Zhang";
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:16];
    [backgroundImageView addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame =CGRectMake(SCREEN_WIDTH-100, 145, 80, 30);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 16.0;
    
    [button setTitle:@"＋认识一下" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    button.backgroundColor = [UIColor colorWithRed:0.59f green:0.48f blue:0.86f alpha:1.00f];
    button.tag = 1;
    [backgroundImageView addSubview:button];
    [button addTarget:self action:@selector(headViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.frame = CGRectMake(20, 50, 50, 50);
//    [backButton setTitle:@"返回" forState:UIControlStateNormal];
//    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    backButton.tag = 0;
//    [backButton addTarget:self  action:@selector(headViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [backgroundImageView addSubview:backButton];
    
    [self.segmentView addSubview:backgroundImageView];
    
    
    
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 50)];
    self.segmentedControl.sectionTitles = @[@"2036\n照片", @"235\n动态", @"11,230\n关注"];
    
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
        weakSelf.tableView.tag = index;
        [weakSelf.tableView reloadData];
    }];
    self.segmentedControl.selectionIndicatorHeight  = 4.0f;

    
    
    [self.segmentView addSubview:self.segmentedControl];
    [self setSegmentView];

    
    

}
#pragma mark - segmentView and tableView Setting
-(void)setSegmentView
{
   
    
    
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        self.tableView.tag = 0;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
       [self.tableView setTableHeaderView:self.segmentView];
       [self.view addSubview:self.tableView];

    
    


}
#pragma mark - tabbar Setting
-(void)setFootView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-29, SCREEN_HEIGHT, 49)];
    view.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
    [self.view addSubview:view];
    
    NSArray *Items = [[NSArray alloc]initWithObjects:@"发消息",@"喝一杯",@"关注", nil];
    for (int i = 0; i<Items.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(SCREEN_WIDTH/3*i, 0, SCREEN_WIDTH/3, 49);
        [btn setTitle:[Items objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0.40f green:0.43f blue:0.47f alpha:1.00f] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [btn addTarget:self action:@selector(footViewItemsBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [view addSubview:btn];
        
    }


}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *PictureID = @"Picture Cell";
    static NSString *ActivityID = @"Activity Cell";
    static NSString *FollowID = @"Fans Cell";
   
    if (tableView.tag == 0) {
        
        PictureCell *cell = [tableView dequeueReusableCellWithIdentifier:PictureID];
        if (!cell) {
            cell = [[PictureCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PictureID];
           
        }
        if (indexPath.row%2==0) {
            if (indexPath.row == 0) {
                cell.images = [[NSArray alloc]initWithObjects:@"9.jpg",@"6.jpg", nil];
            }else
            {
                cell.images = [[NSArray alloc]initWithObjects:@"7.jpg",@"5.jpg", nil];
            }
            
        }else
        {
            cell.images = [[NSArray alloc]initWithObjects:@"10.jpg", nil];
        }
        cell.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (tableView.tag == 1){
        
        ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:ActivityID];
        if (!cell) {
            cell = [[ActivityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ActivityID];
        }
        NSArray *images  = [[NSArray alloc]initWithObjects:@"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg",@"11.jpg",@"5.jpg",nil];
        
        if (indexPath.row == 0) {
           
            images  = [[NSArray alloc]initWithObjects:@"10.jpg",@"9.jpg",@"7.jpg",@"5.jpg",@"10.jpg",@"11.jpg",nil];
        }
        
        cell.images = images;
        cell.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    }else
    {
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.separatorColor = [UIColor blackColor];
        FollowCell *cell = [tableView dequeueReusableCellWithIdentifier:FollowID];
        if (!cell) {
            cell = [[FollowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FollowID];
        }
        cell.index = indexPath.row;
        cell.backgroundColor = [UIColor colorWithRed:0.15f green:0.16f blue:0.18f alpha:1.00f];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == 0) {
        return 120.0f;
    }else if (tableView.tag == 1)
    {
        NSArray *images  = [[NSArray alloc]initWithObjects:@"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg",@"11.jpg", @"6.jpg",nil];
        NSString *text   = @"公元前278年  屈原用了四倍杠杆 买入楚国股票  结果4天3天大跌  他非常绝望 愿赌服输 就投江而去  人们为了警醒后人  就用 绿色的粽叶包红色的猪肉 再用绳子扎牢 以此表达 阴包阳  被套牢的意思";
        if (indexPath.row == 0) {
            text = @"无论你考了多少分 能不能去你想去的学校 都不用担心 你能去的地方 一定会带给你你预想不到的惊喜 你会遇见一些人 觉得相见恨晚 或者遇到一个人觉得在哪里值得 这是命 遇见你该遇见的 接受你所不能改变的其实不错 中考高考的迷人之处 不是如愿以偿 而是阴差阳错";
            images  = [[NSArray alloc]initWithObjects:@"10.jpg",@"9.jpg",@"7.jpg",@"5.jpg",@"10.jpg",@"11.jpg",nil];
        }
        return [ActivityCell getHeightWith:images Text:text];
    }else
    {
        return 60.0f;
    
    }


}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  
   
    
}
#pragma mark - tabbar Button Click
-(void)footViewItemsBtnClick:(UIButton *)btn
{
    NSLog(@"footBtn.tag = %lu",btn.tag);
}

-(void)headViewButtonClick:(UIButton *)btn
{
    if (btn.tag == 0) {
    
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
