//
//  YFLogin.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-13.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFLogin.h"
#import "MJExtension.h"
#import "YFUserInfo.h"


@implementation YFLogin

- (void)setData:(NSDictionary *)data
{
    _data = data;
    _userInfo = [[YFUserInfo class] objectWithKeyValues:data];
}


MJCodingImplementation

@end
