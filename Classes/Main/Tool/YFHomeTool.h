//
//  YFHomeTool.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-14.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFBaseTool.h"
#import "YFMainAll.h"

@class YFMainData;

@interface YFHomeTool : YFBaseTool



// 获得主页数据信息
+ (void)getHomeAllInfoWithParam:(id)param success:(void (^)(YFMainAll *result))success failure:(void (^)(NSError *error))failure;


@end
