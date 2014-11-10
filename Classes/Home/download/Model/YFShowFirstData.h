//
//  YFShowData.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface YFShowFirstData : NSObject

/*
"title": "Sublime text 3\u5b89\u88c5smali\u63d2\u4ef6",
"sort_id": "1",
"button_title": "\u5f00\u59cb\u5b66\u4e60",
"video_uri": "40.mp4",
"download_uri": "http:\/\/8_pg=",
"share_uri": "http:\/\/www.jikexy.com\/course\/131.html",
"description": "3\u7801\u3002"
*/
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *sort_id;
@property (nonatomic, copy) NSString *button_title;
@property (nonatomic, copy) NSString *video_uri;
@property (nonatomic, copy) NSString *download_uri;
@property (nonatomic, copy) NSString *share_uri;
@property (nonatomic, copy) NSString *desc;

@end
