//
//  EM+ChatBaseController.h
//  Changliao
//
//  Created by metthew on 15/8/21.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EM_ChatBaseController : UIViewController

/**
 *  当前界面是否在显示
 */
@property (nonatomic,assign,readonly) BOOL isShow;
@property (nonatomic, assign) CGFloat offestY;

@end