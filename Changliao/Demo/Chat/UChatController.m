//
//  MainController.m
//  Changliao
//
//  Created by metthew on 15/7/1.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UChatController.h"
#import "UserCustomExtend.h"

@interface UChatController ()<EM_ChatControllerDelegate>

@end

@implementation UChatController

- (instancetype)initWithConversation:(EMConversation *)conversation{
    self = [super initWithConversation:conversation];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (instancetype)initWithOpposite:(EM_ChatOpposite *)opposite{
    self = [super initWithOpposite:opposite];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#define mark - EM_ChatControllerDelegate
- (void)extendForMessage:(EM_ChatMessageModel *)message{
    message.messageExtend.extendAttributes = @{@"a":@"不显示的属性"};
}

- (void)didActionSelectedWithName:(NSString *)name{
    
}

- (void)didAvatarTapWithChatter:(NSString *)chatter isOwn:(BOOL)isOwn{
    
}

- (void)didExtendTapWithUserInfo:(NSDictionary *)userInfo{
    
}

- (void)didExtendMenuSelectedWithUserInfo:(NSDictionary *)userInfo{
    
}

@end