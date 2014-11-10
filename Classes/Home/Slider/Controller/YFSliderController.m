//
//  YFSliderController.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-24.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFSliderController.h"
#import "YFSliderCell.h"
#import "YFSliderInfo.h"
#import "YFSliderFooterView.h"
#import "YFSliderHeaderView.h"


@interface YFSliderController ()

@property (nonatomic, strong) NSArray *sliderInfos;

@end

@implementation YFSliderController

// 懒加载
- (NSArray *)sliderInfos
{
    if (!_sliderInfos) {
#warning plist 文件没写还,需要自己写
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sliders.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            YFSliderInfo *sliderInfo = [YFSliderInfo sliderInfoWithDict:dict];
            [arrayM addObject:sliderInfo];
        }
        _sliderInfos = arrayM;
    }
    return _sliderInfos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 清除下划线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    YFSliderHeaderView *hV = [[YFSliderHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    self.tableView.tableHeaderView = hV;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning 这个地方修改成 sliderInfos.count
    return self.sliderInfos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YFSliderCell *cell = [YFSliderCell cellWithTableView:tableView];
    
    cell.sliderInfo = self.sliderInfos[indexPath.row];
    
    return cell;
}


#pragma mark - TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFLog(@"%ld", (long)indexPath.row);
    
    YFSliderCell *cell = (YFSliderCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    YFLog(@"%@", cell.textLabel.text);
}



@end
