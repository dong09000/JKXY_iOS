//
//  YFMainDataBtn2.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-14.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFMainDataBtn2 : NSObject

@property (nonatomic, strong) NSNumber *ID;
/** 按钮文字 */
@property (nonatomic, copy) NSString *tile;
/** 按钮图标 */
@property (nonatomic, copy) NSString *icon;
/** 按钮对应的控制器内的数据 */
@property (nonatomic, copy) NSString *uri;

@end
