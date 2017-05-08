//
//  OrderModel.m
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/29.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "OrderModel.h"
#import <MJExtension.h>

@implementation OrderModel

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{@"foodArr" : @"foodModel"
             };
}

@end

@implementation foodModel

@end
