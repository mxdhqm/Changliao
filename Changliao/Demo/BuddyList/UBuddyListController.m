//
//  UBuddyListController.m
//  Changliao
//
//  Created by metthew on 15/8/25.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UBuddyListController.h"
#import "UChatController.h"
#import "UAddBuddyController.h"

#import "UResourceUtils.h"

@interface UBuddyListController ()<EM_ChatBuddyListControllerDelegate>

@end

@implementation UBuddyListController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"buddy"];
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *addBuddy = [UIButton buttonWithType:UIButtonTypeCustom];
    addBuddy.titleLabel.font = [UResourceUtils iconFontWithSize:18];
    [addBuddy setTitle:@"\ue600" forState:UIControlStateNormal];
    [addBuddy setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [addBuddy setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [addBuddy addTarget:self action:@selector(addBuddyClicked:) forControlEvents:UIControlEventTouchUpInside];
    [addBuddy sizeToFit];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:addBuddy];
    self.navigationItem.rightBarButtonItem = rightItem;

}

- (void)addBuddyClicked:(id)sender{
    UAddBuddyController *controller = [[UAddBuddyController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}


#pragma mark - EM_ChatBuddyListControllerDelegate
- (void)didSelectedWithOpposite:(EM_ChatOpposite *)opposite{
    UChatController *chatController = [[UChatController alloc]initWithOpposite:opposite];
    [self.navigationController pushViewController:chatController animated:YES];
}

@end