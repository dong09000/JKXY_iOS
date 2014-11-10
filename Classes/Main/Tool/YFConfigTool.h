//
//  YFURLTool.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFBaseTool.h"
#import "YFConfigParam.h"
#import "YFConfig.h"

@interface YFConfigTool : YFBaseTool

// 存储 url 和 用户等级权限
+ (void)saveConfig:(YFConfig *)config;

// 读取urlInfoResult
+ (YFConfig *)config;


// 获得urlInfoResult
+ (void)urlInfoWithParam:(YFConfigParam *)param success:(void (^)(YFConfig *result))success failure:(void (^)(NSError *error))failure;

@end
