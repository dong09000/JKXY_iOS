//
//  DYFPopMenu.m
//  703-01-黑马微博（初搭）
//
//  Created by dyf on 14-7-4.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "DYFPopMenu.h"


@interface DYFPopMenu ()
/**
 *  外界传入的，显示在container图片容器中的view
 */
@property (nonatomic, strong) UIView *contentView;
/**
 *  窗口弹出时，container后面占据整个屏幕大小的蒙版
 */
@property (nonatomic, weak) UIButton *cover;
/**
 *  弹出的窗口，容纳传入的view
 */
@property (nonatomic, weak) UIImageView *container;

@end

@implementation DYFPopMenu

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加2个控件，先蒙版，再容器
        UIButton *cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverOnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        UIImageView *container = [[UIImageView alloc] init];
        // 添加图片,拉伸状态添加
#warning 不是这个图片
        container.image = [UIImage resizedImage:@"pay_paybtn"];
        // 设置UIImageView可进行用户交互操作
        container.userInteractionEnabled = YES;
        [self addSubview:container];
        self.container = container;
    }
    return self;
}

- (void)coverOnClick
{
    [self dismiss];
}

- (instancetype)initWithContentView:(UIView *)contentView
{
    if (self = [super init]) {
        self.contentView = contentView;
    }
    return self;
}
+ (instancetype)popMenuWithContentView:(UIView *)contentView
{
    return [[self alloc] initWithContentView:contentView];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    self.container.image = backgroundImage;
}

- (void)setDimBackground:(BOOL)dimBackground
{
    _dimBackground = dimBackground;
    
    if (dimBackground) {
        self.cover.backgroundColor = [UIColor grayColor];
        self.cover.alpha = 0.5;
    }else
    {
        self.cover.backgroundColor = [UIColor clearColor];
        self.cover.alpha = 1.0;
    }
}
-  (void)setArrowPosition:(DYFPopMenuArrowPosition)arrowPosition
{
    _arrowPosition = arrowPosition;
    
    switch (arrowPosition) {
        case DYFPopMenuArrowPositionCenter:
            [self setBackgroundImage:[UIImage imageNamed:@"popover_background"]];
            break;
        case DYFPopMenuArrowPositionLeft:
            [self setBackgroundImage:[UIImage imageNamed:@"popover_background"]];
            break;
        case DYFPopMenuArrowPositionRight:
            [self setBackgroundImage:[UIImage imageNamed:@"popover_background"]];
            break;
            
        default:
            break;
    }
}

- (void)showInRect:(CGRect)rect
{
    
    // 也可以用self.view.window获得，但是性能很差，不符合延迟加载
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    //self.frame = window.bounds;
    self.frame = window.frame;
    // 先添加整个self到window上面，self中cover在下面，container（图片）在上面
    [window addSubview:self];
    
    // 图片显示的范围由外界传入
    self.container.frame = rect;
    // 将外界传入的view显示在图片容器container上面
    [self.container addSubview:self.contentView];
    
    // 设置边框间距
    self.contentView.x = 5;
    self.contentView.y = 12;
    self.contentView.width = self.container.width - self.contentView.x * 2;
    self.contentView.height = self.container.height - self.contentView.y * 2;
}

- (void)dismiss
{
    // 通过代理变化按钮内的尖尖
    if ([self.delegate respondsToSelector:@selector(popMenuDidDismissed:)]) {
        [self.delegate popMenuDidDismissed:self];
    }
    // 从window中移除self，移除后代理方法无效了，所以要放在后面
    [self removeFromSuperview];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // self.frame = window.frame;
    self.cover.frame = self.bounds;
}
@end
