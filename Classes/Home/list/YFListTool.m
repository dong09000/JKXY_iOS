//
//  YFListTool.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-16.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFListTool.h"
#import "YFListAll.h"

@implementation YFListTool

+ (void)getListAllInfoWithBaseUrlStr:(NSString *)urlStr success:(void (^)(YFListAll *))success failure:(void (^)(NSError *))failure
{
    NSString *createStr = [YFCreateConnectStrUntiy CreateStr:@"other"];
    if (urlStr) {
        NSString *listUrlStr = [urlStr stringByAppendingString:createStr];
        YFLog(@"ListUrlStr = %@", listUrlStr);
        [self getWithUrl:listUrlStr param:nil resultClass:[YFListAll class] success:success failure:failure];
    }
}

//http://api.jikexueyuan.com/v2/course_list/s/new?nonce=9719026&timestamp=1413451256&api_key=sEc5qE9f&api_sig=fb68e879bde9d6365135666046265b78&version=1.1
//http://api.jikexy.com/v2/course_list/s/new?nonce=fdsa4fd&timestamp=20140527120304&api_key=uyW3d8Fu&api_sig=632db6568d5ce53af38bb011935bf6e1
//http://api.jikexueyuan.com/v2/course_list/s/new?nonce=fdsa4fd&timestamp=20140527120304&api_key=uyW3d8Fu&api_sig=632db6568d5ce53af38bb011935bf6e1

@end
