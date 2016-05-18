//
//  AppDelegate.m
//  Changliao
//
//  Created by metthew on 15/6/30.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "AppDelegate.h"

#import "MySliderViewController.h"
#import "LeftViewController.h"
#import "MainController.h"
#import "ULoginController.h"
#import "UAccount.h"

#import "EaseMobUIClient.h"
#import "EM+Common.h"
#import "DDLog.h"
#import "DDTTYLogger.h"

#import "UserCustomExtend.h"

#import <EaseMobSDKFull/EaseMob.h>
#import <Toast/UIView+Toast.h>

#define EaseMob_AppKey (@"9901#changliao")

#ifdef DEBUG
#define EaseMob_APNSCertName (@"dev")
#else
#define EaseMob_APNSCertName (@"apns_pro")
#endif

@interface AppDelegate ()<EMChatManagerDelegate>
{
    BOOL isLogin;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    UIViewController *rootController;
    
    BOOL isAutoLogin = [[EaseMob sharedInstance].chatManager isAutoLoginEnabled];
    if (isAutoLogin) {
//        rootController = [[MainController alloc]init];
        
        MainController *rootvc = [[MainController alloc]init];
        LeftViewController *leftvc = [[LeftViewController alloc]init];
        MySliderViewController *slidervc = [[MySliderViewController alloc]init];
        slidervc.rootVC = rootvc;
        slidervc.leftVC = leftvc;
        leftvc.delegate = slidervc;
        rootController = [[BaseNavViewController alloc]initWithRootViewController:slidervc];
        isLogin = true;
//        if (isLogin) {
//            NSLog(@"yes");
//        }
//        else
//        {
//            NSLog(@"no");
//        }
        
    }else{
        rootController = [[UINavigationController alloc]initWithRootViewController:[[ULoginController alloc]init]];
        isLogin = false;
        
    }
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
    
    [[EaseMob sharedInstance] registerSDKWithAppKey:EaseMob_AppKey apnsCertName:EaseMob_APNSCertName];
    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
    [[EaseMobUIClient sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    [[EaseMobUIClient sharedInstance] registerForRemoteNotificationsWithApplication:application];
    
    [[EaseMobUIClient sharedInstance] registerExtendClass:[UserCustomExtend class]];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    return YES;
}

- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application{
    [[EaseMobUIClient sharedInstance] applicationProtectedDataWillBecomeUnavailable:application];
}

- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)application{
    [[EaseMobUIClient sharedInstance] applicationProtectedDataDidBecomeAvailable:application];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [[EaseMobUIClient sharedInstance] applicationWillResignActive:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [[EaseMobUIClient sharedInstance] applicationDidBecomeActive:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EaseMobUIClient sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EaseMobUIClient sharedInstance] applicationDidEnterBackground:application];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    [[EaseMobUIClient sharedInstance] applicationDidReceiveMemoryWarning:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[EaseMobUIClient sharedInstance] applicationWillTerminate:application];
}

//notiications
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    [[EaseMob sharedInstance] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    [[EaseMob sharedInstance] application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [[EaseMobUIClient sharedInstance] application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    [[EaseMobUIClient sharedInstance] application:application didReceiveLocalNotification:notification];
}

- (void)changeRootControllerToMain{
    BACK(^{
        sleep(1);
        MAIN(^{
//            if (![self.window.rootViewController isMemberOfClass:[MainController class]]) {
//                self.window.rootViewController = [[MainController alloc]init];
            if (isLogin) {
                isLogin = true;
                MainController *rootvc = [[MainController alloc]init];
                LeftViewController *leftvc = [[LeftViewController alloc]init];
                MySliderViewController *slidervc = [[MySliderViewController alloc]init];
                slidervc.rootVC = rootvc;
                slidervc.leftVC = leftvc;
                leftvc.delegate = slidervc;
                BaseNavViewController *rootController = [[BaseNavViewController alloc]initWithRootViewController:slidervc];
                self.window.rootViewController = rootController;
            }
        });
    });
}

- (void)changeRootControllerToLogin{
    BACK(^{
        sleep(1);
        MAIN(^{
//            if ([self.window.rootViewController isMemberOfClass:[MainController class]]) {
            if (!isLogin){
                isLogin = false;
                self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[ULoginController alloc]init]];
            }
        });
    });
}

#pragma mark - EMChatManagerLoginDelegate
- (void)didLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error{
    if (!error) {
        [[EaseMob sharedInstance].chatManager enableAutoLogin];
        [self.window makeToast:@"登录成功"];
        isLogin = true;
        [self changeRootControllerToMain];
    }else{
        isLogin = false;
        [self.window makeToast:error.description];
    }
}

- (void)willAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error{
    if (!error) {
        [self.window makeToast:@"自动登录中..."];
        isLogin = true;
    }else{
        [self.window makeToast:error.description];
        isLogin = false;
        [self changeRootControllerToLogin];
    }
}

- (void)didAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error{
    if (!error) {
        [self.window makeToast:@"自动登录完成"];
        isLogin = true;
    }else{
        [self.window makeToast:error.description];
        isLogin = false;
        [self changeRootControllerToLogin];
    }
}

- (void)didLogoffWithError:(EMError *)error{
    if (!error) {
        [self.window makeToast:@"已注销"];
        isLogin = false;
        [self changeRootControllerToLogin];
    }
}

- (void)didLoginFromOtherDevice{
    [self.window makeToast:@"您的账号已在其他设备登录"];
    isLogin = false;
    [self changeRootControllerToLogin];
}

- (void)didRemovedFromServer{
    
}

- (void)didRegisterNewAccount:(NSString *)username password:(NSString *)password error:(EMError *)error{
    if (!error) {
        [self.window makeToast:@"注册成功"];
        isLogin = true;
        [self changeRootControllerToMain];
    }else{
        isLogin = false;
        [self.window makeToast:error.description];
    }
}


// 好友申请回调
- (void)didReceiveBuddyRequest:(NSString *)username message:(NSString *)message
{
    if (!username) {
        return;
    }
    
    if (!message) {
        message = [NSString stringWithFormat:NSLocalizedString(@"friend.somebodyAddWithName", @"%@ add you as a friend"), username];
    }
    
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:@{@"title":username, @"username":username, @"applyMessage":message, @"applyStyle":[NSNumber numberWithInteger:ApplyStyleFriend]}];
    [[UApplyViewController shareController] addNewApply:dic];
//    if (self.mainController) {
//        [self.mainController setupUntreatedApplyCount];
//    }
}






@end