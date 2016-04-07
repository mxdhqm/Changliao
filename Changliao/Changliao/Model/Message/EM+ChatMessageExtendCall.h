//
//  EM+ChatMessageCall.h
//  Changliao
//
//  Created by metthew on 15/9/10.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "EM+ChatMessageExtendBody.h"

#define kIdentifierForCall                    (@"kIdentifierForCall")

@interface EM_ChatMessageExtendCall : EM_ChatMessageExtendBody

@property (nonatomic, assign) NSInteger callType;

@end