//
//  MainController.m
//  Changliao
//
//  Created by metthew on 15/7/1.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UChatController.h"
#import "UserCustomExtend.h"
#import "MySliderViewController.h"

@interface UChatController ()<EM_ChatControllerDelegate, UIActionSheetDelegate>
{
    MySliderViewController *slidervc;
}
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
    
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(Action)];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [slidervc setPanOff];

}

- (void)Action
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除好友" otherButtonTitles:@"黑名单", nil];
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheet

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        NSLog(@"删除好友");
        EMError *error = nil;
        // 删除好友
        BOOL isSuccess = [[EaseMob sharedInstance].chatManager removeBuddy:self.title removeFromRemote:YES error:&error];
        if (isSuccess && !error) {
            NSLog(@"删除成功");
            [[EaseMob sharedInstance].chatManager asyncFetchBuddyList];
            [self.navigationController popViewControllerAnimated:YES];
            
        }
    }
    else if(buttonIndex == 1)
    {
        EMError *error = [[EaseMob sharedInstance].chatManager blockBuddy:self.title relationship:eRelationshipBoth];
        if (!error) {
            NSLog(@"发送成功");
        }
    }
    else
    {
        NSLog(@"error");
    }
    

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