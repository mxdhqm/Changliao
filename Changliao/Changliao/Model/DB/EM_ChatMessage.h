//
//  EM_ChatMessage.h
//  Changliao
//
//  Created by metthew on 15/9/10.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <CoreData/CoreData.h>

#define FIELD_NAME_MESSAGE                  (@"messageId")
#define FIELD_NAME_DETAILS                  (@"details")
#define FIELD_NAME_COLLECTED                (@"collected")
#define FIELD_NAME_CHECKING                 (@"checking")

@interface EM_ChatMessage : NSManagedObject

@property (nonatomic, retain) NSString *chatter;
@property (nonatomic, retain) NSString *messageId;
@property (nonatomic, assign) BOOL details;
@property (nonatomic, assign) BOOL collected;
@property (nonatomic, assign) BOOL checking;

@end