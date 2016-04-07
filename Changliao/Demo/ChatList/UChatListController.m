//
//  UStylistChatListController.m
//  Changliao
//
//  Created by metthew on 15/8/25.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UChatListController.h"
#import "UChatController.h"

@interface UChatListController ()<EM_ChatListControllerDelegate>

@end

@implementation UChatListController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"message"];
        self.delegate = self;
    }
    return self;
}

#pragma mark - EM_ChatListControllerDelegate
- (void)didSelectedWithConversation:(EMConversation *)conversation{
    UChatController *chatController = [[UChatController alloc]initWithConversation:conversation];
    [self.navigationController pushViewController:chatController animated:YES];
}

@end