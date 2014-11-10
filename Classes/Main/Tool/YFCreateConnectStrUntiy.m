//
//  YFCreateConnectStrUntiy.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCreateConnectStrUntiy.h"
#import <CommonCrypto/CommonDigest.h>

// 复用代码抽宏
#define oriApiSigValue [NSString stringWithFormat:@"%@%@%@%@", nonce, timeSp, api_key, api_secret]
#define api_sig [self md5:api_sig_value]
#define oriLoginStr [NSString stringWithFormat:@"?nonce=%@&timestamp=%@&api_key=%@&api_sig=%@", nonce, timeSp, api_key, api_sig]
#define oriBV [NSString stringWithFormat:@"&version=%@", buludVersion]


@implementation YFCreateConnectStrUntiy


+ (NSString *)CreateStr:(NSString *)tag{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    
    //登录的时候需要一些参数
    // 测试用
//    NSString *api_key = @"uyW3d8Fu";
//    NSString *api_secret = @"632db6568d5ce53af38bb011935bf6e1";
    
    
    //随机值()
    NSString *nonce = [NSString stringWithFormat:@"%d", (int)arc4random()%10000000];
    
    
    //时间撮
    //NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    //获得版本信息
    //获取当前软件版本，IOS系统版本
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *buludVersion = [infoDictionary objectForKey:@"CFBundleVersion"];
    
    NSString *loginStr = nil;
    NSString *api_sig_value;
    
    if ([@"login" isEqualToString:tag]) {
        
        api_sig_value = oriApiSigValue;
        
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        
#warning 待修改
        
        NSString *loginUserName = [defaults objectForKey:YFUserAccount];
        NSString *loginPassword = [defaults objectForKey:YFUserPwd];
        
        
        loginStr = [NSString stringWithFormat:@"%@&uname=%@&passwd=%@%@", oriLoginStr, loginUserName, loginPassword, oriBV];
        
        
    }else if([@"regist" isEqualToString:tag]){
        //注册
        
        api_sig_value = oriApiSigValue;
        
#warning 待修改
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        NSString *registUserName = [defaults objectForKey:@"JKXY_REGIST_USERNAME"];
        NSString *registPassword = [defaults objectForKey:@"JKXY_REGIST_PASSWORD"];
        NSString *registEmail = [defaults objectForKey:@"JKXY_REGIST_EMAIL"];
        
        loginStr = [NSString stringWithFormat:@"%@&uname=%@&passwd=%@&email=%@%@", oriLoginStr, registUserName, registPassword, registEmail, oriBV];
        
        
    }else if ([@"other" isEqualToString:tag]){
        //判断用户是否已经登录
        NSString *isLogin = [defaults objectForKey:@"login_tag"];
        if ([@"TRUE" isEqualToString:isLogin]) {
            
#warning 待修改
            //登录成功
            NSString *user_token = [defaults objectForKey:@"JKXY_USER_token"];
            NSString *uid = [defaults objectForKey:@"JKXY_USER_uid"];
            
            api_sig_value = [NSString stringWithFormat:@"%@%@", oriApiSigValue, user_token];
            
            loginStr = [NSString stringWithFormat:@"%@&uid=%@%@", oriLoginStr, uid, oriBV];
            
        }else{
            api_sig_value = oriApiSigValue;
            
            loginStr = [NSString stringWithFormat:@"%@%@", oriLoginStr, oriBV];
        }
    }else if([@"pay_back" isEqualToString:tag]){
        //当为支付回调的时候，加入订单做为MD5加密数据
        //判断用户是否已经登录
        NSString *isLogin = [defaults objectForKey:@"login_tag"];
        
        //获取订单ID
        NSString *productid = [defaults objectForKey:@"pay_product_id"];
        
        if ([@"TRUE" isEqualToString:isLogin]) {
#warning waiting to change
            //登录成功
            NSString *user_token = [defaults objectForKey:@"JKXY_USER_token"];
            NSString *uid = [defaults objectForKey:@"JKXY_USER_uid"];
            
            api_sig_value = [NSString stringWithFormat:@"%@%@%@", oriApiSigValue, user_token, productid];
            
            loginStr = [NSString stringWithFormat:@"%@&uid=%@%@", oriLoginStr, uid, oriBV];
            
        }else{
            api_sig_value = [NSString stringWithFormat:@"%@%@", oriApiSigValue, productid];
            
            loginStr = [NSString stringWithFormat:@"%@%@", oriLoginStr, oriBV];
        }
    }
    return loginStr;
}




//md5 32位 加密 （小写）
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


+ (BOOL)isCave:(NSString *)number {
    bool isCa = false;
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *plistPath = [paths objectAtIndex:0];
    //得到完整的文件名
    NSString *filename=[plistPath stringByAppendingPathComponent:@"download_video.plist"];
    NSMutableArray *data_old = [[NSMutableArray alloc] initWithContentsOfFile:filename];
    for (int i = 0; i < [data_old count]; i++) {
        NSMutableDictionary *info = [[data_old objectAtIndex:i] objectForKey:@"TOP"];
        if ([number isEqualToString:[info objectForKey:@"j_id"]]) {
            isCa = true;
            break;
        }
    }
    return isCa;
}

@end
