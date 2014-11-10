//
//  YFShowThirdDataItemsElement.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 "title": "\undroid APK",
 "content": "\uali\u6587\u4ef6",
 "id": "815",
 "length": "04:33",
 "video_uri": "",
 "download_uri": ""
 */
@interface YFShowThirdDataItemsElement : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *length;
@property (nonatomic, copy) NSString *video_uri;
@property (nonatomic, copy) NSString *download_uri;

@end
