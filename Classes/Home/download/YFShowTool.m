//
//  YFShowTool.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowTool.h"

@implementation YFShowTool

+ (void)getShowAllInfoWithBaseUrlStr:(NSString *)urlStr success:(void (^)(YFShowAll *))success failure:(void (^)(NSError *))failure
{
    NSString *createStr = [YFCreateConnectStrUntiy CreateStr:@"other"];
    if (urlStr) {
        NSString *showUrlStr = [urlStr stringByAppendingString:createStr];
        YFLog(@"showUrlStr = %@", showUrlStr);
        [self getWithUrl:showUrlStr param:nil resultClass:[YFShowAll class] success:success failure:failure];
    }
}

@end
