//
//  YFMainData.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-10.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFMainData.h"
#import "MJExtension.h"
#import "YFMainDataBtn1.h"
#import "YFMainDataBtn2.h"
#import "YFCard.h"

@implementation YFMainData


- (void)setSort_id:(NSString *)sort_id
{
    _sort_id = sort_id;
    if ([sort_id isEqualToString:@"1"]) {
        self.items = [[YFMainDataBtn1 class] objectArrayWithKeyValuesArray:self.items];
    }else if ([sort_id isEqualToString:@"2"])
    {
        self.items = [[YFMainDataBtn2 class] objectArrayWithKeyValuesArray:self.items];
    }else if([sort_id isEqualToString:@"3"])
    {
        self.items = [[YFCard class] objectArrayWithKeyValuesArray:self.items];
    }
}

MJCodingImplementation

@end
