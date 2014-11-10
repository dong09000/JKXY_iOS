//
//  YFShowFisrtPageCell.h
//  JKXY_iOS
//
//  Created by dyf on 14/10/19.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CellClickBlock)();

@class YFShowThirdDataItemsElement;
@interface YFShowFisrtPageCell : UITableViewCell

@property (nonatomic, strong) YFShowThirdDataItemsElement *data3Ele;
@property (weak, nonatomic) IBOutlet UIImageView *lookingIconView;
@property (weak, nonatomic) IBOutlet UIImageView *lookedIconView;

@property (nonatomic, copy) CellClickBlock cellClick;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
