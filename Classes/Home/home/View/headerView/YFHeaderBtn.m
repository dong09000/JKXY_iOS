//
//  YFHeaderBtn.m
//  app
//
//  Created by dyf on 14-9-16.
//  Copyright (c) 2014年 shuaiyin. All rights reserved.
//

#import "YFHeaderBtn.h"

@implementation YFHeaderBtn


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // 内部图标居中
        //self.imageView.contentMode = UIViewContentModeCenter;
        // 文字对齐
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字颜色
        [self setTitleColor:YFColor(74, 74, 74) forState:UIControlStateNormal];
       
        // 高亮的时候不需要调整内部的图片为灰色
        self.adjustsImageWhenHighlighted = NO;
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = (self.width - HomeBtnImageWidth) * 0.5;
    CGFloat imageY = HomeBtnImageTopInset;
    return CGRectMake(imageX, imageY, HomeBtnImageWidth, HomeBtnImageHeight);
}


//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    CGFloat titleH = [self.currentTitle boundingRectWithSize:self.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.titleLabel.font} context:nil].size.height;
//    CGFloat marginBetweenTitleAndImage = (self.height - HomeBtnImageHeight - HomeBtnImageTopInset - titleH) * 0.5;
//    CGFloat titleY = CGRectGetMaxY(self.imageView.frame) + marginBetweenTitleAndImage;
//    
//    return CGRectMake(0, titleY, self.width, titleH);
//}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat titleH = [self.currentTitle boundingRectWithSize:self.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.titleLabel.font} context:nil].size.height;
    CGFloat marginBetweenTitleAndImage = (self.height - HomeBtnImageHeight - HomeBtnImageTopInset - titleH) * 0.5;
    CGFloat titleY = CGRectGetMaxY(self.imageView.frame) + marginBetweenTitleAndImage;
    self.titleLabel.frame = CGRectMake(0, titleY, self.width, titleH);
}

@end
