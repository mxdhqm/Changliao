//
//  LeftViewController.m
//  changliao
//
//  Created by cherish_pro on 16/2/28.
//  Copyright © 2016年 metthew. All rights reserved.
//

#import "LeftViewController.h"
#import "MySliderViewController.h"
//#import "testViewController.h"

@interface LeftViewController ()
{
    UIButton *btn;
    MySliderViewController *slidervc;
}
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];

    [self initView];
    slidervc = (MySliderViewController *)[[self parentViewController] parentViewController];
   
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initView
{
    
    btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 64, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)click
{
//        [slidervc hideSlideViewController:YES];
//
//        UIViewController *vc = [[UIViewController alloc]init];
//        vc.view.backgroundColor = [UIColor redColor];
//        vc.title = @"test";
//        [vc setHidesBottomBarWhenPushed:YES];
//        [self.navigationController pushViewController:vc animated:YES];
//    
//    if ([self.delegate respondsToSelector:@selector(pushtovc:)]) {
//        testViewController *vc = [[testViewController alloc]init];
//        vc.view.backgroundColor = [UIColor yellowColor];
//        [self.delegate pushtovc:vc];
//    }
}


@end
