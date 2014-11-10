//
//  YFHomeCell.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YFCardFrame;
@interface YFCardCell : UITableViewCell

@property (nonatomic, strong) YFCardFrame *cardFrame;

+ (instancetype)cellWithtableView:(UITableView *)tableView;

@end
