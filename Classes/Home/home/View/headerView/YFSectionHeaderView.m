//
//  YFSectionHeaderView.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-14.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFSectionHeaderView.h"

#define YFSectionHeaderBtnFont [UIFont boldSystemFontOfSize:20.0]

@interface YFSectionHeaderView ()

@property (nonatomic, weak) UIButton *btn;

@end

@implementation YFSectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIButton *btn = [[UIButton alloc] init];
        btn.enabled = NO;
        btn.backgroundColor = [UIColor clearColor];
        [btn setTitle:@"精选课程" forState: UIControlStateDisabled];
        [btn setImage:[UIImage imageNamed:@"subtitle_greentitle"] forState:UIControlStateDisabled];
        [btn.titleLabel setFont:YFSectionHeaderBtnFont];
        [btn setTitleColor:YFColor(80, 80, 80) forState:UIControlStateDisabled];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [self addSubview:btn];
        self.btn = btn;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat BtnW = [self.btn.currentTitle boundingRectWithSize:self.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: YFSectionHeaderBtnFont} context:nil].size.width + 15;
    self.btn.frame = CGRectMake(10, 0, BtnW, self.height);
}

@end
