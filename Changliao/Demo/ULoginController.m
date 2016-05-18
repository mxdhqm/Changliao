//
//  ULoginController.m
//  Changliao
//
//  Created by metthew on 15/9/5.
//  Copyright (c) 2015年 metthew. All rights reserved.
//

#import "ULoginController.h"

#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>
#import <JVFloatLabeledTextField/JVFloatLabeledTextField.h>
#import <Toast/UIView+Toast.h>
#import <EaseMobSDKFull/EaseMob.h>

#define PADDING         (15)
#define CELL_HEIGHT     (50)
#define FIELD_HEIGHT    (44)

@interface ULoginController()<UITextFieldDelegate,UIAlertViewDelegate,EMChatManagerDelegate>

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UITextField *accountField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;

@end

@implementation ULoginController

- (instancetype)init{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:215.0/256.0 green:215.0/256.0 blue:215.0/256.0 alpha:1.0];
    
    UIScrollView *scroll = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:scroll];
    
    CGFloat y = 100;
    CGFloat width = self.view.frame.size.width - PADDING * 2;
    
    _iconView = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 100) / 2, y, 150, 150)];
    _iconView.image = [UIImage imageNamed:@"icon"];
    [scroll addSubview:_iconView];
    
    y += (_iconView.frame.size.height + PADDING);
    
    UIView *accountCell = [[UIView alloc]initWithFrame:CGRectMake(PADDING, y, width, CELL_HEIGHT)];
    accountCell.layer.cornerRadius = 6;
    accountCell.layer.borderColor = [UIColor grayColor].CGColor;
    accountCell.layer.borderWidth = .5;
    [scroll addSubview:accountCell];
    
    _accountField = [[JVFloatLabeledTextField alloc]initWithFrame:CGRectMake(PADDING, (CELL_HEIGHT - FIELD_HEIGHT) / 2, width - PADDING * 2, FIELD_HEIGHT)];
    _accountField.placeholder = @"用户名";
    _accountField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _accountField.returnKeyType = UIReturnKeyNext;
    _accountField.delegate = self;
    [accountCell addSubview:_accountField];
    
    y += (accountCell.frame.size.height + PADDING);
    
    UIView *passwordCell = [[UIView alloc]initWithFrame:CGRectMake(PADDING, y, width, CELL_HEIGHT)];
    passwordCell.layer.cornerRadius = 6;
    passwordCell.layer.borderColor = [UIColor grayColor].CGColor;
    passwordCell.layer.borderWidth = .5;
    [scroll addSubview:passwordCell];
    
    _passwordField = [[JVFloatLabeledTextField alloc]initWithFrame:CGRectMake(PADDING, (CELL_HEIGHT - FIELD_HEIGHT) / 2, width - PADDING * 2, FIELD_HEIGHT)];
    _passwordField.placeholder = @"密码";
    _passwordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordField.secureTextEntry = YES;
    _passwordField.returnKeyType = UIReturnKeyGo;
    _passwordField.delegate = self;
    [passwordCell addSubview:_passwordField];
    
    y += (passwordCell.frame.size.height + PADDING);
    
    _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(PADDING, y, (width - PADDING) / 2, FIELD_HEIGHT)];
    _loginButton.layer.cornerRadius = 6;
    _loginButton.layer.borderColor = [UIColor grayColor].CGColor;
    _loginButton.layer.borderWidth = .5;
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_loginButton addTarget:self action:@selector(loginEaseMob) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:_loginButton];
    
    _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(_loginButton.frame.size.width + PADDING * 2, y, (width - PADDING) / 2, FIELD_HEIGHT)];
    _registerButton.layer.cornerRadius = 6;
    _registerButton.layer.borderColor = [UIColor grayColor].CGColor;
    _registerButton.layer.borderWidth = .5;
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [_registerButton addTarget:self action:@selector(registerEaseMob) forControlEvents:UIControlEventTouchUpInside];
    [scroll addSubview:_registerButton];
    
    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self dismissKeyboard];
}

- (void)dealloc{
    [[EaseMob sharedInstance].chatManager removeDelegate:self];
    _iconView = nil;
    _accountField = nil;
    _passwordField = nil;
    _loginButton = nil;
    _registerButton = nil;
}

//登录
- (void)loginEaseMob{
    [self dismissKeyboard];
    
    NSString *account = [self.accountField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (!account || account.length == 0) {
        [self.view makeToast:@"用户名为必填项"];
        return;
    }
    
    if (!password || password.length == 0) {
        [self.view makeToast:@"密码为必填项"];
        return;
    }
    _loginButton.enabled = NO;
    _registerButton.enabled = NO;
    //登录的回调在AppDelegate中实现
    [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:account password:password];
}

//注册
- (void)registerEaseMob{
    [self dismissKeyboard];
    NSString *account = [self.accountField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (!account || account.length == 0) {
        [self.view makeToast:@"用户名为必填项"];
        return;
    }
    
    if (!password || password.length == 0) {
        [self.view makeToast:@"密码为s必填项"];
        return;
    }
    
    _loginButton.enabled = NO;
    _registerButton.enabled = NO;
    NSString *message = [NSString stringWithFormat:@"信息确认\n用户名：%@\n密码：%@",account,password];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"注册" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)dismissKeyboard{
    if (self.accountField.isFirstResponder) {
        [self.accountField resignFirstResponder];
    }
    if (self.passwordField.isFirstResponder) {
        [self.passwordField resignFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.accountField) {
        [self.passwordField becomeFirstResponder];
    }else{
        [self loginEaseMob];
    }
    return YES;
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSString *account = [self.accountField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        //注册回调在AppDelegate中实现
        [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:account password:password];
    }
}

#pragma mark - EMChatManagerLoginDelegate
- (void)didLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error{
    _loginButton.enabled = YES;
    _registerButton.enabled = YES;
}

- (void)didRegisterNewAccount:(NSString *)username password:(NSString *)password error:(EMError *)error{
    _loginButton.enabled = YES;
    _registerButton.enabled = YES;
}

@end