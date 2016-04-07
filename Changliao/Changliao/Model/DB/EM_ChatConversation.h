//
//  EM_ChatConversation.h
//  Changliao
//
//  Created by metthew on 15/8/7.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <CoreData/CoreData.h>

#define FIELD_NAME_CHATTER   @"chatter"
#define FIELD_NAME_EDITOR    @"editor"
#define FIELD_NAME_TYPE      @"type"

@interface EM_ChatConversation : NSManagedObject

@property (nonatomic, retain) NSString * chatter;
@property (nonatomic, retain) NSString * editor;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSDate   * modify;

@end