//
//  YFCardMidImaBottomView.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-14.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCardMidImaBottomView.h"
#import "YFCard.h"

#define YFCardMidImaBottomViewLabelFont [UIFont italicSystemFontOfSize:12.0]

CGFloat const YFCardMidImaBottomViewLeftLabelInset = 10;
CGFloat const YFCardMidImaBottomViewBottomLabelInset = 5;
CGFloat const YFCardMidImaBottomViewRightLabelInset = YFCardMidImaBottomViewLeftLabelInset;
CGFloat const YFCardMidImaBottomViewMarginBetweenLabelsInset = YFCardMidImaBottomViewLeftLabelInset;

@interface YFCardMidImaBottomView ()

@property (nonatomic, weak) UIImageView *bdIconView;

// 左间距 10 ,下间距 5 ,斜字体12, 右间距 10 右边2个 label 间隔10;
@property (nonatomic, weak) UILabel *levelLabel;
@property (nonatomic, weak) UILabel *freeTagLabel;
@property (nonatomic, weak) UILabel *durationLabel;
@property (nonatomic, weak) UILabel *countLabel;

@end

@implementation YFCardMidImaBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *bdIconView = [[UIImageView alloc] init];
        bdIconView.image = [UIImage imageNamed:@"card_blackmask-1"];
        [self addSubview:bdIconView];
        self.bdIconView = bdIconView;
        
        //
        UILabel *levelLabel = [[UILabel alloc] init];
        levelLabel.textColor = YFColor(255, 255, 255);
        levelLabel.font = YFCardMidImaBottomViewLabelFont;
        [self addSubview:levelLabel];
        self.levelLabel = levelLabel;
        
        UILabel *freeTagLabel = [[UILabel alloc] init];
        freeTagLabel.textColor = YFColor(153, 209, 88);
        freeTagLabel.font = YFCardMidImaBottomViewLabelFont;
        [self addSubview:freeTagLabel];
        self.freeTagLabel = freeTagLabel;
        
        UILabel *durationLabel = [[UILabel alloc] init];
        durationLabel.textColor = YFColor(255, 255, 255);
        durationLabel.font = YFCardMidImaBottomViewLabelFont;
        [self addSubview:durationLabel];
        self.durationLabel = durationLabel;
        
        UILabel *countLabel = [[UILabel alloc] init];
        countLabel.textColor = YFColor(255, 255, 255);
        countLabel.font = YFCardMidImaBottomViewLabelFont;
        [self addSubview:countLabel];
        self.countLabel = countLabel;
    }
    return self;
}

- (void)setCard:(YFCard *)card
{
    _card = card;
    
    
    
    self.levelLabel.text = @"初级";
    self.freeTagLabel.text = @"免费";
    
    self.countLabel.text = [NSString stringWithFormat:@"%@课时", card.issue];
    
#warning 待完善
    NSString *durationStr = card.minute;
    NSRange range = [durationStr rangeOfString:@":"];
    NSString *minuteDurationStr = [durationStr substringToIndex:range.location];
    NSString *secDuraStr = [durationStr substringFromIndex:range.length + range.location];
    
    NSString *totalMin = [NSString stringWithFormat:@"%d分", ([minuteDurationStr intValue] + [secDuraStr intValue] / 60)];
    self.durationLabel.text = [NSString stringWithFormat:@"%@", totalMin];
    
   
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bdIconView.frame = self.bounds;
    
    CGSize levelLabelSize = [self sizeWithStr:self.levelLabel.text];
    CGFloat labelY = self.height - YFCardMidImaBottomViewBottomLabelInset - levelLabelSize.height;
    
    self.levelLabel.frame = CGRectMake(YFCardMidImaBottomViewLeftLabelInset, labelY, levelLabelSize.width, levelLabelSize.height);
    
    
    CGSize freeTagLabelSize = [self sizeWithStr:self.freeTagLabel.text];
    CGFloat freeTagLabelX = CGRectGetMaxX(self.levelLabel.frame) + YFCardMidImaBottomViewMarginBetweenLabelsInset;
    self.freeTagLabel.frame = CGRectMake(freeTagLabelX, labelY, freeTagLabelSize.width, freeTagLabelSize.height);
    
    
    
    CGSize countLabelSize = [self sizeWithStr:self.countLabel.text];
    
    CGFloat countLabelX = self.width - YFCardMidImaBottomViewRightLabelInset - countLabelSize.width;
    
    self.countLabel.frame = CGRectMake(countLabelX, labelY, countLabelSize.width, countLabelSize.height);
    
    
    
    CGSize durationLabelSize = [self sizeWithStr:self.durationLabel.text];
    CGFloat durationLabelX = CGRectGetMinX(self.countLabel.frame) - durationLabelSize.width - YFCardMidImaBottomViewMarginBetweenLabelsInset;
    
    self.durationLabel.frame = CGRectMake(durationLabelX, labelY, durationLabelSize.width, durationLabelSize.height);
}

#pragma mark - 私有 fun
- (CGSize)sizeWithStr:(NSString *)str
{
    return [str boundingRectWithSize:self.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: YFCardMidImaBottomViewLabelFont} context:nil].size;
}

@end
