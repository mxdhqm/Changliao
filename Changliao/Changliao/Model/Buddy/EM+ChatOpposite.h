//
//  EM_ChatOpposite.h
//  Changliao
//
//  Created by metthew on 15/8/25.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "EM+ChatConversationObject.h"

typedef NS_ENUM(NSInteger, EMChatOppositeType) {
    EMChatOppositeTypeChat,
    EMChatOppositeTypeGroup,
    EMChatOppositeTypeRoom
};

@interface EM_ChatOpposite : EM_ChatConversationObject

@property (nonatomic, assign, readonly) EMChatOppositeType oppositeType;

@end