//
//  YFShowFirstPageController.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFShowThirdData;

@protocol YFShowFirstPageControllerDelegate <NSObject>

@optional
- (void)playWithURLStr:(NSString *)videoUrlStr;

@end

@interface YFShowFirstPageController : UITableViewController

@property (nonatomic, strong) YFShowThirdData *data3;

@property (nonatomic, weak) id<YFShowFirstPageControllerDelegate> delegate;

@end
