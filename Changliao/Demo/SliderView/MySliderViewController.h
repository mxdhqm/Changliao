//
//  MySliderViewController.h
//  changliao
//
//  Created by cherish_pro on 16/2/28.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"


@interface MySliderViewController : BaseViewController <PushToVCDelegate>

@property (nonatomic, strong) UIViewController * rootVC;
@property (nonatomic, strong) UIViewController * leftVC;
//@property (nonatomic, strong) UIViewController * rightVC;

@property (nonatomic, assign) CGFloat leftViewShowWidth;//左侧偏移量
//@property (nonatomic, assign) CGFloat rightViewShowWidth;//右侧偏移量
@property (nonatomic, assign) NSTimeInterval animationDuration;//滑动时间
@property (nonatomic, assign) BOOL showShadow;//是否有阴影

@property (nonatomic, assign) BOOL showingLeftVC;
//@property (nonatomic, assign) BOOL showingRightVC;


@property (nonatomic, copy) void (^btnAlphaBlock)(CGFloat alpha);//用来按钮隐藏

- (void)showLeftViewController:(BOOL)animated;//展示左边侧滑
//- (void)showRightViewController:(BOOL)animated;//展示右边侧滑
- (void)hideSlideViewController:(BOOL)animated;//取消侧滑

- (void)setPanON;  //打开左滑手势

- (void)setPanOff;  //关闭左滑手势


@end
