//
//  USettingsController.m
//  Changliao
//
//  Created by metthew on 15/9/5.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "USettingsController.h"
#import "USettingsAvatarCell.h"

#import "USettingAvatarItem.h"

#import <RETableViewManager/RETableViewManager.h>
#import <EaseMobSDKFull/EaseMob.h>

@interface USettingsController()<UIActionSheetDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RETableViewManager *tableManager;
@property (nonatomic, strong) EMPushNotificationOptions *options;

@end

@implementation USettingsController{
    RETableViewSection *avatarSection;
    USettingAvatarItem *avatarItem;
    
    RETableViewSection *settingsSection;
    RETextItem *nickNameItem;
    REBoolItem *autoLoginItem;
    RERadioItem *pushStyleItem;
    RERadioItem *disturbItem;
    REDateTimeItem *disturbTimeItem;
    
    UIButton *btn;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.title = @"设置";
        self.tabBarItem.image = [UIImage imageNamed:@"settings"];
        self.options = [[EaseMob sharedInstance].chatManager pushNotificationOptions];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    self.tableManager = [[RETableViewManager alloc]initWithTableView:self.tableView];
    self.tableManager[@"USettingAvatarItem"] = @"USettingsAvatarCell";
    
    __weak USettingsController *controller = self;
    
    avatarSection = [RETableViewSection section];
    avatarSection.headerHeight = 30;
    [self.tableManager addSection:avatarSection];
    
    avatarItem = [USettingAvatarItem itemWithTitle:nil accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        
    }];
    [avatarSection addItem:avatarItem];
    
    settingsSection = [RETableViewSection section];
    settingsSection.headerHeight = 30;
    [self.tableManager addSection:settingsSection];
    
    nickNameItem = [RETextItem itemWithTitle:@"昵称" value:self.options.nickname placeholder:@"昵称"];
    nickNameItem.clearButtonMode = UITextFieldViewModeWhileEditing;
    nickNameItem.charactersLimit = 10;
    nickNameItem.enablesReturnKeyAutomatically = YES;
    [settingsSection addItem:nickNameItem];

    autoLoginItem = [REBoolItem itemWithTitle:@"自动登录" value:[EaseMob sharedInstance].chatManager.isAutoLoginEnabled switchValueChangeHandler:^(REBoolItem *item) {
        if (item.value) {
            [[EaseMob sharedInstance].chatManager enableAutoLogin];
        }else{
            [[EaseMob sharedInstance].chatManager disableAutoLogin];
        }
    }];
    [settingsSection addItem:autoLoginItem];
    
    NSString *pushType;
    if (self.options.displayStyle == ePushNotificationDisplayStyle_simpleBanner) {
        pushType = @"简单内容";
    }else{
        pushType = @"详情内容";
    }
    pushStyleItem = [RERadioItem itemWithTitle:@"推送设置" value:pushType selectionHandler:^(RERadioItem *item) {
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"推送设置" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"简单内容",@"详情内容", nil];
        sheet.tag = 1001;
        [sheet showInView:controller.view];
    }];
    [settingsSection addItem:pushStyleItem];
    
    NSString *disturbType;
    if (self.options.noDisturbStatus == ePushNotificationNoDisturbStatusDay) {
        disturbType = @"全天";
    }else if (self.options.noDisturbStatus == ePushNotificationNoDisturbStatusCustom){
        disturbType = @"自定义";
    }else{
        disturbType = @"关闭";
    }
    
    disturbItem = [RERadioItem itemWithTitle:@"免打扰设置" value:disturbType selectionHandler:^(RERadioItem *item) {
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"免打扰设置" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"全天",@"自定义",@"关闭", nil];
        sheet.tag = 1002;
        [sheet showInView:controller.view];
    }];
    [settingsSection addItem:disturbItem];
    
    
    btn = [[UIButton alloc]initWithFrame:CGRectMake(50, SCREEN_HIGHT - 150, SCREEN_WIDTH - 100, 50)];
    [btn setTitle:@"退出" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(LoginOutAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)LoginOutAction
{
    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 1001) {
        if (buttonIndex == 0) {
            pushStyleItem.value = @"简单内容";
            self.options.displayStyle = ePushNotificationDisplayStyle_simpleBanner;
        }else if (buttonIndex == 1){
            pushStyleItem.value = @"详情内容";
            self.options.displayStyle = ePushNotificationDisplayStyle_messageSummary;
        }
        [pushStyleItem reloadRowWithAnimation:UITableViewRowAnimationFade];
    }else if (actionSheet.tag == 1002){
        if (buttonIndex == 0) {
            disturbItem.value = @"全天";
            self.options.noDisturbStatus = ePushNotificationNoDisturbStatusDay;
        }else if (buttonIndex == 1){
            disturbItem.value = @"自定义";
            self.options.noDisturbStatus = ePushNotificationNoDisturbStatusCustom;
        }else if (buttonIndex == 2){
            disturbItem.value = @"关闭";
            self.options.noDisturbStatus = ePushNotificationNoDisturbStatusClose;
        }
        [disturbItem reloadRowWithAnimation:UITableViewRowAnimationFade];
    }
}

@end