//
//  YFBtn.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-25.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFBtn.h"

@implementation YFBtn


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 内部图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 文字对齐
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15.0];
        
        // 高亮的时候不需要调整内部的图片为灰色
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

/**
 *  设置内部图标的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageW = self.width;
    CGFloat imageH = imageW * 0.75;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

/**
 *  设置内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleW = self.width;
    CGFloat titleH = titleW * 0.25;
    CGFloat titleY = self.height - titleH;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
