//
//  EM+ChatBuddy.h
//  Changliao
//
//  Created by metthew on 15/8/24.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "EM+ChatOpposite.h"

@interface EM_ChatBuddy : EM_ChatOpposite

/**
 *  昵称
 */
@property (nonatomic, copy) NSString *nickName;

/**
 *  备注名称
 */
@property (nonatomic, copy) NSString *remarkName;

@end