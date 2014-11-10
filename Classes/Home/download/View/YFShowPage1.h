//
//  YFShowPage1.h
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFShowPage1 : UIView

// 这个 tableView 交给控制器管理,所以可供外界访问
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *strArray;

@end
