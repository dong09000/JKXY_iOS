//
//  YFShowThirdData.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowThirdData.h"
#import "MJExtension.h"
#import "YFShowThirdDataItemsElement.h"

@implementation YFShowThirdData


- (void)setItems:(NSArray *)items
{
    _items = [[YFShowThirdDataItemsElement class] objectArrayWithKeyValuesArray:items];
}

@end
