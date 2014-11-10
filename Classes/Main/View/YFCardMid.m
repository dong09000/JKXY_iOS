//
//  YFCardMid.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-26.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFCardMid.h"
#import "YFCard.h"
#import "UIImageView+WebCache.h"
#import "YFCardMidImaBottomView.h"

@interface YFCardMid()

@property (nonatomic, weak) UIImageView *iconBgView;
@property (nonatomic, weak) YFCardMidImaBottomView *imaBottomView;

@end

@implementation YFCardMid

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.iconBgView = imageView;
        
        YFCardMidImaBottomView *imaBottomView = [[YFCardMidImaBottomView alloc] init];
        //imaBottomView.backgroundColor = YFRandomColor;
        [self addSubview:imaBottomView];
        self.imaBottomView = imaBottomView;
        
    }
    return self;
}

- (void)setCard:(YFCard *)card
{
    _card = card;
    
    
    [self.iconBgView sd_setImageWithURL:[NSURL URLWithString:card.image] placeholderImage:[UIImage imageNamed:@"userLogo"]];
    
    self.imaBottomView.card = card;
    
    [self layoutIfNeeded];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconBgView.frame = self.bounds;
    
    self.imaBottomView.frame = CGRectMake(0, 0, self.width, 20);
}

@end
