//
//  YFShowUnderPlayerView.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowUnderPlayerView.h"

@interface YFShowUnderPlayerView()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) UIButton *selectedBtn;

@end

@implementation YFShowUnderPlayerView

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tab_line"]];
        [self addSubview:imageView];
        self.imageView = imageView;
        
    }
    return self;
}

- (void)setBtnsTitlesArray:(NSArray *)btnsTitlesArray
{
    _btnsTitlesArray = btnsTitlesArray;
    
    for (NSString *btnTitle in btnsTitlesArray) {
        [self addBtnWithTitle:btnTitle];
    }
    
    UIButton *btn = self.btns.firstObject;
    btn.selected = YES;
    self.selectedBtn = btn;
    
    
    
}

- (void)addBtnWithTitle:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:YFColor(72, 72, 72) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    [self.btns addObject:btn];
}

- (void)btnOnClick:(UIButton *)btn
{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.imageView.centerX = btn.centerX;
    }];
    
    if ([self.delegate respondsToSelector:@selector(pageChageWithTag:)]) {
        [self.delegate pageChageWithTag:btn.currentTitle];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = self.btns.count;
    CGFloat btnW = self.width / count;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.btns[i];
        btn.frame = CGRectMake(i * btnW, 0, btnW, self.height);
    }
    
    CGFloat imageX = 0;
    CGFloat imageW = 63.5;
    CGFloat imageH = 1.5;
    CGFloat imageY = self.height - imageH;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    self.imageView.centerX = self.selectedBtn.centerX;
}

@end
