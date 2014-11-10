//
//  YFShowThirdData.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 "items": [数组]
 "title": "\u8bfe\u7a0b\u76ee\u5f55",
 "sort_id": "3",
 "content": "Sublime text 3\u5b89\u88c5smali\u63d2\u4ef6",
 "count": 1
 */
@interface YFShowThirdData : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sort_id;
@property (nonatomic, copy) NSString *content;

/**
 
 这种模型数组
 */
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSNumber *count;

@end
