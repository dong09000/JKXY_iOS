//
//  YFCardBottom.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCardBottom.h"
#import "YFCard.h"
#import "YFCardBottomFrame.h"

@interface YFCardBottom ()

@property (nonatomic, weak) UILabel *descLabel;
@property (nonatomic, weak) UIImageView *iconView;

@end

@implementation YFCardBottom

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加2个空间
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.font = YFCardBottomLabelFont;
        descLabel.textColor = YFColor(72, 72, 72);
        descLabel.numberOfLines = 0;
        [self addSubview:descLabel];
        self.descLabel = descLabel;
        
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.image = [UIImage imageNamed:@"card_arrow"];
        [self addSubview:iconView];
        self.iconView = iconView;
    }
    return self;
}

- (void)setCardBottomFrame:(YFCardBottomFrame *)cardBottomFrame
{
    _cardBottomFrame = cardBottomFrame;
    
    self.frame = cardBottomFrame.frame;
    
    YFCard *card = cardBottomFrame.card;
    
    self.descLabel.text = card.desc;
    self.descLabel.frame = cardBottomFrame.labelFrame;
    
    self.iconView.frame = cardBottomFrame.iconFrame;
}

@end
