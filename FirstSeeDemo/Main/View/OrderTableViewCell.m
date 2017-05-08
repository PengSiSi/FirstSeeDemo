//
//  OrderTableViewCell.m
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/29.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "FoodInfoCell.h"

static NSString *const identify = @"cell";

@interface OrderTableViewCell ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *telLabel;
@property (nonatomic, strong) UILabel *kilometresLabel;

@property (nonatomic, strong) UITableView *foodInfoTableView;
@property (nonatomic, strong) UILabel *sumPriceLabel;
@property (nonatomic, strong) UILabel *remarkLabel;
@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *locationLabel;

@end

@implementation OrderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    
    self.bgView = [[UIView alloc]init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = 10;
    [self.contentView addSubview:self.bgView];
    
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.textColor = [UIColor grayColor];
    self.nameLabel.font = FONT_14;
    [self.bgView addSubview:self.nameLabel];
    
    self.telLabel = [[UILabel alloc]init];
    self.telLabel.textColor = [UIColor orangeColor];
    self.telLabel.font = FONT_14;
    [self.bgView addSubview:self.telLabel];
    
    self.kilometresLabel = [[UILabel alloc]init];
    self.kilometresLabel.textColor = [UIColor grayColor];
    self.kilometresLabel.font = FONT_14;
    [self.bgView addSubview:self.kilometresLabel];
    
    [self.bgView addSubview:self.foodInfoTableView];
    
    self.sumPriceLabel = [[UILabel alloc]init];
    self.sumPriceLabel.textColor = [UIColor grayColor];
    self.sumPriceLabel.font = FONT_14;
    [self.bgView addSubview:self.sumPriceLabel];
    
    self.remarkLabel = [[UILabel alloc]init];
    self.remarkLabel.textColor = [UIColor grayColor];
    self.remarkLabel.font = FONT_14;
    self.remarkLabel.numberOfLines = 0;
    [self.bgView addSubview:self.remarkLabel];
    
    self.iconImgView = [[UIImageView alloc]init];
    [self.bgView addSubview:self.iconImgView];
    
    self.locationLabel = [[UILabel alloc]init];
    self.locationLabel.textColor = [UIColor grayColor];
    self.locationLabel.font = FONT_14 ;
    self.locationLabel.enabled = NO;
    [self.bgView addSubview:self.locationLabel];
    self.iconImgView.image = [UIImage imageNamed:@"annotation-icon"];
    [self layOut];
}

- (void)layOut {
    
    __weak typeof(self) weakSelf = self;
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(weakSelf.contentView).mas_offset(10);
        make.right.bottom.mas_equalTo(weakSelf.contentView).mas_offset(-10);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.bgView.mas_left).mas_offset(10);
        make.top.mas_equalTo(weakSelf.bgView.mas_top).mas_offset(10);
    }];
    [self.telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.nameLabel.mas_right).mas_offset(20);
        make.top.bottom.mas_equalTo(weakSelf.nameLabel);
    }];
    [self.kilometresLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(weakSelf.nameLabel);
        make.right.mas_equalTo(weakSelf.bgView).mas_offset(-10);
    }];
    [self.foodInfoTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.bgView.mas_left).mas_offset(10);
        make.top.mas_equalTo(weakSelf.nameLabel.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(90);
        make.right.mas_equalTo(weakSelf.bgView).mas_offset(-10);
    }];
    [self.sumPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.foodInfoTableView.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(weakSelf.bgView.mas_left).mas_offset(10);
        make.right.mas_equalTo(weakSelf.bgView.mas_right).mas_offset(-10);
    }];
    [self.remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.sumPriceLabel.mas_left);
        make.right.mas_equalTo(weakSelf.bgView.mas_right).mas_offset(-10);
        make.top.mas_equalTo(weakSelf.sumPriceLabel.mas_bottom).mas_offset(10);
    }];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.sumPriceLabel.mas_left);
        make.top.mas_equalTo(weakSelf.remarkLabel.mas_bottom).mas_offset(10);
        make.width.height.mas_equalTo(20);
    }];
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.iconImgView.mas_right).offset(10);
        make.centerY.mas_equalTo(weakSelf.iconImgView);
        make.width.mas_equalTo(100);
        make.bottom.mas_equalTo(weakSelf.bgView.mas_bottom).mas_offset(-10);
        make.right.mas_equalTo(weakSelf.bgView.mas_right).mas_offset(-10);
    }];
}

#pragma mark - TabelViewDelegate DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.model.foodArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    FoodInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.foodModel = (foodModel *)self.model.foodArr[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return FLT_EPSILON;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return FLT_EPSILON;
}

#pragma mark - 懒加载

- (UITableView *)foodInfoTableView {
    
    if (!_foodInfoTableView) {
        _foodInfoTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _foodInfoTableView.delegate = self;
        _foodInfoTableView.dataSource = self;
        _foodInfoTableView.scrollEnabled = NO;
        _foodInfoTableView.separatorColor = [UIColor clearColor];
        _foodInfoTableView.tableFooterView = [UIView new];
        [_foodInfoTableView registerClass:[FoodInfoCell class] forCellReuseIdentifier:identify];
    }
    return _foodInfoTableView;
}

- (void)setModel:(OrderModel *)model {
    
    _model = model;
    self.nameLabel.text = model.name;
    self.telLabel.text = model.tel;
    self.kilometresLabel.text = model.kilo;
    NSString *sumPriceStr = [NSString stringWithFormat:@"总计 ￥%@",model.sumPrice];
    self.sumPriceLabel.text = sumPriceStr;
    [self setTextColor:self.sumPriceLabel FontNumber:FONT_14 AndRange:NSMakeRange(0, sumPriceStr.length) AndColor:[UIColor orangeColor]];
    self.locationLabel.text = model.location;
    self.remarkLabel.text = model.remark;
    [self.foodInfoTableView reloadData];
}

// 设置字符串中数字的颜色
- (void)setTextColor:(UILabel *)label FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
    
    NSCharacterSet* nonDigits =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    int remainSecond =[[label.text stringByTrimmingCharactersInSet:nonDigits] intValue];
    NSLog(@" num %d ",remainSecond);
    
    NSString *labelText = label.text;
    
    for (int i = 0; i < labelText.length; i ++) {
        //这里的小技巧，每次只截取一个字符的范围
        NSString *a = [labelText substringWithRange:NSMakeRange(i, 1)];
        //判断装有0-9的字符串的数字数组是否包含截取字符串出来的单个字符，从而筛选出符合要求的数字字符的范围NSMakeRange
        NSArray *number = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
        if ([number containsObject:a]) {
            [str setAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor],NSFontAttributeName:FONT_14} range:NSMakeRange(i, 1)];
        }
    }
    label.attributedText = str;
}

@end
