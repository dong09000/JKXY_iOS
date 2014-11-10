//
//  YFCreateConnectStrUntiy.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFCreateConnectStrUntiy : NSObject

+ (NSString *)CreateStr:(NSString *)tag;

+ (NSString *)md5:(NSString *)str;
//判断文件是否在本地存在
+ (BOOL)isCave:(NSString *)numbe;

@end
