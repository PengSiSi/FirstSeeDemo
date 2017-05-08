//
//  FoodInfoCell.m
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/28.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "FoodInfoCell.h"
#import "UIViewExt.h"
#import "OrderModel.h"

@interface FoodInfoCell ()

@end

@implementation FoodInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews {
    
    self.foodNameLabel = [[UILabel alloc]init];
    self.foodNameLabel.textColor = [UIColor grayColor];
    self.foodNameLabel.font = FONT_14;
    [self.contentView addSubview:self.foodNameLabel];
    
    self.foodNumeLabel = [[UILabel alloc]init];
    self.foodNumeLabel.textColor = [UIColor grayColor];
    self.foodNumeLabel.font = FONT_14;
    self.foodNumeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.foodNumeLabel];
    
    self.foodPriceLabel = [[UILabel alloc]init];
    self.foodPriceLabel.textColor = [UIColor grayColor];
    self.foodPriceLabel.font = FONT_14;
    self.foodPriceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.foodPriceLabel];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGFloat labelWidth = (K_SCREEN_WIDTH - 20) / 3;
    __weak typeof(self) weakSelf = self;
    [self.foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.contentView.mas_left);
        make.centerY.mas_equalTo(weakSelf.contentView);
        make.width.mas_equalTo(labelWidth);
    }];
    [self.foodNumeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.foodNameLabel.mas_right);
        make.centerY.equalTo(weakSelf.contentView);
        make.width.mas_equalTo(labelWidth);
    }];
    [self.foodPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.foodNumeLabel.mas_right);
        make.centerY.mas_equalTo(weakSelf.contentView);
        make.right.mas_equalTo(weakSelf.contentView);
    }];
}

- (void)setFoodModel:(foodModel *)foodModel {
    
    _foodModel = foodModel;
    self.foodNameLabel.text = foodModel.foodName;
    self.foodNumeLabel.text = foodModel.foodNum;
    self.foodNumeLabel.text = [NSString stringWithFormat:@"× %@",foodModel.foodNum];
    self.foodPriceLabel.text = [NSString stringWithFormat:@"￥%@",foodModel.foodPrice];
}

@end
