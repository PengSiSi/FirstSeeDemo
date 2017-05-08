//
//  FoodInfoCell.h
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/28.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class foodModel;

@interface FoodInfoCell : UITableViewCell

@property (nonatomic, strong) UILabel *foodNameLabel;
@property (nonatomic, strong) UILabel *foodNumeLabel;
@property (nonatomic, strong) UILabel *foodPriceLabel;

@property (nonatomic, strong) foodModel *foodModel;

@end
