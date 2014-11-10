
//
//  YFListData.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-16.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFListData.h"
#import "MJExtension.h"
#import "YFCard.h"

@implementation YFListData

- (void)setItems:(NSArray *)items
{
    _items = [[YFCard class] objectArrayWithKeyValuesArray:items];
}

@end
