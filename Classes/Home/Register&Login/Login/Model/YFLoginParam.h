//
//  YFLoginParam.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-13.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFLoginParam : NSObject

@property (nonatomic, copy) NSString *nonce;
@property (nonatomic, copy) NSString *timestamp;
@property (nonatomic, copy) NSString *api_key;
@property (nonatomic, copy) NSString *api_sig;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *passwd;
@property (nonatomic, copy) NSString *version;

@end
