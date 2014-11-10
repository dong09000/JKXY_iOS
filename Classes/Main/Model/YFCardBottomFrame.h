//
//  YFCardBottomFrame.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#define YFCardBottomLabelFont [UIFont boldSystemFontOfSize:12.0]

@class YFCard;
@interface YFCardBottomFrame : NSObject

@property (nonatomic, strong) YFCard *card;

@property (nonatomic, assign) CGRect labelFrame;
@property (nonatomic, assign) CGRect iconFrame;

@property (nonatomic, assign) CGRect frame;

@end
