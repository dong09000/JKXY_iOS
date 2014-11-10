//
//  YFShowFirstPageController.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowFirstPageController.h"
#import "YFShowThirdData.h"
#import "YFShowThirdDataItemsElement.h"
#import "YFShowFisrtPageCell.h"

@interface YFShowFirstPageController ()

@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) NSArray *cellModels;
@property (nonatomic, assign) int index;

@end

@implementation YFShowFirstPageController

- (UILabel *)topLabel
{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.backgroundColor = [UIColor whiteColor];
        //_topLabel.frame = CGRectMake(0, 0, self.view.width, YFShowPageTopViewHeight);
        _topLabel.textAlignment = NSTextAlignmentCenter;
        _topLabel.font = [UIFont boldSystemFontOfSize:12.0];
        _topLabel.textColor = YFColor(72, 72, 72);
        //_topLabel.text = labelText;
        [self.view addSubview:_topLabel];
    }
    return _topLabel;
}

- (void)setData3:(YFShowThirdData *)data3
{
    _data3 = data3;
    
    self.cellModels = data3.items;
    [self.tableView reloadData];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"mm:ss";
//    NSDate *dataOrz = [formatter dateFromString:@"00:00"];
    
    int totalMin = 0;
    int totalSec = 0;
    for (YFShowThirdDataItemsElement *data3Ele in data3.items) {
        
        NSString *duraStr = data3Ele.length;
        
//        NSDate *date = [formatter dateFromString:data3Ele.length];
//        
//        NSDate *dateTotal = [NSDate dateWithTimeInterval:date sinceDate:dataOrz];
        
        NSRange range = [duraStr rangeOfString:@":"];
        NSString *minStr = [duraStr substringToIndex:range.location];
        NSString *secStr = [duraStr substringFromIndex:range.location + range.length];
        
        totalMin += [minStr intValue];
        totalSec += [secStr intValue];
    }
    NSString *totalM = [NSString stringWithFormat:@"%d分钟", (totalSec / 60 + totalMin)];
    
    NSString *topLabelStr = [NSString stringWithFormat:@"%@课时-%@", data3.count, totalM];
    self.topLabel.text = topLabelStr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = -1;
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.cellModels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    YFShowFisrtPageCell *cell = [YFShowFisrtPageCell cellWithTableView:tableView];
    
    cell.data3Ele = self.cellModels[indexPath.row];
    
    return cell;
}

// 点击 cell 调用的方法
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSIndexPath *perIndexPath = [NSIndexPath indexPathForItem:self.index inSection:indexPath.section];
    YFShowFisrtPageCell *perCell = (YFShowFisrtPageCell *)[tableView cellForRowAtIndexPath:perIndexPath];
    perCell.lookedIconView.hidden = NO;
    perCell.lookingIconView.hidden = YES;
    [tableView reloadData];
    YFShowFisrtPageCell *cell = (YFShowFisrtPageCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    
    // 绿圈实心
    //cell.lookedIconView.hidden = NO;
    cell.lookingIconView.hidden = NO;
    
    //[tableView reloadData];
    // 刷新这个cell
    [tableView reloadRowsAtIndexPaths:@[perIndexPath, indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    // 播放这个视频(代理)
    YFShowThirdDataItemsElement *data3Ele = self.cellModels[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(playWithURLStr:)]) {
        [self.delegate playWithURLStr: data3Ele.download_uri];
    }
    self.index = indexPath.row;
    
    // didSelectRowAtIndexPath在此方法返回的 nil 中无法响应
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *perIndexPath = [NSIndexPath indexPathForItem:self.index inSection:indexPath.section];
    YFShowFisrtPageCell *perCell = (YFShowFisrtPageCell *)[tableView cellForRowAtIndexPath:perIndexPath];
    perCell.lookedIconView.hidden = NO;
    perCell.lookingIconView.hidden = YES;
    [tableView reloadData];
    YFShowFisrtPageCell *cell = (YFShowFisrtPageCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    
    // 绿圈实心
    //cell.lookedIconView.hidden = NO;
    cell.lookingIconView.hidden = NO;
    
    //[tableView reloadData];
    // 刷新这个cell
    [tableView reloadRowsAtIndexPaths:@[perIndexPath, indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
    // 播放这个视频(代理)
    YFShowThirdDataItemsElement *data3Ele = self.cellModels[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(playWithURLStr:)]) {
        [self.delegate playWithURLStr: data3Ele.download_uri];
    }
    self.index = indexPath.row;
    
}

//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // 实心绿圈变空心绿圈
//    YFShowFisrtPageCell *cell = (YFShowFisrtPageCell *)[tableView cellForRowAtIndexPath:indexPath];
//    // 绿圈实心
//    cell.lookingIconView.hidden = YES;
//    cell.lookedIconView.hidden = NO;
//    // 刷新这个cell
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
//
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.topLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return YFShowPageTopViewHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}


@end
