//
//  YFSliderHeaderView.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-24.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFSliderHeaderView.h"
#import "YFBtn.h"
#import "UIButton+YFBtnImage.h"

@interface YFSliderHeaderView()
@property (weak, nonatomic) UIButton *dismissBtn;
@property (nonatomic, weak) UIButton *vipBtn;

// 若是登录状态,按钮修改从 selected 状态
@property (weak, nonatomic) YFBtn *loginBtn;

@property (weak, nonatomic) UIImageView *vipIcon;

@property (weak, nonatomic) UILabel *desLabel;


@end

@implementation YFSliderHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 1. 取消按钮
        UIButton *dismissBtn = [[UIButton alloc] init];
        [dismissBtn setBackgroundImage:[UIImage imageNamed:@"chacha"] forState:UIControlStateNormal];
        [dismissBtn addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:dismissBtn];
        self.dismissBtn = dismissBtn;
        
        // 2. 打开 VIP按钮
        UIButton *vipBtn = [[UIButton alloc] init];
        [vipBtn setBackgroundImage:[UIImage imageNamed:@"vip"] forState:UIControlStateNormal];
        [vipBtn addTarget:self action:@selector(openVip:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:vipBtn];
        self.vipBtn = vipBtn;
        
        // 3.登录按钮
        YFBtn *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        loginBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        
        // normar 未登录状态
        [loginBtn setTitle:@"立即登录" forState: UIControlStateNormal];
        [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [loginBtn setImage:[UIImage imageNamed:@"holder"] forState:UIControlStateNormal];
        
        // selected 登录状态
        NSString *userID = @"从 userdefault 或者工具类或者服务器获取";
        [loginBtn setTitle:userID forState:UIControlStateSelected];
        [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        NSString *urlStr = @"客户端api中获取";
        [loginBtn setImageWithURLString:urlStr forState:UIControlStateSelected placeholderImageName:@"holder"];
        
        [loginBtn addTarget:self action:@selector(loginOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loginBtn];
        self.loginBtn = loginBtn;
        
        // 4.vip 图像
        UIImageView *vipIcon = [[UIImageView alloc] init];
        vipIcon.image = [UIImage imageNamed:@"vipIcon"];
        //vipIcon.hidden = YES;
        [self addSubview:vipIcon];
        self.vipIcon = vipIcon;
        
        // 5.descLabel 描述
        UILabel *descLabel = [[UILabel alloc] init];
        [descLabel setText:@"登录抢大礼"];
        [descLabel setTextColor:[UIColor greenColor]];
        [descLabel setTextAlignment:NSTextAlignmentCenter];
        [descLabel setFont:[UIFont systemFontOfSize:13.0]];
        
        [self addSubview:descLabel];
        self.desLabel = descLabel;
    }
    return self;
}

#warning 尚未开始写
- (void)dismiss:(UIButton *)sender {
    YFLog(@"返回首页");
    
}
- (void)openVip:(UIButton *)sender {
    YFLog(@"openVip");
}
- (void)loginOnClick:(UIButton *)sender {
    YFLog(@"跳转到登录界面");
    // 1.根据用户权限得到用户状态,修改登录按钮的状态,修改 imageView 的 hidden 状态,修改描述 label 的 hidden 状态
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 布局这些控件(由于部分控件需要隐藏,暂时不用 Autolayout 布局,根据阿龙的界面图来设置)
    self.dismissBtn.x = 10;
    
}

@end
