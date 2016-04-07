//
//  BaseNavViewController.m
//  changliao
//
//  Created by cherish_pro on 16/2/29.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBar.tintColor = [UIColor redColor];
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:41/255.0 green:165/255.0 blue:249/255.0 alpha:1.0]];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
