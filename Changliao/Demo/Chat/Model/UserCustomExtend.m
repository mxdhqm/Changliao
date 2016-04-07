//
//  UserCustomExtend.m
//  Changliao
//
//  Created by metthew on 15/8/14.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UserCustomExtend.h"
#import "UserCustomExtendView.h"

@implementation UserCustomExtend

+ (NSString *)identifierForExtend{
    return kIdentifierForCustom;
}

+ (Class)viewForClass{
    return [UserCustomExtendView class];
}

+ (BOOL)showBody{
    return YES;
}

+ (BOOL)showExtend{
    return NO;
}

- (instancetype)init{
    self = [super init];
    if(self){
        self.extendProperty = @"这是扩展属性";
    }
    return self;
}

@end