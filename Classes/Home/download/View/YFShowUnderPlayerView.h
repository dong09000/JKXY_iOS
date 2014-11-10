//
//  YFShowUnderPlayerView.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YFShowUnderPlayerViewDelegate <NSObject>

@optional
- (void)pageChageWithTag:(NSString *)strTag;

@end

@interface YFShowUnderPlayerView : UIView

@property (nonatomic, strong) NSArray *btnsTitlesArray;

@property (nonatomic, weak) id<YFShowUnderPlayerViewDelegate> delegate;

@end
