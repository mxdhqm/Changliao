//
//  UAddBuddyController.m
//  Changliao
//
//  Created by metthew on 15/9/16.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "UAddBuddyController.h"

#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>
#import "EaseMobHeaders.h"
#import "EaseMob.h"

@interface UAddBuddyController()
{
    int addflag;
}

@property (nonatomic, strong) UIButton *buddyButton;
@property (nonatomic, strong) UIButton *groupButton;
@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextView *messageView;
@property (nonatomic, strong) UIButton *applyButton;

@property (nonatomic, strong) UIView *buddylineView;
@property (nonatomic, strong) UIView *grouplineView;


@end

@implementation UAddBuddyController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    self.title = @"添加好友";
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    addflag = 0;
    
    UIScrollView *scroll = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:scroll];

    self.buddyButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, 50)];
    [self.buddyButton setTitle:@"好友" forState:UIControlStateNormal];
    [self.buddyButton setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    [self.buddyButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [scroll addSubview:self.buddyButton];
    [self.buddyButton addTarget:self action:@selector(buddyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, 1, 50)];
    line.backgroundColor = [UIColor blackColor];
    line.alpha = 0.2;
    [scroll addSubview:line];
    
    self.groupButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 50)];
    [self.groupButton setTitle:@"群" forState:UIControlStateNormal];
    self.groupButton.titleLabel.textColor = [UIColor redColor];
    [self.groupButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.groupButton setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    [scroll addSubview:self.groupButton];
    [self.groupButton addTarget:self action:@selector(groupButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.buddylineView = [[UIView alloc]initWithFrame:CGRectMake(0, 48, SCREEN_WIDTH/2, 2)];
    self.buddylineView.backgroundColor = MAIN_COLOR;
    [scroll addSubview:self.buddylineView];
    
    self.grouplineView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 48, SCREEN_WIDTH/2, 2)];
    self.grouplineView.backgroundColor = [UIColor lightGrayColor];
    [scroll addSubview:self.grouplineView];
    
    self.accountField = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 44)];
    self.accountField.layer.borderWidth = 0.5;
    self.accountField.layer.borderColor = [UIColor grayColor].CGColor;
    self.accountField.layer.cornerRadius = 4;
    self.accountField.placeholder = @"账号";
    self.accountField.textAlignment = NSTextAlignmentCenter;
    [scroll addSubview:self.accountField];
    
    self.messageView = [[UITextView alloc]initWithFrame:CGRectMake(20, 114, SCREEN_WIDTH - 40, 200)];
    self.messageView.layer.borderWidth = 0.5;
    self.messageView.layer.borderColor = [UIColor grayColor].CGColor;
    self.messageView.layer.cornerRadius = 4;
    [scroll addSubview:self.messageView];
    
    self.applyButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 330, SCREEN_WIDTH - 40, 40)];
    self.applyButton.layer.borderWidth = 0.5;
    self.applyButton.layer.borderColor = [UIColor grayColor].CGColor;
    self.applyButton.layer.cornerRadius = 4;
    [self.applyButton setTitle:@"添加" forState:UIControlStateNormal];
    [self.applyButton setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    [self.applyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [self.applyButton addTarget:self action:@selector(applyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:self.applyButton];
    
}



-(void)buddyButtonClick
{
    [self.buddyButton setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    [self.groupButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.buddylineView.backgroundColor = MAIN_COLOR;
    self.grouplineView.backgroundColor = [UIColor lightGrayColor];
    addflag = 0;
}

-(void)groupButtonClick
{
    [self.groupButton setTitleColor:MAIN_COLOR forState:UIControlStateNormal];
    [self.buddyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.grouplineView.backgroundColor = MAIN_COLOR;
    self.buddylineView.backgroundColor = [UIColor lightGrayColor];
    addflag = 1;
}

-(void)applyButtonClick
{
    if (addflag == 0) {
        if (self.accountField.text.length > 0 && self.accountField.text) {
            EMError *error;
            [[EaseMob sharedInstance].chatManager addBuddy:self.accountField.text message:self.messageView.text error:&error];
            if (error) {
                
            }
            else{
                [self.navigationController popViewControllerAnimated:YES];
            }
            
        }
        
        
        
    }
    else if(addflag == 1)
    {
        
        
    }
    


}

@end