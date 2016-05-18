//
//  UApplyViewController.h
//  Changliao
//
//  Created by metthew on 16/4/28.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    ApplyStyleFriend            = 0,
    ApplyStyleGroupInvitation,
    ApplyStyleJoinGroup,
}ApplyStyle;


@interface UApplyViewController : UITableViewController
{
    NSMutableArray *_dataSource;
}



@property (strong, nonatomic, readonly) NSMutableArray *dataSource;

+ (instancetype)shareController;

- (void)addNewApply:(NSDictionary *)dictionary;

- (void)loadDataSourceFromLocalDB;

- (void)clear;

@end
