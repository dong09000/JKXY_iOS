//
//  YFCardBottomFrame.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCardBottomFrame.h"
#import "YFCard.h"



@implementation YFCardBottomFrame

- (void)setCard:(YFCard *)card
{
    _card = card;
    
    CGFloat labelX = CardBottomLabelLeftInset;
    CGFloat labelY = CardBottomLabelTopInset;
    CGFloat labelW = CardBottomLabelWidth;
    

    CGFloat labelH = [card.desc boundingRectWithSize:CGSizeMake(labelW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: YFCardBottomLabelFont} context:nil].size.height;
    self.labelFrame = CGRectMake(labelX, labelY, labelW, labelH);
    
    CGFloat iconX = CardWidth - (CardBottomIconRightInset + CardBottomIconWidth);
    CGFloat iconY = CGRectGetMaxY(self.labelFrame) + CardBottomMarginBetweenLabelIcon;
    CGFloat iconW = CardBottomIconWidth;
    CGFloat iconH = CardBottomIconHeight;
    self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat selfH = CGRectGetMaxY(self.iconFrame) + CardBottomIconBottomInset;
    self.frame = CGRectMake(0, 0, CardWidth, selfH);
}

@end
