//
//  NSString+Base64.h
//  Changliao
//
//  Created by metthew on 15/8/20.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Base64)

+ (NSString *)base64StringFromText:(NSString *)text;

+ (NSString *)textFromBase64String:(NSString *)base64;

- (NSString *)toBase64;

- (NSString *)fromBase64;

- (NSString *)toBase64WithNative;

- (NSString *)fromBase64WithNative;

@end