//
//  ViewController.m
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/28.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoCell.h"

static NSString *const UserInfoCellIdentify = @"UserInfoCellID";
static NSString *const foodCellIdentify = @"FoodInfoCellID";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置界面
    [self setupUI];
}

#pragma mark - 设置界面

- (void)setupUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // 注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview: self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, K_SCREEN_WIDTH, 30)];
    dateLabel.text = @"2016-3-8";
    return dateLabel;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 10)];
    sectionFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return sectionFooterView;
}

#pragma mark - 懒加载


@end
