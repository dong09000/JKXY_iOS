//
//  YFCardFrame.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCardFrame.h"
#import "YFCard.h"
#import "YFCardTop.h"
#import "YFCardBottom.h"
#import "YFCardTopFrame.h"
#import "YFCardBottomFrame.h"

@implementation YFCardFrame

- (void)setCard:(YFCard *)card
{
    _card = card;
    
    // 1.设置顶部 frame
    YFCardTopFrame *cardTopFrame = [[YFCardTopFrame alloc] init];
    cardTopFrame.card = card;
    self.cardTopFrame = cardTopFrame;
    
    // 2.设置中间 frame
    CGFloat midX = 0;
    CGFloat midY = CGRectGetMaxY(cardTopFrame.frame);
    CGFloat midW = CardWidth;
    CGFloat midH = 171.0;
    
    self.midFrame = CGRectMake(midX, midY, midW, midH);
    
    // 3.设置底部 frame
    YFCardBottomFrame *cardBottomFrame = [[YFCardBottomFrame alloc] init];
    cardBottomFrame.card = card;
    
    
    CGRect f = cardBottomFrame.frame;
    f.origin.y = CGRectGetMaxY(self.midFrame);
    cardBottomFrame.frame = f;
    
    self.cardBottomFrame = cardBottomFrame;
    
    // 4.得到 cell 的高度
    self.cardH = CGRectGetMaxY(self.cardBottomFrame.frame) + 5;
    
}

@end
