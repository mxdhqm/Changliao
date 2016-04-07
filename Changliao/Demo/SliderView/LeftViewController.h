//
//  LeftViewController.h
//  changliao
//
//  Created by cherish_pro on 16/2/28.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PushToVCDelegate <NSObject>

- (void)pushtovc:(id)vc;

@end

@interface LeftViewController : BaseViewController

@property (nonatomic, weak) id <PushToVCDelegate> delegate;

@end
