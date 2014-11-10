//
//  YFSliderInfo.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-24.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFSliderInfo : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)sliderInfoWithDict:(NSDictionary *)dict;
@end
