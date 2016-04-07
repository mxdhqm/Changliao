//
//  EM+ChatExplorerConnection.h
//  Changliao
//
//  Created by metthew on 15/8/18.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "HTTPConnection.h"

extern NSString * const kEMNotificationFileUpload;
extern NSString * const kEMNotificationFileDelete;
extern NSString * const kEMNotificationFileDownload;

typedef NS_ENUM(NSInteger, WiFiFileUploadState) {
    WiFiFileUploadStateStart = 0,
    WiFiFileUploadStateProcess,
    WiFiFileUploadStateEnd
};

@interface EM_ChatExplorerConnection : HTTPConnection


@end