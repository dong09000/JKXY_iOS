//
//  YFTestTVC.m
//  app
//
//  Created by dyf on 14-9-16.
//  Copyright (c) 2014年 shuaiyin. All rights reserved.
//

#import "YFTestTVC.h"

#import "YFTitleBtn.h"
#import "DYFPopMenu.h"
#import "MJRefresh.h"
#import "YFCard.h"
#import "YFCardFrame.h"
#import "YFCardCell.h"
#import "YFListAll.h"
#import "YFListData.h"

#import "YFListTool.h"

@interface YFTestTVC () <DYFPopMenuDelegate>

@property (nonatomic, weak) YFTitleBtn *titleBtn;

@property (nonatomic, strong) NSMutableArray *cardFrames;
@property (nonatomic, copy) NSString *nextUrlStr;

@end

@implementation YFTestTVC

// 懒加载
- (NSMutableArray *)cardFrames
{
    if (!_cardFrames) {
        _cardFrames = [NSMutableArray array];
    }
    return _cardFrames;
}

// card 数组转 cardFrame 数组
- (NSArray *)cardFramesFromCards:(NSArray *)cards
{
    NSMutableArray *cardFrams = [NSMutableArray arrayWithCapacity:cards.count];
    for (YFCard *card in cards) {
        YFCardFrame *cardFrame = [[YFCardFrame alloc] init];
        cardFrame.card = card;
        [cardFrams addObject:cardFrame];
    }
    return cardFrams;
}

- (void)setUrlStr:(NSString *)urlStr
{
    _urlStr = [urlStr copy];
    [YFListTool getListAllInfoWithBaseUrlStr:urlStr success:^(YFListAll *result) {
        if ([result.status isEqualToString:statusTrue]) {
            
            YFListData *listData = result.data[0];
            self.nextUrlStr = listData.next_uri;
            NSArray *items = listData.items;
            [self.cardFrames addObjectsFromArray:[self cardFramesFromCards:items]];
            
            // 刷新表格
            [self.tableView reloadData];
            
            //[self.tableView headerEndRefreshing];
        } else
        {
            [MBProgressHUD showError:@"服务器维护中..."];
            //[self.tableView headerEndRefreshing];
        }
        
    } failure:^(NSError *error) {
        //
        //[self.tableView headerEndRefreshing];
        [MBProgressHUD showError:@"网络繁忙,请稍后再试"];
    }];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    // 集成下拉刷新控件
    [self setupRefresh];
}

// 集成下拉刷新控件
- (void)setupRefresh
{
    
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreData)];
}
- (void)loadBaseData
{
    [YFListTool getListAllInfoWithBaseUrlStr:self.urlStr success:^(YFListAll *result) {
        //
        
        if ([result.status isEqualToString:statusTrue]) {
            
            YFListData *listData = result.data[0];
            self.nextUrlStr = listData.next_uri;
            NSArray *items = listData.items;
            [self.cardFrames addObjectsFromArray:[self cardFramesFromCards:items]];
            
            // 刷新表格
            [self.tableView reloadData];
            
            [self.tableView headerEndRefreshing];
        } else
        {
            [MBProgressHUD showError:@"服务器维护中..."];
            [self.tableView headerEndRefreshing];
        }
        
    } failure:^(NSError *error) {
        //
        [self.tableView headerEndRefreshing];
        [MBProgressHUD showError:@"网络繁忙,请稍后再试"];
    }];
}

// 下拉加载更多
- (void)loadMoreData
{
    if (self.nextUrlStr == nil) {
        [MBProgressHUD showError:@"没有更多课程了"];
        [self.tableView footerEndRefreshing];
        
        return;
    }else
    {
        [YFListTool getListAllInfoWithBaseUrlStr:self.nextUrlStr success:^(YFListAll *result) {
            if ([result.status isEqualToString:statusTrue]) {
                YFListData *listData = result.data[0];
                
                // 为 nextUrlStr 重新赋值
                self.nextUrlStr = listData.next_uri;
                NSArray *items = listData.items;
                if(items.lastObject != [self.cardFrames.lastObject card])
                {
                    [self.cardFrames addObjectsFromArray:[self cardFramesFromCards:items]];
                }
                // 刷新表格
                [self.tableView reloadData];
                
                // 刷新玩表格后结束footer下拉刷新
                [self.tableView footerEndRefreshing];
            }else
            {
                [self.tableView footerEndRefreshing];
            }
        } failure:^(NSError *error) {
            [MBProgressHUD showError:@"网络繁忙,请稍后再试..."];
            
            [self.tableView footerEndRefreshing];
        }];
    }
    
}


// 重写 set 方法,设置标题按钮用来打开 popMenu
- (void)setTitleViewStr:(NSString *)titleViewStr
{
    _titleViewStr = [titleViewStr copy];
    
    [self setNavTitleView];
}


- (void)setNavTitleView
{
    // 设置导航栏中间的标题按钮
    YFTitleBtn *titleBtn = [YFTitleBtn buttonWithType:UIButtonTypeCustom];
    titleBtn.height = 35;
    YFLog(@"self.titleViewStr===%@", self.titleViewStr);
    [titleBtn setTitle:self.titleViewStr forState:UIControlStateNormal];
    
    
    // 设置图标
    [titleBtn setImage:[UIImage imageNamed:@"nav_arrow_down"] forState:UIControlStateNormal];
    
    
    // 监听按钮的点击
    [titleBtn addTarget:self action:@selector(titleBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 按钮的高度也可以封装，方法同宽度
    self.navigationItem.titleView = titleBtn;
    self.titleBtn = titleBtn;
    
    YFLog(@"titleBtn = %@", self.navigationItem.titleView);
}

/**
 *  监听标题按钮的点击方法
 */
- (void)titleBtnOnClick:(UIButton *)titleBtn
{
    //[UIView animateWithDuration:1.0 animations:^{
        
        [titleBtn setImage:[UIImage imageNamed:@"nav_arrow_up"] forState:UIControlStateNormal];
        
#warning 待修改
        // 测试 tableView
        UITableView *testTable = [[UITableView alloc] init];
        testTable.backgroundColor = [UIColor clearColor];
        
        // 创建一个显示菜单
        DYFPopMenu *popMenu = [DYFPopMenu popMenuWithContentView:testTable];
        // 设置代理
        popMenu.delegate = self;
        
        popMenu.dimBackground = YES;
        // 设置显示的frame
        CGRect menuF = CGRectMake(0, 64, 320, 380);
        [popMenu showInRect:menuF];
    //}];
}

#pragma mark - DYFPopMenuDelegate
- (void)popMenuDidDismissed:(DYFPopMenu *)popMenu
{
    YFTitleBtn *titleBtn = (YFTitleBtn *)self.navigationItem.titleView;
    
    //[UIView animateWithDuration:1.0 animations:^{
        
        [titleBtn setImage:[UIImage imageNamed:@"nav_arrow_down"] forState:UIControlStateNormal];
    //}];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cardFrames.count;
}

#pragma mark - TableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFCardCell *cell = [YFCardCell cellWithtableView:tableView];
    
    cell.cardFrame = self.cardFrames[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFCardFrame *cardFrame = self.cardFrames[indexPath.row];
    return cardFrame.cardH;
}

@end
