//
//  YFListTool.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-16.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFBaseTool.h"
#import "YFListAll.h"

@interface YFListTool : YFBaseTool

// 获得list页数据信息
+ (void)getListAllInfoWithBaseUrlStr:(NSString *)urlStr success:(void (^)(YFListAll *result))success failure:(void (^)(NSError *error))failure;

@end
