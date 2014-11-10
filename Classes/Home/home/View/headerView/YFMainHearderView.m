//
//  YFMainHearderView.m
//  app
//
//  Created by dyf on 14-9-16.
//  Copyright (c) 2014年 shuaiyin. All rights reserved.
//

#import "YFMainHearderView.h"
#import "YFFirstRow.h"
#import "YFSecondRow.h"

@interface YFMainHearderView()<UIScrollViewDelegate>

@property (nonatomic, weak) YFFirstRow *firstRow;
@property (nonatomic, weak) YFSecondRow *secondRow;
@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation YFMainHearderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setFirstRowListBtns:(NSArray *)firstRowListBtns
{
    _firstRowListBtns = firstRowListBtns;
    
    // 1.创建第一行(里面4个按钮)
    YFFirstRow *first = [[YFFirstRow alloc] init];
    first.firstRowListBtns = self.firstRowListBtns;
    first.backgroundColor = YFColor(243, 243, 243);
    [self addSubview:first];
    self.firstRow = first;
}


- (void)setSecondRowListBtns:(NSArray *)secondRowListBtns
{
    _secondRowListBtns = secondRowListBtns;
    
    // 2.创建 scrollView(里面放7个按钮,分2页,每页最多4个)
    YFSecondRow *second = [[YFSecondRow alloc] init];
    second.secondRowListBtns = self.secondRowListBtns;
    second.delegate = self;
    second.backgroundColor = [UIColor whiteColor];
    [self addSubview:second];
    self.secondRow = second;
    
    // 2.添加 pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = (int)(0.5 + self.secondRow.secondRowListBtns.count * 0.25);
    
    pageControl.currentPageIndicatorTintColor = YFColor(72, 72, 72);
    pageControl.pageIndicatorTintColor = YFColor(170, 170, 170);
    
//#warning 拿到美工图片后,用 KVC 修改私有图片属性即可(换图片)
    UIImage *currentPageImage = [UIImage imageNamed:@"qiehuan_01"];
    UIImage *pageImage = [UIImage imageNamed:@"qiehuan_02"];
    [pageControl setValue:currentPageImage forKeyPath:@"_currentPageImage"];
    [pageControl setValue:pageImage forKeyPath:@"_pageImage"];
    
    [self addSubview:pageControl];
    self.pageControl = pageControl;
}

// 设置每列的位置
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.firstRow.x = 0;
    self.firstRow.y = 0;
    self.firstRow.width = self.width;
    self.firstRow.height = self.height * 0.5;
    
    
    self.secondRow.x = 0;
    self.secondRow.y = CGRectGetMaxY(self.firstRow.frame);
    self.secondRow.width = self.firstRow.width;
    self.secondRow.height = self.height - self.firstRow.height;
    
    
    // 2.设置 pageControl的位置
    self.pageControl.centerX = self.centerX;
    self.pageControl.centerY = self.height * 0.96;
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(0.5 + (self.secondRow.contentOffset.x / self.secondRow.bounds.size.width)) % self.secondRow.secondRowListBtns.count;
    
    self.pageControl.currentPage = page;
}

@end
