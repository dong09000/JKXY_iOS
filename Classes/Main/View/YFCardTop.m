//
//  YFCardTop.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCardTop.h"
#import "YFCardTopFrame.h"
#import "YFCard.h"

@interface YFCardTop()

@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIButton *btn;

@end

@implementation YFCardTop

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        UILabel *label = [[UILabel alloc] init];
        //label.backgroundColor = YFRandomColor;
        label.font = YFCardTopLabelFont;
        label.numberOfLines = 0;
        label.textColor = YFColor(72, 72, 72);
        [self addSubview: label];
        self.label = label;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = YFCardTopBtnFont;
        [btn setTitleColor:YFColor(170, 170, 170) forState:UIControlStateDisabled];
        btn.enabled = NO;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
        [btn setImage:[UIImage imageNamed:@"card_visitor"] forState:UIControlStateDisabled];
        [self addSubview:btn];
        self.btn = btn;
        
    }
    return self;
}

- (void)setCardTopFrame:(YFCardTopFrame *)cardTopFrame
{
    _cardTopFrame = cardTopFrame;
    self.frame = cardTopFrame.frame;
    
    YFCard *card = cardTopFrame.card;
    
    self.label.text = card.title;
    self.label.frame = cardTopFrame.labelFrame;
    
    [self.btn setTitle:card.studied forState:UIControlStateDisabled];
    self.btn.frame = cardTopFrame.btnFrame;
}

@end
