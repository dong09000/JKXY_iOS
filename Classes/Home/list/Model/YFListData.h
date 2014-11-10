//
//  YFListData.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-16.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 "items”:[数组],
 "sort_id": 1,
 "title": "最新课程",
 "count": 181,
 "page_count": 10,
 "next_uri": "http://api.jikexy.com/v2/course_list/s/new/p/2"
 */

@interface YFListData : NSObject

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) NSString *sort_id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *page_count;
@property (nonatomic, copy) NSString *next_uri;

@end
