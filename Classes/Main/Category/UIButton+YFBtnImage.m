//
//  UIButton+YFBtnImage.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-25.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "UIButton+YFBtnImage.h"
#import "UIButton+WebCache.h"

@implementation UIButton (YFBtnImage)

- (void)setImageWithURLString:(NSString *)urlStr forState:(UIControlState)state placeholderImageName:(NSString *)placeholderStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    UIImage *placeholderIma = [UIImage imageNamed:placeholderStr];
    
    // SDWebImage 更新,或者换其它框架方法,在此处修改即可
    [self sd_setImageWithURL:url forState:state placeholderImage:placeholderIma];
    
}

@end
