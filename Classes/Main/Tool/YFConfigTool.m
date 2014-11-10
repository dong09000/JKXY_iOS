//
//  YFURLTool.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFConfigTool.h"
#import "MJExtension.h"
#import "YFBaseTool.h"


#define YFConfigFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"config.data"]

@implementation YFConfigTool


+ (void)saveConfig:(YFConfig *)config
{
    [NSKeyedArchiver archiveRootObject:config toFile:YFConfigFilepath];
}

+ (YFConfig *)config
{
    // 1.读取
    YFConfig *config = [NSKeyedUnarchiver unarchiveObjectWithFile:YFConfigFilepath];
    
    // 2.判断是否过期
    NSDate *now = [NSDate date];
    if ([now compare:config.expires_time] != NSOrderedAscending) {
        config = nil;
    }
    
    return config;
}


+ (void)urlInfoWithParam:(YFConfigParam *)param success:(void (^)(YFConfig *))success failure:(void (^)(NSError *))failure
{
    // 测试 url
    NSString *testUrl = [testUrlStr stringByAppendingString:testCreateStr];
    
    NSString *secretUrl = [trueUrlStr stringByAppendingString: [YFCreateConnectStrUntiy CreateStr:@"other"]];
    YFLog(@"secretUrl == %@", secretUrl);
    
#warning 测试 url
    [self getWithUrl:secretUrl param:param resultClass:[YFConfig class] success:success failure:failure];
    
}

@end
