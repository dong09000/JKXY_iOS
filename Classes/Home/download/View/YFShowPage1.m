//
//  YFShowPage1.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowPage1.h"



@interface YFShowPage1 ()

@property (nonatomic, weak) UILabel *topLabel;

@end

@implementation YFShowPage1

- (void)setTableView:(UITableView *)tableView
{
    _tableView = tableView;
    [self addSubview:tableView];
}

- (void)setStrArray:(NSArray *)strArray
{
    _strArray = strArray;
    
#warning 分钟可能需要计算
    
    NSString *labelText = [NSString stringWithFormat:@"%@课时-%@分钟", strArray[0], strArray[1]];
    
    UILabel *topLabel = [[UILabel alloc] init];
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.font = [UIFont boldSystemFontOfSize:12.0];
    topLabel.textColor = YFColor(72, 72, 72);
    topLabel.text = labelText;
    [self addSubview:topLabel];
    
    self.topLabel = topLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.topLabel.frame = CGRectMake(0, 0, self.width, YFShowPageTopViewHeight);
    
//    CGFloat tFY = YFShowPageTopViewHeight;
//    self.tableView.frame = CGRectMake(0,tFY, self.width, (self.height - YFShowPageTopViewHeight));
}

@end
