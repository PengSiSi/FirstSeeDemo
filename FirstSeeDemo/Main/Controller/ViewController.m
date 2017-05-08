//
//  ViewController.m
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/28.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "ViewController.h"
#import "FoodInfoCell.h"
#import "OrderTableViewCell.h"
#import "OrderModel.h"

#import <UITableView+FDTemplateLayoutCell.h>
#import <MJExtension.h>
#import "HTTPTool.h"
#import <AFNetworking.h>

static NSString *const OrderTableViewCellIdentify = @"OrderCellID";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"初见";
    // 设置界面
    [self setupUI];
    [self requestData];
}

#pragma mark - 数据请求

- (void)requestData {
    
    // 1.本地json模拟数据
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:jsonPath];
    NSError *error;
    id jsonObject=[NSJSONSerialization JSONObjectWithData:data
                                                  options:NSJSONReadingAllowFragments
                                                    error:&error];
    self.dataArray = [OrderModel mj_objectArrayWithKeyValuesArray:jsonObject];
    [self.tableView reloadData];
    NSLog(@"jsonObject = %@",jsonObject);
    
    /*
    // 2.模拟网络数据
    NSString *url = @"http://www.mocky.io/v2/58edf1620f00008a14787df8";
    [HTTPTool POST:url headers:nil parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"---responseObject = %@",responseObject);
        self.dataArray = [OrderModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@",error);
    }];
    */
    
    // 3."青花瓷"模拟网络数据
    /*
    NSString *url = @"http://www.momo.com/home/list/";
    [HTTPTool GET:url headers:nil parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"---responseObject = %@",responseObject);
        self.dataArray = [OrderModel mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error = %@",error);
    }];
     */

    /*
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *sessinoUrl = [NSURL URLWithString:@"http://www.momo.com/home/list/"];
    [[session dataTaskWithURL:sessinoUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response = %@",response);
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                                options:NSJSONReadingMutableLeaves
                error:nil];
        NSLog(@"jsonObject = %@",jsonObject);
    }] resume];
     */
}

#pragma mark - 设置界面

- (void)setupUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_HEIGHT - 50 - 64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 注册cell
    [self.tableView registerClass:[OrderTableViewCell class] forCellReuseIdentifier:OrderTableViewCellIdentify];
    [self.view addSubview: self.tableView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderTableViewCellIdentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [self configureRemarkCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
//    return 270;
    return [tableView fd_heightForCellWithIdentifier:OrderTableViewCellIdentify cacheByIndexPath:indexPath configuration:^(id cell) {
        [self configureRemarkCell:cell atIndexPath:indexPath];
    }];
 }

- (void)configureRemarkCell: (OrderTableViewCell *)cell atIndexPath: (NSIndexPath *)indexPath {
    
    cell.fd_enforceFrameLayout = NO;
    cell.model = self.dataArray[indexPath.section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return FLT_EPSILON;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 30)];
    UILabel *dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, K_SCREEN_WIDTH, 20)];
    dateLabel.text = @"2016-3-8";
    dateLabel.font = FONT_14;
    [sectionHeaderView addSubview:dateLabel];
    return sectionHeaderView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *sectionFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 10)];
    sectionFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return sectionFooterView;
}

#pragma mark - 懒加载


@end
