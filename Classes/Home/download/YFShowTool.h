//
//  YFShowTool.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFBaseTool.h"
#import "YFShowAll.h"

@interface YFShowTool : YFBaseTool

// 获得Show页数据信息
+ (void)getShowAllInfoWithBaseUrlStr:(NSString *)urlStr success:(void (^)(YFShowAll *result))success failure:(void (^)(NSError *error))failure;

@end
