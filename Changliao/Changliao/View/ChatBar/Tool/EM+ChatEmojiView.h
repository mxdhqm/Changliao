//
//  EM+MessageEmojiView.h
//  Changliao
//
//  Created by metthew on 15/7/3.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "EM+ChatBaseView.h"

@protocol EM_ChatEmojiViewDelegate;

@interface EM_ChatEmojiView : EM_ChatBaseView

@property (nonatomic, weak) id<EM_ChatEmojiViewDelegate> delegate;

@end

@protocol EM_ChatEmojiViewDelegate <NSObject>

@required

- (void)didEmojiClicked:(NSString *)emoji;
- (void)didEmojiDeleteClicked;
- (void)didEmojiSendClicked;

@optional

@end