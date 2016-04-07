//
//  UserCustomExtend.h
//  Changliao
//
//  Created by metthew on 15/8/14.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "EM+ChatMessageExtendBody.h"

#define kIdentifierForCustom               (@"kIdentifierForCustom")

@interface UserCustomExtend : EM_ChatMessageExtendBody

@property (nonatomic, copy) NSString *extendProperty;

@end