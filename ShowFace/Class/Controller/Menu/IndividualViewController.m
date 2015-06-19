//
//  ViewController.m
//  SKSTableView
//
//  Created by Sakkaras on 26/12/13.
//  Copyright (c) 2013 Sakkaras. All rights reserved.
//

#import "ViewController.h"

@interface IndividualViewController ()


@property (nonatomic, strong) NSArray *contents;
@property (nonatomic, strong) SKSTableView *tableView;


@end

@implementation IndividualViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    [self attentionPageUI];
    
}

-(void)attentionPageUI{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,64)];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 45, 30)];
    [btn addTarget:self action:@selector(BtndownClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    [view addSubview:btn];
    
    self.tableView = [[SKSTableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor blackColor];
    self.tableView.SKSTableViewDelegate = self;
    self.tableView.tableFooterView = [[UITableView alloc]init];
    self.tableView.backgroundColor = [UIColor colorWithRed:54.0/255.0 green:54.0/255.0 blue:54.0/255.0 alpha:1.0];
    [self.view addSubview:self.tableView];

}

-(void)BtndownClick{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSArray *)contents{
    
    if (!_contents)
    {
        _contents = @[
                      @[
                          @[@"年龄", @"00后",@"90后",@"80后",@"70后",@"60后"],
                          @[@"心情", @"郁闷",@"High翻天",@"寂寞",@"空虚",@"买醉",@"期待",@"求约"],
                          @[@"感情状态", @"失恋",@"结婚狂",@"轰轰烈烈",@"平平淡淡",@"细水长流"],
                          @[@"个性签名"]
                          ],
                      //                      @[
                      //                          @[@"Section1_Row0", @"Row0_Subrow1", @"Row0_Subrow2", @"Row0_Subrow3"],
                      //                          @[@"Section1_Row1"],
                      //                          @[@"Section1_Row2", @"Row2_Subrow1", @"Row2_Subrow2", @"Row2_Subrow3", @"Row2_Subrow4", @"Row2_Subrow5"],
                      //                          @[@"Section1_Row3"],
                      //                          @[@"Section1_Row4"],
                      //                          @[@"Section1_Row5"],
                      //                          @[@"Section1_Row6"],
                      //                          @[@"Section1_Row7"],
                      //                          @[@"Section1_Row8"],
                      //                          @[@"Section1_Row9"],
                      //                          @[@"Section1_Row10"],
                      //                          @[@"Section1_Row11"]]
                      ];
    }
    
    return _contents;
}

#pragma mark --
#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [self.contents count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.contents[section] count];
}

- (NSInteger)tableView:(SKSTableView *)tableView numberOfSubRowsAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self.contents[indexPath.section][indexPath.row] count] - 1;
}

- (BOOL)tableView:(SKSTableView *)tableView shouldExpandSubRowsOfCellAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.section == 1 && indexPath.row == 0){
//        
//        return NO;
//    }
    
    return NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"SKSTableViewCell";
    
    SKSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
        cell = [[SKSTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    cell.textLabel.text = self.contents[indexPath.section][indexPath.row][0];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor colorWithRed:54/255.0 green:54/255.0 blue:54/255.0 alpha:1];
    
    if ((indexPath.section == 0 && (indexPath.row == 1 || indexPath.row == 0 || indexPath.row == 2))){
        
        cell.expandable = YES;
        
    }else if (indexPath.section == 0 && indexPath.row == 3){
    
        UITextField *moodField = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/4, SCREEN_HEIGHT/3.55, 280, 55)];
        moodField.backgroundColor = [UIColor colorWithRed:54.0/255.0 green:54.0/255.0 blue:54.0/255.0 alpha:1.0];
        moodField.clearButtonMode = UITextFieldViewModeAlways;
        [cell addSubview:moodField];
        
    }else{
        
        cell.expandable = NO;
        
    }
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSubRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"UITableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.contents[indexPath.section][indexPath.row][indexPath.subRow]];
    cell.backgroundColor = [UIColor colorWithRed:79/255.0 green:79/255.0 blue:79/255.0 alpha:1];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(SKSTableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"Section: %ld, Row:%ld, Subrow:%ld", (long)indexPath.section, (long)indexPath.row, (long)indexPath.subRow);
    
}

- (void)tableView:(SKSTableView *)tableView didSelectSubRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
     NSLog(@"Section: %ld, Row:%ld, Subrow:%ld", (long)indexPath.section, (long)indexPath.row, (long)indexPath.subRow);
    
}


@end
