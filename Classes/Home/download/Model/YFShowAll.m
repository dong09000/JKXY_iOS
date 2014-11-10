//
//  YFShowAll.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowAll.h"
#import "MJExtension.h"
#import "YFShowFirstData.h"
#import "YFShowSecondData.h"
#import "YFShowThirdData.h"
#import "YFShowFourthData.h"


/*
 Data 数组中4个不同模型的元素,
 
 模型1
 "title": "Sublime text 3\u5b89\u88c5smali\u63d2\u4ef6",
 "sort_id": "1",
 "button_title": "\u5f00\u59cb\u5b66\u4e60",
 "video_uri": "40.mp4",
 "download_uri": "http:\/\/8_pg=",
 "share_uri": "http:\/\/www.jikexy.com\/course\/131.html",
 "description": "3\u7801\u3002"
 
 模型2
 "title": "\u8bfe\u7a0b\u4ecb\u7ecd",
 "sort_id": "2",
 "content": "iv>"
 
 模型3
 "items": [数组]
 "title": "\u8bfe\u7a0b\u76ee\u5f55",
 "sort_id": "3",
 "content": "Sublime text 3\u5b89\u88c5smali\u63d2\u4ef6",
 "count": 1
 
 模型4
 "items": []
 "title": "\u76f8\u5173\u8bfe\u7a0b",
 "sort_id": "4",
 "count": "2"
 */
@implementation YFShowAll

- (void)setData:(NSArray *)data
{
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:data.count];
    for (NSDictionary *dict in data) {
        if ([dict[@"sort_id"] isEqualToString:@"1"]) {
            YFShowFirstData *data1 = [[YFShowFirstData class] objectWithKeyValues:dict];
            [arrayM addObject:data1];
        }else if ([dict[@"sort_id"] isEqualToString:@"2"])
        {
            [arrayM addObject:[[YFShowSecondData class] objectWithKeyValues:dict]];
        }else if ([dict[@"sort_id"] isEqualToString:@"3"])
        {
            [arrayM addObject:[[YFShowThirdData class] objectWithKeyValues:dict]];
        }else if ([dict[@"sort_id"] isEqualToString:@"4"])
        {
            [arrayM addObject:[[YFShowFourthData class] objectWithKeyValues:dict]];
        }
    }
    
    _data = arrayM;
}

@end
