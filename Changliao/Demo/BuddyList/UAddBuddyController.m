//
//  UAddBuddyController.m
//  Changliao
//
//  Created by metthew on 15/9/16.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UAddBuddyController.h"

#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>

@interface UAddBuddyController()

@property (nonatomic, strong) UIButton *buddyButton;
@property (nonatomic, strong) UIButton *groupButton;
@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextView *messageView;

@end

@implementation UAddBuddyController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scroll = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:scroll];
    
    CGFloat y = 50;
    CGFloat width = self.view.frame.size.width - 30;
    
    self.buddyButton = [[UIButton alloc]initWithFrame:CGRectMake(15, y, width / 2 - 15, 44)];
    self.buddyButton.layer.borderWidth = 0.5;
    self.buddyButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.buddyButton.layer.cornerRadius = 6;
    self.buddyButton.selected = YES;
    [self.buddyButton setTitle:@"好友" forState:UIControlStateNormal];
    [self.buddyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.buddyButton setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [scroll addSubview:self.buddyButton];
    
    self.groupButton = [[UIButton alloc]initWithFrame:CGRectMake(30 + width / 2, y, width / 2 - 15, 44)];
    self.groupButton.layer.borderWidth = 0.5;
    self.groupButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.groupButton.layer.cornerRadius = 6;
    [self.groupButton setTitle:@"群" forState:UIControlStateNormal];
    [self.groupButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.groupButton setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [scroll addSubview:self.groupButton];
    
    y += 44 + 15;
    
    self.accountField = [[UITextField alloc]initWithFrame:CGRectMake(15, y, width, 44)];
    self.accountField.layer.borderWidth = 0.5;
    self.accountField.layer.borderColor = [UIColor grayColor].CGColor;
    self.accountField.layer.cornerRadius = 4;
    self.accountField.placeholder = @"账号";
    self.accountField.textAlignment = NSTextAlignmentCenter;
    [scroll addSubview:self.accountField];
    
    y += 44 + 15;
    
    self.messageView = [[UITextView alloc]initWithFrame:CGRectMake(15, y, width, 150)];
    self.messageView.layer.borderWidth = 0.5;
    self.messageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.messageView.layer.cornerRadius = 4;
    [scroll addSubview:self.messageView];
}



@end