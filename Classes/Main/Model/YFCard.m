//
//  YFHomeModal.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCard.h"
#import "MJExtension.h"

@implementation YFCard

- (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID": @"id", @"desc": @"description"};
}

MJCodingImplementation

@end
