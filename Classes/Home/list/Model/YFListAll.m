//
//  YFListAll.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-16.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFListAll.h"
#import "YFListData.h"
#import "MJExtension.h"

@implementation YFListAll

- (void)setData:(NSArray *)data
{
    _data = [[YFListData class] objectArrayWithKeyValuesArray:data];
}

@end
