//
//  YFUrlInfoResult.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFConfig.h"
#import "MJExtension.h"
#import "YFURL.h"

@implementation YFConfig

- (void)setData:(NSDictionary *)data
{
    _data = data;
    
    _urls = [[YFURL class] objectWithKeyValues:data];
}

- (void)setExpires:(NSString *)expires
{
    _expires = [expires copy];
    
    // 确定帐号的过期时间 ： 帐号创建时间 + 有效期
    NSDate *now = [NSDate date];
    self.expires_time = [now dateByAddingTimeInterval:expires.doubleValue];
}

MJCodingImplementation
// 以下代码相当于上面一句宏
//
//- (instancetype)initWithCoder:(NSCoder *)decoder
//{
//    self = [super init];
//    if (self) {
//        self.status = [decoder decodeObjectForKey:@"status"];
//        self.expires = [decoder decodeObjectForKey:@"expires"];
//        self.auth_level = [decoder decodeObjectForKey:@"auth_level"];
//        self.data = [decoder decodeObjectForKey:@"data"];
//        
//        self.expires_time = [decoder decodeObjectForKey:@"expires_time"];
//        self.urls = [decoder decodeObjectForKey:@"urls"];
//    }
//    return self;
//}
//
//- (void)encodeWithCoder:(NSCoder *)encoder
//{
//    [encoder encodeObject:self.status forKey:@"status"];
//    [encoder encodeObject:self.expires forKey:@"expires"];
//    [encoder encodeObject:self.auth_level forKey:@"auth_level"];
//    [encoder encodeObject:self.data forKey:@"data"];
//    
//    [encoder encodeObject:self.expires_time forKey:@"expires_time"];
//    [encoder encodeObject:self.urls forKey:@"urls"];
//}
@end
