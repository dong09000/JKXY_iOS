//
//  YFFirstRow.m
//  app
//
//  Created by dyf on 14-9-16.
//  Copyright (c) 2014年 shuaiyin. All rights reserved.
//

#import "YFFirstRow.h"
#import "YFHeaderBtn.h"
#import "YFMainDataBtn1.h"
#import "UIButton+YFBtnImage.h"

@interface YFFirstRow()

@property (nonatomic, strong) NSMutableArray *btns;

@end

@implementation YFFirstRow

- (NSMutableArray *)btns
{
    if (!_btns) {
        _btns = [[NSMutableArray alloc] init];
    }
    return _btns;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
//        // 图片待定
//        [self setUpBtnWithTitle:@"最新" NormalImaName:nil HighlightedImaName:nil];
//        [self setUpBtnWithTitle:@"实战" NormalImaName:nil HighlightedImaName:nil];
//        [self setUpBtnWithTitle:@"免费课程" NormalImaName:nil HighlightedImaName:nil];
//        [self setUpBtnWithTitle:@"全部课程" NormalImaName:nil HighlightedImaName:nil];
        
        
    }
    return self;
}

- (void)setFirstRowListBtns:(NSArray *)firstRowListBtns
{
    _firstRowListBtns = firstRowListBtns;
    
    for (YFMainDataBtn1 *mainDataBtn1 in self.firstRowListBtns) {
        [self setUpBtnWithTitle:mainDataBtn1.title NormalImaName:mainDataBtn1.icon UrlStr:mainDataBtn1.uri];
    }
}

// 添加一个按钮
- (void)setUpBtnWithTitle:(NSString *)btnTitle NormalImaName:(NSString *)normalImaName UrlStr:(NSString *)urlStr
{
    YFHeaderBtn *btn = [[YFHeaderBtn alloc] init];
    btn.urlStr = urlStr;
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:9.0];
    
    [btn setImageWithURLString:normalImaName forState:UIControlStateNormal placeholderImageName:@"main_btn_placeholder"];
        
    [btn addTarget:self action:@selector(BtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    [self.btns addObject:btn];
}

#warning 待完善
- (void)BtnOnClick:(YFHeaderBtn *)btn
{
    
    YFLog(@"打开对应的%@控制器", btn.currentTitle);
   
    [[NSNotificationCenter defaultCenter] postNotificationName:YFMainHeaderBtnDidClickNotification object:nil userInfo:@{YFMainHeaderBtnTitle: btn.currentTitle, YFMainHeaderBtnUrlStr: btn.urlStr}];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置按钮位置
    int btnsCount = self.firstRowListBtns.count;
    CGFloat btnH = self.height;
    CGFloat btnW = self.width / btnsCount;
    
    for (int i = 0; i < btnsCount; i++) {
        YFHeaderBtn *btn = self.btns[i];
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
    }
}

@end
