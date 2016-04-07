//
//  EM+MessageRecordView.h
//  Changliao
//
//  Created by metthew on 15/7/3.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "EM+ChatBaseView.h"

@protocol EM_ChatRecordViewDelegate;

@interface EM_ChatRecordView : EM_ChatBaseView

@property (nonatomic, weak) id<EM_ChatRecordViewDelegate> delegate;

@end

@protocol EM_ChatRecordViewDelegate <NSObject>

@required

- (BOOL)shouldRecord;
- (void)didRecordStart;
- (void)didRecording:(NSInteger)duration;
- (void)didRecordEnd:(NSString *)recordName path:(NSString *)recordPath duration:(NSInteger)duration;
- (void)didRecordCancel;
- (void)didRecordError:(NSError *)error;

- (void)didRecordPlay;
- (void)didRecordPlaying:(NSInteger)duration;
- (void)didRecordPlayStop;
@optional

@end