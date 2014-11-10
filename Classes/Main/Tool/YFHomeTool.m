//
//  YFHomeTool.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-14.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFHomeTool.h"
#import "YFConfigTool.h"
#import "YFConfig.h"
#import "YFURL.h"
#import "YFMainAll.h"

@implementation YFHomeTool

+ (void)getHomeAllInfoWithParam:(id)param success:(void (^)(YFMainAll *))success failure:(void (^)(NSError *))failure
{
    YFConfig *config = [YFConfigTool config];
    
    NSString *homeUrlStr = nil;
    if ([config.status isEqualToString:@"true"]) {
        //
        NSString *createStr = [YFCreateConnectStrUntiy CreateStr:@"other"];
        
        homeUrlStr = [config.urls.main_uri stringByAppendingString:createStr];
    }
    
    if (homeUrlStr) {
        YFLog(@"home Url Str = %@", homeUrlStr);
        [self getWithUrl:homeUrlStr param:param resultClass:[YFMainAll class] success:success failure:failure];
    }
}

@end
