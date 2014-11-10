//
//  YFLoginTool.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-13.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFLoginTool.h"
#import "YFConfig.h"
#import "YFConfigTool.h"
#import "YFURL.h"

#define YFUserInfoFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userInfo.data"]

@implementation YFLoginTool

+ (void)saveUserInfo:(YFUserInfo *)userInfo
{
    [NSKeyedArchiver archiveRootObject:userInfo toFile:YFUserInfoFilepath];
}

+ (YFUserInfo *)userInfo
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:YFUserInfoFilepath];
}

+ (void)LoginInfoWithParam:(id)param success:(void (^)(YFLogin *))success failure:(void (^)(NSError *))failure
{
    YFConfig *config = [YFConfigTool config];
    
    NSString *loginUrlStr = nil;
    if ([config.status isEqualToString:@"true"]) {
        NSString *loginCreat = [YFCreateConnectStrUntiy CreateStr:@"login"];
        loginUrlStr = [config.urls.login_uri stringByAppendingString:loginCreat];
    }
    
    if (loginUrlStr) {
        [self getWithUrl:loginUrlStr param:param resultClass:[YFLogin class] success:success failure:failure];
    }
}

@end
