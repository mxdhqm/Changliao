//
//  EM+ChatBaseController.m
//  Changliao Controller基类
//
//  Created by metthew on 15/8/21.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "EM+ChatBaseController.h"

@interface EM_ChatBaseController ()

@end

@implementation EM_ChatBaseController

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.navigationController) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _isShow = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    _isShow = NO;
}

@end