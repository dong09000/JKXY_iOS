//
//  YFLoginController.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-10.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFUserInfo;

@protocol YFLoginControllerDelegate <NSObject>

@required
- (void)openSliderWithUserInfo:(YFUserInfo *)userInfo;

@end

@interface YFLoginController : UIViewController

@property (nonatomic, weak) id<YFLoginControllerDelegate> delegate;

@end
