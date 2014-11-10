//
//  YFShowFourthData.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowFourthData.h"
#import "YFCard.h"
#import "MJExtension.h"

@implementation YFShowFourthData

- (void)setItems:(NSArray *)items
{
    _items = [[YFCard class] objectArrayWithKeyValuesArray:items];
}

@end
