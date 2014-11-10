//
//  YFSecondRow.m
//  app
//
//  Created by dyf on 14-9-16.
//  Copyright (c) 2014年 shuaiyin. All rights reserved.
//

#import "YFSecondRow.h"
#import "YFHeaderBtn.h"
#import "YFMainDataBtn2.h"
#import "UIButton+YFBtnImage.h"

@interface YFSecondRow()

@property (nonatomic, strong) NSMutableArray *btns;

@end

@implementation YFSecondRow

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSecondRowListBtns:(NSArray *)secondRowListBtns
{
    _secondRowListBtns = secondRowListBtns;
    
    for (YFMainDataBtn2 *btn2Info in self.secondRowListBtns) {
        [self setUpBtnWithTitle:btn2Info.tile NormalImaName:btn2Info.icon UrlStr:btn2Info.uri];
    }
}

// 添加一个按钮
- (void)setUpBtnWithTitle:(NSString *)btnTitle NormalImaName:(NSString *)normalImaName UrlStr:(NSString *)urlStr
{
    YFHeaderBtn *btn = [[YFHeaderBtn alloc] init];
    btn.urlStr = urlStr;
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    [btn setImageWithURLString:normalImaName forState:UIControlStateNormal placeholderImageName:@"main_btn_placeholder"];
    
    
    [btn addTarget:self action:@selector(BtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    [self.btns addObject:btn];
    
}

- (void)BtnOnClick:(YFHeaderBtn *)btn
{
    YFLog(@"打开对应的%@控制器", btn.currentTitle);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:YFMainHeaderBtnDidClickNotification object:nil userInfo:@{YFMainHeaderBtnTitle: btn.currentTitle, YFMainHeaderBtnUrlStr: btn.urlStr}];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    int btnsCount = self.btns.count;
    CGFloat btnH = self.height;
    CGFloat btnW = btnH;
    
    self.contentSize = CGSizeMake(btnsCount * btnW, 0);
    self.pagingEnabled = YES;
    
    // 1.设置按钮的位置
    for (int i = 0; i < btnsCount; i++) {
        YFHeaderBtn *btn = self.btns[i];
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
    }
    
    
}




@end
