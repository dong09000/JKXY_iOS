//
//  YFSliderFooterView.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-24.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFSliderFooterView.h"

@interface YFSliderFooterView()

// 根据当前版本号显示 ver+版本
@property (weak, nonatomic) IBOutlet UILabel *verLabel;

@end

@implementation YFSliderFooterView
- (IBAction)openSetting {
    YFLog(@"打开设置界面");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
