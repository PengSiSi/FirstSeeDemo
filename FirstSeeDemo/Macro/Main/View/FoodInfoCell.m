//
//  FoodInfoCell.m
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/28.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "FoodInfoCell.h"
#import "UIViewExt.h"

@interface FoodInfoCell ()

@property (nonatomic, strong) UILabel *foodNameLabel;
@property (nonatomic, strong) UILabel *foodNumeLabel;
@property (nonatomic, strong) UILabel *foodPriceLabel;

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
    [self.contentView addSubview:self.foodNumeLabel];
    
    self.foodPriceLabel = [[UILabel alloc]init];
    self.foodPriceLabel.textColor = [UIColor grayColor];
    self.foodPriceLabel.font = FONT_14;
    [self.contentView addSubview:self.foodPriceLabel];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    
}

@end
