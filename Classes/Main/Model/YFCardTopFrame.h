//
//  YFCardTopFrame.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

#define YFCardTopLabelFont [UIFont boldSystemFontOfSize:15.0]
#define YFCardTopBtnFont [UIFont systemFontOfSize:12.0]

@class YFCard;
@interface YFCardTopFrame : NSObject

@property (nonatomic, strong) YFCard *card;

@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) CGRect labelFrame;
@property (nonatomic, assign) CGRect btnFrame;

@end
