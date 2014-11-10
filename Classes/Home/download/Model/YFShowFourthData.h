//
//  YFShowFourthData.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 "items": []
 "title": "\u76f8\u5173\u8bfe\u7a0b",
 "sort_id": "4",
 "count": "2"
 */
@interface YFShowFourthData : NSObject

/** card 数组 */
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sort_id;
@property (nonatomic, copy) NSString *count;

@end
