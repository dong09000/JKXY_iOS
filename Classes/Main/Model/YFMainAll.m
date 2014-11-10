//
//  YFMainAll.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-10.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFMainAll.h"
#import "MJExtension.h"
#import "YFMainData.h"

@implementation YFMainAll

- (void)setData:(NSArray *)data
{
    _data = [[YFMainData class] objectArrayWithKeyValuesArray:data];
    //self.mainData = [[YFMainData class] objectArrayWithKeyValuesArray:data];
}


@end
