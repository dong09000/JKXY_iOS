//
//  DYFPopMenu.h
//  703-01-黑马微博（初搭）
//
//  Created by dyf on 14-7-4.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DYFPopMenuArrowPositionCenter,
    DYFPopMenuArrowPositionLeft,
    DYFPopMenuArrowPositionRight,
}DYFPopMenuArrowPosition;

@class DYFPopMenu;
@protocol DYFPopMenuDelegate <NSObject>

@optional
// 当自己消失的时候要在首页中将首页标题中的小按钮反转
- (void)popMenuDidDismissed:(DYFPopMenu *)popMenu;

@end

@interface DYFPopMenu : UIView

@property (nonatomic, weak) id<DYFPopMenuDelegate> delegate;

@property (nonatomic, assign, getter = isDimBackground) BOOL dimBackground;

@property (nonatomic, assign) DYFPopMenuArrowPosition arrowPosition;

/**
 *  初始化方法
 */
- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)popMenuWithContentView:(UIView *)contentView;

/**
 *  设置菜单的背景图片
 */
- (void)setBackgroundImage:(UIImage *)backgroundImage;

/**
 *  显示菜单(同时设置菜单的frame)
 */
- (void)showInRect:(CGRect)rect;

/**
*  关闭菜单
*/
- (void)dismiss;

@end
