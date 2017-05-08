//
//  RootViewController.m
//  FirstSeeDemo
//
//  Created by 思 彭 on 17/3/29.
//  Copyright © 2017年 思 彭. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)init {
    if (self = [super init]) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = K_SCREEN_WIDTH/2;
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 16;
        self.progressColor = [UIColor orangeColor]; //进度条颜色
        self.titleColorSelected = [UIColor grayColor]; //标题选中时的颜色
        self.titleColorNormal = [UIColor grayColor];  //标题非选中的颜色
        self.menuBGColor = [UIColor whiteColor];
        self.menuHeight = 50;
    }
    return self;
}

- (NSArray *)titles {
    
    return @[@"进行中", @"历史订单"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"初见";
}

#pragma mark - WMPageControllerDataSource

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {

    ViewController *vc = [[ViewController alloc]init];
    return vc;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {

    return self.titles[index];
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
}

- (void)menuView:(WMMenuView *)menu didLayoutItemFrame:(WMMenuItem *)menuItem atIndex:(NSInteger)index {
    //    NSLog(@"frame---%@", NSStringFromCGRect(menuItem.frame));
}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {
    
}

@end
