//
//  UserCustomExtendView.m
//  Changliao
//
//  Created by metthew on 15/8/14.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UserCustomExtendView.h"
#import "EM+ChatMessageModel.h"
#import "UserCustomExtend.h"

@implementation UserCustomExtendView{
    UILabel *label;
}

+ (CGSize)sizeForContentWithMessage:(EM_ChatMessageModel *)message maxWidth:(CGFloat)maxWidth config:(EM_ChatMessageUIConfig *)config{
    return CGSizeMake(80, 30);
}

- (instancetype)init{
    self = [super init];
    if (self) {
        label = [[UILabel alloc]init];
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    label.frame = self.bounds;
}

- (void)setMessage:(EM_ChatMessageModel *)message{
    [super setMessage:message];
    UserCustomExtend *extend = (UserCustomExtend *)message.messageExtend.extendBody;
    label.text = extend.extendProperty;
}

@end