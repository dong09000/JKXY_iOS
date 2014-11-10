//
//  YFListAll.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-16.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFListAll : NSObject

/*
 "format": "json",
 "version": "v2",
 "background": "true”,
 "status": "true",
 "expires": "1416035480",
 "code": "200",
 "auth_level": "0",
 "data”:[数组]
 */

@property (nonatomic, copy) NSString *format;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *background;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *expires;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *auth_level;

@property (nonatomic, strong) NSArray *data;

@end
