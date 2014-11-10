//
//  YFLoginController.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-10.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFLoginController.h"
#import "YFLoginTool.h"



@interface YFLoginController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *userPwd;

@end

@implementation YFLoginController
- (IBAction)loginOnClick:(UIButton *)sender {
    [MBProgressHUD showMessage:@"正在拼命登录..."];
    
    // 保存用户信息到沙盒中
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.userID.text forKey:YFUserAccount];
    [defaults setObject:self.userPwd.text forKey:YFUserPwd];

    [YFLoginTool LoginInfoWithParam:nil success:^(YFLogin *result) {
        [MBProgressHUD hideHUD];
        
        if (result.data) {
            [MBProgressHUD showSuccess:result.msg];
            // 保存用户信息
            [YFLoginTool saveUserInfo:result.userInfo];
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            
            if ([self.delegate respondsToSelector:@selector(openSliderWithUserInfo:)]) {
                [self.delegate openSliderWithUserInfo:result.userInfo];
            }
        }else{
            [MBProgressHUD showError:result.msg];
            self.userPwd.text = nil;
        }
        
    } failure:^(NSError *error) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"网络繁忙,请稍后再试..."];
    }];
    
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.userID];
    [center addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.userPwd];
}
- (void)textChange
{
    if (self.userID.hasText && self.userPwd.hasText) {
        self.login.enabled = YES;
    }else
    {
        self.login.enabled = NO;
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


// 点击其它地方让键盘回去
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.userID) {
        // 密码输入框变成第一响应者
        [self.userPwd becomeFirstResponder];
    } else
    {
        // 在密码框中按 return, 键盘回去,登录
        [textField resignFirstResponder];
        // 点击登录按钮
        [self loginOnClick:self.login];
    }
    
    return YES;
}


@end
