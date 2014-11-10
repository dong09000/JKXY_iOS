//
//  YFSliderInfo.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-24.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFSliderInfo.h"

@implementation YFSliderInfo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)sliderInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
