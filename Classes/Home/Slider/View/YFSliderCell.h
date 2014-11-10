//
//  YFSliderCell.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-24.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFSliderInfo;
@interface YFSliderCell : UITableViewCell

@property (nonatomic, strong) YFSliderInfo *sliderInfo;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
