//
//  YFMainDataBtn.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-10.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
btn 字典
"id": "1",
"title": "最新",
"icon": "http://assets.jikexueyuan.com/client/icon/type/new.png",
"uri": "http://api.jikexy.com/v2/course_list/s/new"
*/
@interface YFMainDataBtn1 : NSObject

@property (nonatomic, copy) NSString *ID;
/** 按钮文字 */
@property (nonatomic, copy) NSString *title;
/** 按钮图标 */
@property (nonatomic, copy) NSString *icon;
/** 按钮对应的控制器内的数据 */
@property (nonatomic, copy) NSString *uri;

@end
