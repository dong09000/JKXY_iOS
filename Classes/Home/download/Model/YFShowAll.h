//
//  YFShowAll.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFShowAll : NSObject

@property (nonatomic, copy) NSString *format;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *background;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *expires;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *auth_level;

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, copy) NSString *msg;

@end
