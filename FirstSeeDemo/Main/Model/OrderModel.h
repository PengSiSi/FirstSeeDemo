//
//  OrderModel.h
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/29.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import <Foundation/Foundation.h>
@class foodArr;

@interface OrderModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tel;
@property (nonatomic, strong) NSString *kilo;
@property (nonatomic, strong) NSArray <foodArr *>*foodArr;
@property (nonatomic, strong) NSString *sumPrice;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *location;

@end

@interface foodModel : NSObject

@property (nonatomic, strong) NSString *foodName;
@property (nonatomic, strong) NSString *foodNum;
@property (nonatomic, strong) NSString *foodPrice;

@end
