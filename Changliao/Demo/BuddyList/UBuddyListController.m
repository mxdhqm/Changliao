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
#import "UApplyViewController.h"

#import "UResourceUtils.h"
#import "UBlackListViewController.h"
#import "UGroupViewController.h"
#import "UDiscussionViewController.h"
#import "MySliderViewController.h"

@interface UBuddyListController ()<EM_ChatBuddyListControllerDelegate>
{
    MySliderViewController *slidervc;
}
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
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self selector:@selector(delAction) name:@"deletepeople" object:nil];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:addBuddy];
    self.navigationItem.rightBarButtonItem = rightItem;

}

- (void)addBuddyClicked:(id)sender{
    UAddBuddyController *controller = [[UAddBuddyController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)delAction
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [slidervc setPanON];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [slidervc setPanOff];
}


#pragma mark - EM_ChatBuddyListControllerDelegate
- (void)didSelectedWithOpposite:(EM_ChatOpposite *)opposite{
    UChatController *chatController = [[UChatController alloc]initWithOpposite:opposite];
    [self.navigationController pushViewController:chatController animated:YES];
}

- (void)didSelectedForTagAtIndex:(NSInteger)index
{
    if (slidervc.showingLeftVC == NO) {
        [slidervc setPanOff];
        if (index == 0) {
            UApplyViewController *vc = [[UApplyViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if(index == 1)
        {
            UGroupViewController *vc = [[UGroupViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if(index == 2)
        {
            UDiscussionViewController *vc = [[UDiscussionViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if(index == 3)
        {
            UBlackListViewController *vc = [[UBlackListViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }else
    {
        [slidervc hideSlideViewController:YES];
    }
    
}



@end