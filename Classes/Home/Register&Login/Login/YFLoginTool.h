//
//  YFLoginTool.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-13.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YFBaseTool.h"
#import "YFLogin.h"
#import "YFUserInfo.h"

@interface YFLoginTool : YFBaseTool

// 存储 登录成功后返回的  用户信息
+ (void)saveUserInfo:(YFUserInfo *)userInfo;

// 读取 存起的 用户信息
+ (YFUserInfo *)userInfo;


// 获得登录请求发出后得到的数据
+ (void)LoginInfoWithParam:(id)param success:(void (^)(YFLogin *result))success failure:(void (^)(NSError *error))failure;

@end
