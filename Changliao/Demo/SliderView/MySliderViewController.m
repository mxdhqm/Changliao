//
//  MySliderViewController.m
//  changliao
//
//  Created by cherish_pro on 16/2/28.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import "MySliderViewController.h"

@interface MySliderViewController () <UIGestureRecognizerDelegate>
{
    UIView * _baseView;
    UIView * _currentView;//rootVC.view
    
    CGPoint _startPanPoint;
    CGPoint _lastPanPoint;
    
    BOOL _panMovingRightOrLeft;//YES是向右滑
    
    UIGestureRecognizer * _panGes;
    UIGestureRecognizer * _tapGes;
    
    NSTimeInterval animatedTime;
}

@end

@implementation MySliderViewController

- (id)init
{
    if (self = [super init]) {
        _leftViewShowWidth = 260;
        //        _rightViewShowWidth = 260;
        
        _animationDuration = 0.35;
        _showShadow = true;
        
        _panMovingRightOrLeft = false;
        _lastPanPoint = CGPointZero;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _baseView = self.view;
    
    if (_currentView != _rootVC.view) {
        [_currentView removeFromSuperview];
        
        _currentView = _rootVC.view;
        _currentView.frame = _baseView.bounds;
        
        [_baseView addSubview:_currentView];
    }
    
    _panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    
    [_baseView addGestureRecognizer:_panGes];
    
    _tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    _tapGes.delegate = self;
    
    [_baseView addGestureRecognizer:_tapGes];
    _tapGes.enabled = NO;
    
//    [self willShowRightViewController];
    [self willShowLeftViewController];
}

#pragma mark - self 的 child VC

- (void)setRootVC:(UIViewController *)rootVC
{
    if (_rootVC != rootVC) {
        if (_rootVC) {
            [_rootVC removeFromParentViewController];
        }
        _rootVC = rootVC;
        if (_rootVC) {
            [self addChildViewController:_rootVC];
        }
    }
}

- (void)setLeftVC:(UIViewController *)leftVC
{
    if (_leftVC != leftVC) {
        if (_leftVC) {
            [_leftVC removeFromParentViewController];
        }
        _leftVC = leftVC;
        if (_leftVC) {
            [self addChildViewController:_leftVC];
        }
    }
    
}

//- (void)setRightVC:(UIViewController *)rightVC
//{
//    if (_rightVC != rightVC) {
//        if (_rightVC) {
//            [_rightVC removeFromParentViewController];
//        }
//        _rightVC = rightVC;
//
//        if (_rightVC) {
//            [self addChildViewController:_rightVC];
//        }
//    }
//
//}


#pragma mark - 阴影

-(void)showShadow:(BOOL)show
{
    _currentView.layer.shadowOpacity = show ? 0.8f : 0.0f;
    
    if (show) {
        _currentView.layer.cornerRadius = 0.f;
        _currentView.layer.shadowOffset = CGSizeZero;
        _currentView.layer.shadowRadius = 4.0f;
        _currentView.layer.shadowPath = [UIBezierPath bezierPathWithRect:_currentView.bounds].CGPath;
    }
}

#pragma mark - show OR hide View

- (void)willShowLeftViewController
{
    //    if (_rightVC && _rightVC.view.superview) {
    //        _rightVC.view.hidden = YES;
    //        [_baseView sendSubviewToBack:_rightVC.view];
    //    }
    
    if (!_leftVC || _leftVC.view.superview) {
        _leftVC.view.hidden = NO;
        return;
    }
    
    _leftVC.view.frame = _baseView.bounds;
    [_baseView insertSubview:_leftVC.view belowSubview:_currentView];
}

- (void)willShowRightViewController
{
    if (_leftVC && _leftVC.view.superview) {
        _leftVC.view.hidden = YES;
        [_baseView sendSubviewToBack:_leftVC.view];
    }
    
    //    if (!_rightVC || _rightVC.view.superview) {
    //        _rightVC.view.hidden = NO;
    //        return;
    //    }
    
    //    _rightVC.view.frame = _baseView.bounds;
    //    [_baseView insertSubview:_rightVC.view belowSubview:_currentView];
}

- (void)showLeftViewController:(BOOL)animated
{
    if (!_leftVC) {
        return;
    }
    self.showingLeftVC = YES;
    
    [self willShowLeftViewController];
    
    //    [_baseView sendSubviewToBack:_rightVC.view];
    
    animatedTime = 0;
    
    if (animated) {
        animatedTime = ABS(_leftViewShowWidth - _currentView.frame.origin.x) / _leftViewShowWidth * _animationDuration;
    }
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView animateWithDuration:animatedTime animations:^{
        [self layoutCurrentViewWithOffset:_leftViewShowWidth];
        [self showShadow:_showShadow];
    } completion:^(BOOL finished) {
        _tapGes.enabled = YES;
    }];
}

//- (void)showRightViewController:(BOOL)animated
//{
//    if (!_rightVC) {
//        return;
//    }
//    self.showingRightVC = YES;
//
//    [self willShowRightViewController];
//
//    [_baseView sendSubviewToBack:_leftVC.view];
//
//    NSTimeInterval animatedTime = 0;
//    if (animated) {
//        animatedTime = ABS(_rightViewShowWidth + _currentView.frame.origin.x) / _rightViewShowWidth * _animationDuration;
//    }
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView animateWithDuration:animatedTime animations:^{
//        [self layoutCurrentViewWithOffset:-_rightViewShowWidth];
//
//        [self showShadow:_showShadow];
//
//    } completion:^(BOOL finished) {
//        _tapGes.enabled = YES;
//    }];
//}

- (void)hideSlideViewController:(BOOL)animated
{
    [self showShadow:false];
    //    NSTimeInterval animatedTime = 0.3;
    //    if (animated) {
    //        animatedTime = ABS(_currentView.frame.origin.x / (_currentView.frame.origin.x > 0 ? _leftViewShowWidth : _rightViewShowWidth)) * _animationDuration;
    //    }
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView animateWithDuration:animatedTime animations:^{
        [self layoutCurrentViewWithOffset:0];
        
    } completion:^(BOOL finished) {
        //        self.showingRightVC = NO;
        self.showingLeftVC = NO;
    }];
    
}

#pragma mark - 手势响应函数

- (void)pan:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        _startPanPoint = _currentView.frame.origin;
        if (_currentView.frame.origin.x == 0) {
            [self showShadow:_showShadow];
        }
        CGPoint velocity = [pan velocityInView:_baseView];
        if (velocity.x > 0 && _startPanPoint.x == 0) {
            _panMovingRightOrLeft = true;
            [self willShowLeftViewController];
        }else if (velocity.x < 0 && _startPanPoint.x == 0)
        {
            _panMovingRightOrLeft = false;
            [self willShowRightViewController];
        }
        return;
    }
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint currentPosition = [pan translationInView:_baseView];
        CGFloat offset = _startPanPoint.x + currentPosition.x;
        
        //        if (offset > 0) {//向右滑
        //
        //            if (_leftVC && _leftVC.view.superview && _rightVC.view.hidden) {
        //                offset = offset > _leftViewShowWidth ? _leftViewShowWidth : offset;
        //            }else
        //            {
        //                offset = 0;
        //            }
        //        }else
        if (offset < 0 )//向左滑
        {
            //            if (_rightVC && _rightVC.view.superview && _leftVC.view.hidden) {
            //                offset = offset < -_rightViewShowWidth ? -_rightViewShowWidth : offset;
            //            }else
            {
                offset = 0;
            }
        }
        
        
        if (offset != _currentView.frame.origin.x) {
            [self layoutCurrentViewWithOffset:offset];
        }
        
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        //        if (_currentView.frame.origin.x != 0 && _currentView.frame.origin.x != _leftViewShowWidth && _currentView.frame.origin.x != -_rightViewShowWidth) {
        if (_panMovingRightOrLeft && _currentView.frame.origin.x > _leftViewShowWidth / 3) {
            [self showLeftViewController:true];
            //            }else if (!_panMovingRightOrLeft && _currentView.frame.origin.x < -_rightViewShowWidth / 3)
            //            {
            //                [self showRightViewController:true];
        }else
        {
            [self hideSlideViewController:YES];
        }
    }else if (_currentView.frame.origin.x == 0)
    {
        [self showShadow:false];
    }
    _lastPanPoint = CGPointZero;
    //    }
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    [self hideSlideViewController:YES];
    tap.enabled = NO;
}


- (void)layoutCurrentViewWithOffset:(CGFloat)offset
{
    if (_showShadow) {
        _currentView.layer.shadowPath = [UIBezierPath bezierPathWithRect:_currentView.bounds].CGPath;
    }
    
    static CGFloat h2w = 0;
    if (h2w == 0) {
        h2w = _baseView.frame.size.height / _baseView.frame.size.width;
    }
    
    CGFloat scale = ABS(900 - ABS(offset)) / 900;
    //最小为0.71
    CGAffineTransform transS = CGAffineTransformMakeScale(scale, scale);
    CGAffineTransform transT = CGAffineTransformMakeTranslation(offset, 0);
    
    CGAffineTransform conT = CGAffineTransformConcat(transT, transS);
    
    _currentView.transform = conT;
    
    if (self.btnAlphaBlock) {
        self.btnAlphaBlock(scale);
    }
    
    //    _currentView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //    CGFloat totalWidth = _baseView.frame.size.width;
    //    CGFloat totalHeight = _baseView.frame.size.height;
    //
    //    if (offset > 0) {//向右滑的
    //        [_currentView setFrame:CGRectMake(offset, _baseView.bounds.origin.y + (totalHeight * (1 - scale) / 2), totalWidth * scale, totalHeight * scale)];
    //    }else{//向左滑的
    //        [_currentView setFrame:CGRectMake(_baseView.frame.size.width * (1 - scale) + offset, _baseView.bounds.origin.y + (totalHeight*(1 - scale) / 2), totalWidth * scale, totalHeight * scale)];
    //    }
    
}

- (void)setPanON
{
    [_baseView addGestureRecognizer:_panGes];
}

- (void)setPanOff
{
    [_baseView removeGestureRecognizer:_panGes];
}

#pragma mark - 手势代理函数

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.navigationBarHidden = YES;
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:0.25 animations:^{
        self.navigationController.navigationBarHidden = NO;
    }];
}


#pragma mark - push代理

- (void)pushtovc:(id)vc
{
    [self.navigationController pushViewController:vc animated:YES];
}


@end
