//
//  EM+ChatMessageBubble.h
//  Changliao
//
//  Created by metthew on 15/8/12.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EM_ChatMessageModel;
@class EM_ChatMessageContent;
@class EM_ChatMessageUIConfig;

@interface EM_ChatMessageBubble : UIView

@property (nonatomic, strong) EM_ChatMessageModel *message;
@property (nonatomic, strong) EM_ChatMessageUIConfig *config;

@property (nonatomic, strong, readonly) EM_ChatMessageContent *bodyView;
@property (nonatomic, strong, readonly) EM_ChatMessageContent *extendView;
@property (nonatomic, strong, readonly) UIImageView *backgroundView;

+ (CGSize )sizeForBubbleWithMessage:(EM_ChatMessageModel *)message maxWidth:(CGFloat)maxWidth config:(EM_ChatMessageUIConfig *)config;

- (instancetype)initWithBodyClass:(Class)bodyClass withExtendClass:(Class)extendClass;

@end