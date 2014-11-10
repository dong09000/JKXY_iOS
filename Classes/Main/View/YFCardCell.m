//
//  YFHomeCell.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCardCell.h"
#import "YFCardFrame.h"
#import "YFCardTop.h"
#import "YFCardMid.h"
#import "YFCardBottom.h"

@interface YFCardCell ()

@property (nonatomic, weak) YFCardTop *topView;
@property (nonatomic, weak) YFCardMid *midView;
@property (nonatomic, weak) YFCardBottom *bottomView;

@end

@implementation YFCardCell

+ (instancetype)cellWithtableView:(UITableView *)tableView
{
    static NSString *identifier = @"homeCard";
    YFCardCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YFCardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        // 设置 cell 点击不变色
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = YFColor(244, 244, 244);
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 1.添加顶部
        YFCardTop *topView = [[YFCardTop alloc] init];
        //topView.backgroundColor = YFRandomColor;
        [self.contentView addSubview:topView];
        self.topView = topView;
        
        // 2.添加中间
        YFCardMid *midView = [[YFCardMid alloc] init];
        //midView.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:midView];
        self.midView = midView;
        
        // 3.添加底部
        YFCardBottom *bottomView = [[YFCardBottom alloc] init];
        //bottomView.backgroundColor = YFRandomColor;
        [self.contentView addSubview:bottomView];
        self.bottomView = bottomView;
    }
    return self;
}

- (void)setCardFrame:(YFCardFrame *)cardFrame
{
    _cardFrame = cardFrame;
    
    self.topView.cardTopFrame = cardFrame.cardTopFrame;
    
    self.midView.card = cardFrame.card;
    self.midView.frame = cardFrame.midFrame;
    

    
    self.bottomView.cardBottomFrame = cardFrame.cardBottomFrame;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.x = (ScreenWidth - CardWidth) * 0.5;
    self.contentView.width = CardWidth;
    self.contentView.height = self.cardFrame.cardH - 5;
    
    
}

@end
