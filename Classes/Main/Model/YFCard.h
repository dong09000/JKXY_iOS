//
//  YFHomeModal.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFCard : NSObject

/*
 "id": "96",
 "title": "天气预报应用开发-Swift语言实战项目",
 "description": "掌握使用Swift语言开发iOS应用的基本流程，并通过Playground调试程序",
 "recommend": "http://assets.jikexueyuan.com/hot.png",
 "avaiable_time": null,
 "studied": "4560",
 "image": "http://a1.jikexueyuan.com/home/201406/09/9216/53952d0db6127.jpg",
 "issue": "6",
 "rank": "http://assets.jikexueyuan.com/star_7.png",
 "minute": "16:57",
 "process": "http://assets.jikexueyuan.com/vip.png",
 "uri": "http://api.jikexy.com/v2/course_show/id/96"
 */

@property (nonatomic, copy) NSString *ID;
/** 标题 */
@property (nonatomic, copy) NSString *title;
/** 描述 */
@property (nonatomic, copy) NSString *desc;
/** 是否最新 */
@property (nonatomic, copy) NSString *recommend;
/** 发布时间 */
@property (nonatomic, copy) NSString *avaiable_time;
/** 学习人数 */
@property (nonatomic, copy) NSString *studied;
/** 主背景(图片) */
@property (nonatomic, copy) NSString *image;
/** 课时数量 */
@property (nonatomic, copy) NSString *issue;
/** 推荐指数(图片链接) */
@property (nonatomic, copy) NSString *rank;
/** 视频长度 */
@property (nonatomic, copy) NSString *minute;
/** 会员图标(图片链接) */
@property (nonatomic, copy) NSString *process;
/** 课程详情 */
@property (nonatomic, copy) NSString *uri;


@end
