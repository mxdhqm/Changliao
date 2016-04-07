//
//  UAccount.h
//  Changliao
//
//  Created by metthew on 15/9/5.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UAccount : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

+ (instancetype)currentAccount;
+ (BOOL)logoutCurrentAccount;

- (BOOL)setCurrentAccount;

@end