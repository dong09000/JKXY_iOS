//
//  YFCardFrame.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YFCard,YFCardTopFrame,YFCardBottomFrame;
@interface YFCardFrame : NSObject

@property (nonatomic, strong) YFCard *card;

@property (nonatomic, strong) YFCardTopFrame *cardTopFrame;
@property (nonatomic, strong) YFCardBottomFrame *cardBottomFrame;

//@property (nonatomic, assign) CGRect topFrame;
@property (nonatomic, assign) CGRect midFrame;
//@property (nonatomic, assign) CGRect bottomFrame;

@property (nonatomic, assign) CGFloat cardH;


@end
