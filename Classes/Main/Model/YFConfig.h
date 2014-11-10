//
//  YFUrlInfoResult.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YFURL;

@interface YFConfig : NSObject <NSCoding>

/*
format: "json",
version: "v1",
background: "true",
status: "true",
expires: "1405236769",
code: "200",
auth_level: "0",
data:{字典}
 //rul数据
 
 
 
 
 * format：数据格式 json
 * version：版本（v1）
 * background：这个参数配合expires使用，取值是true和false，意思是是否异步更新，true的时候表示异步更新接口数据（数据没更新成功前界面用缓存数据展示），false的意思是等接口更新完时候再显示界面；
 * status：接口请求状态
 * expires：缓存过期时间，unix时间戳（秒），客户端加载的时候判断下当前时间，和expires比（注意java取得时间戳是毫秒），如果没过期就直接用缓存，如果过期乐，再从接口取；
 * code：状态码，参加http状态码
 * auth_level：用户等级：0-未登录 1-普通用户 2-月费vip 3-年费vip
 * data：业务数据都在这个节点中

 */

// @property (nonatomic, copy) NSString *background;
@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *expires;


@property (nonatomic, copy) NSString *auth_level;

@property (nonatomic, strong) NSDictionary *data;


// 过期时间
@property (nonatomic, strong) NSDate *expires_time;
// url请求们
@property (nonatomic, strong) YFURL *urls;


@end
