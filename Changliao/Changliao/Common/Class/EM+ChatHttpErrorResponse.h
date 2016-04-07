//
//  EM+ChatHttpErrorResponse.h
//  Changliao
//
//  Created by metthew on 15/8/19.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "HTTPErrorResponse.h"

@interface EM_ChatHttpErrorResponse : HTTPErrorResponse

@property (nonatomic, copy, readonly) NSString *errorMessage;

- (instancetype)initWithErrorCode:(int)httpErrorCode errorMessage:(NSString *)msg;
- (void)setHeaderField:(id)value key:(NSString *)key;

@end