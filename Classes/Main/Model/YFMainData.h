//
//  YFMainData.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-10.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YFMainDataBtn1,YFCard;
/*
data 数组内数据
[
 {字典1:
 items:[4个 btn字典]数组,
     "sort_id": "1",
     "title": "四个固定课程列表图标"
 },
 {
     字典2:
 items:[n 个 btn字典]数组
     "sort_id": "2",
     "title": "所有课程分类图标"
 }
 {
     字典3:
     items[n 个 card 字典]数组
     "sort_id": "3",
     "title": "精选课程"
 }
 ]
*/
@interface YFMainData : NSObject

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) NSString *sort_id;

@property (nonatomic, copy) NSString *title;


@end
