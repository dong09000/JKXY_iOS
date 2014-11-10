//
//  YFUserInfo.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-13.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFUserInfo : NSObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *auth_level;
@property (nonatomic, copy) NSString *vip_end_time;
@property (nonatomic, copy) NSString *token;

@end
