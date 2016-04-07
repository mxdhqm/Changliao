//
//  EM_ChatExtend.h
//  Changliao
//
//  Created by metthew on 15/9/10.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <CoreData/CoreData.h>

#define FIELD_NAME_IDENTIFIER               (@"extendIdentifier")
#define FIELD_NAME_CLASS                    (@"extendClass")
#define FIELD_NAME_VIEW                     (@"extendView")

@interface EM_ChatExtend : NSManagedObject

@property (nonatomic, retain) NSString *extendIdentifier;
@property (nonatomic, retain) NSString *extendClass;
@property (nonatomic, retain) NSString *extendView;

@end