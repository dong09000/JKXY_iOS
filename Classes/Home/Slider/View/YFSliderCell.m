//
//  YFSliderCell.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-24.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFSliderCell.h"
#import "YFSliderInfo.h"

#define YFCellmargin 10

@interface YFSliderCell()

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *titleLabel;

// 自定义下划线
@property (nonatomic, weak) UIView *sep;

@end

@implementation YFSliderCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"IDslider";
    YFSliderCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YFSliderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 1.添加下划线
        UIView *sep = [[UIView alloc] init];
        sep.backgroundColor = [UIColor grayColor];
        sep.alpha = 0.4;
        [self.contentView addSubview:sep];
        self.sep = sep;
        
        // 2.添加 imageView
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 3.添加 titleLabel
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:15.0];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
    }
    return self;
}

- (void)setSliderInfo:(YFSliderInfo *)sliderInfo
{
    _sliderInfo = sliderInfo;
    
//    self.imageView.image = [UIImage imageNamed:sliderInfo.icon];
//    self.textLabel.text = sliderInfo.title;
    
    self.iconView.image = [UIImage imageNamed:sliderInfo.icon];
    self.titleLabel.text = sliderInfo.title;
    
    // 2.重新布局(自定义) image 和 label 的位置
    self.titleLabel.size = [self.titleLabel.text boundingRectWithSize:self.bounds.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.titleLabel.font} context:nil].size;
    self.titleLabel.x = self.center.x - self.titleLabel.width * 0.5;
    self.titleLabel.y = self.center.y - self.titleLabel.height * 0.5;
    
    self.iconView.size = self.iconView.image.size;
    self.iconView.y = self.center.y - self.iconView.height * 0.5;
    self.iconView.x = self.center.x - self.iconView.width - self.titleLabel.width * 0.5 - YFCellmargin;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置下划线的 frame
    self.sep.x = 0;
    self.sep.width = self.width;
    self.sep.height = 0.5;
    self.sep.y = self.height - self.sep.height;

    
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self layoutIfNeeded];
}


@end
