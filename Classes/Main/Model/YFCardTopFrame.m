//
//  YFCardTopFrame.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCardTopFrame.h"
#import "YFCard.h"



@implementation YFCardTopFrame

- (void)setCard:(YFCard *)card
{
    _card = card;
    
    // 1.设置 labelFrame
    CGFloat labelH = [card.title boundingRectWithSize:CGSizeMake(CardTopLabelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: YFCardTopLabelFont} context:nil].size.height;
    self.labelFrame = CGRectMake(CardTopLabelLeftInset, CardTopLabelTopInset, CardTopLabelWidth, labelH);
    
    // 2.设置 btnFrame
    CGFloat btnW = [card.studied boundingRectWithSize:CGSizeMake(CardWidth, CardTopBtnHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: YFCardTopBtnFont}  context:nil].size.width + CardTopBtnImaW + 5;
    CGFloat btnX = CardWidth - btnW - CardTopBtnRightInset;
    
    self.btnFrame = CGRectMake(btnX, CardTopBtnTopInset, btnW, CardTopBtnHeight);
    
    // 3.设置 selfFrame
    CGFloat selfH = CardTopLabelTopInset + CardTopLabelBottomInset + labelH;
    self.frame = CGRectMake(0, 0, CardWidth, selfH);
}

@end
