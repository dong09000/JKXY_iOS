//
//  UIButton+YFBtnImage.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-25.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YFBtnImage)

- (void)setImageWithURLString:(NSString *)urlStr forState:(UIControlState)state placeholderImageName:(NSString *)placeholderStr;

@end
