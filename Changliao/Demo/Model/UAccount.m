//
//  UAccount.m
//  Changliao
//
//  Created by metthew on 15/9/5.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UAccount.h"

#define kCurrentAccount         (@"currentAccount")
#define kAccountName            (@"accountName")
#define kAccountPassword        (@"accountPassword")

@implementation UAccount


+ (instancetype)currentAccount{
    NSString *accountStr = [[NSUserDefaults standardUserDefaults] stringForKey:kCurrentAccount];
    if (accountStr && accountStr.length > 0) {
        
        NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:kAccountName];
        NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:kAccountPassword];
        
        UAccount *account = [[UAccount alloc]init];
        account.account = accountStr;
        account.password = password;
        account.name = name;
        
        return account;
    }
    return nil;
}
+ (BOOL)logoutCurrentAccount{
    NSString *accountStr = [[NSUserDefaults standardUserDefaults] stringForKey:kCurrentAccount];
    if (accountStr && accountStr.length > 0) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kAccountPassword];
        return [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        return YES;
    }
    return NO;
}

- (BOOL)setCurrentAccount{
    if (self.account && self.password) {
        [[NSUserDefaults standardUserDefaults] setObject:self.account forKey:kCurrentAccount];
        [[NSUserDefaults standardUserDefaults] setObject:self.password forKey:kAccountPassword];
        return [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return NO;
}

@end