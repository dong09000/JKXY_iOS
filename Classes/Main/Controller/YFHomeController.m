//
//  YFHomeController.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFHomeController.h"
#import "YFNavigationController.h"
#import "MJRefresh.h"
#import "YFSliderController.h"
#import "YFCardFrame.h"
#import "YFMainDataBtn1.h"
#import "YFMainData.h"
#import "YFCard.h"
#import "YFCardCell.h"
#import "YFHomeTool.h"
#import "YFSectionHeaderView.h"

#import "YFMainHearderView.h"
#import "YFTestTVC.h"

#import "YFSampleSliderController.h"
#import "YFLoginController.h"
#import "YFPlayController.h"


@interface YFHomeController () <YFLoginControllerDelegate>

@property (nonatomic, weak) YFMainHearderView *mainHearderView;
@property (nonatomic, weak) YFSampleSliderController *sliderVc;


@property (nonatomic, strong) NSMutableArray *cardFrames;
@property (nonatomic, strong) NSMutableArray *listItems1;
@property (nonatomic, strong) NSMutableArray *listItems2;



@end

@implementation YFHomeController

// 懒加载
- (NSMutableArray *)cardFrames
{
    if (!_cardFrames) {
        _cardFrames = [NSMutableArray array];
    }
    return _cardFrames;
}
- (NSMutableArray *)listItems2
{
    if (!_listItems2) {
        _listItems2 = [NSMutableArray array];
    }
    return _listItems2;
}
- (NSMutableArray *)listItems1
{
    if (!_listItems1) {
        _listItems1 = [NSMutableArray array];
    }
    return _listItems1;
}


/** card 数组转成 cardFrame 数组 */
- (NSArray *)cardFramesWithCards:(NSArray *)Cards
{
    NSMutableArray *frames = [NSMutableArray array];
    for (YFCard *card in Cards) {
        YFCardFrame *frame = [[YFCardFrame alloc] init];
        
        frame.card = card;
        [frames addObject:frame];
    }
    return frames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YFLog(@"%@", [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"config.data"]);
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = YFColor(243, 243, 243);
    
    
    self.title = @"极客学院";
    
    // 设置导航栏按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_slider" highImageName:@"nav_slider" target:self action:@selector(openSlider:)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_vip" highImageName:@"nav_vip" target:self action:@selector(openVip)];
    
    // 列表按钮控件
    YFMainHearderView *mainHearderView = [[YFMainHearderView alloc] init];
    mainHearderView.frame = CGRectMake(0, 0, self.tableView.width, self.tableView.width * 0.5);
    [self.tableView setTableHeaderView:mainHearderView];
    self.mainHearderView = mainHearderView;
    

    
    
    // 通知中心
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openNewVC:) name:YFMainHeaderBtnDidClickNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openLoginVc:) name:YFOpenLoginNotification object:nil];
    
    //[MBProgressHUD showMessage:@"正在加载数据..."];
    // 2.加载数据
    [self setupMainData];
    
}




#pragma mark - NSNotificationCenter fun
// 打开
- (void)openNewVC:(NSNotification *)note
{
    NSString *btnTitle = note.userInfo[YFMainHeaderBtnTitle];
    YFTestTVC *testVC = [[YFTestTVC alloc] init];
    testVC.view.backgroundColor = YFRandomColor;
    testVC.titleViewStr = btnTitle;
    testVC.urlStr = note.userInfo[YFMainHeaderBtnUrlStr];
    
    [self.navigationController pushViewController:testVC animated:YES];
}

// 打开登录界面
- (void)openLoginVc:(NSNotification *)note
{
    YFLoginController *loginVc = [[YFLoginController alloc] init];
    loginVc.delegate = self;
    [self.navigationController pushViewController:loginVc animated:NO];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - navBar fun
- (void)openSlider:(YFUserInfo *)userInfo
{
    YFLog(@"modal 出选择界面");
    
    YFSliderController *sc = [[YFSliderController alloc] init];

    YFSampleSliderController *sampleSc = [[YFSampleSliderController alloc] init];
    sampleSc.userInfo = userInfo;
    self.sliderVc = sampleSc;
    
    [self presentViewController:self.sliderVc animated:YES completion:nil];
    
}

- (void)openSlider
{
    [self openSlider:nil];
}

- (void)openVip
{
    YFLog(@"push 出 vip 界面");
}

#pragma mark - 加载数据
/**
 *  加载数据
 */
- (void)setupMainData
{
    [YFHomeTool getHomeAllInfoWithParam:nil success:^(YFMainAll *result) {
        if([result.status isEqualToString:statusTrue])
        {
            for (YFMainData *mainData in result.data) {
                if ([mainData.sort_id isEqualToString:@"1"]) {
                    [self.listItems1 addObjectsFromArray: mainData.items];
                    self.mainHearderView.firstRowListBtns = mainData.items;
                    
                } else if ([mainData.sort_id isEqualToString:@"2"])
                {
                    [self.listItems2 addObjectsFromArray: mainData.items];
                    self.mainHearderView.secondRowListBtns = mainData.items;
                    
                } else if ([mainData.sort_id isEqualToString:@"3"])
                {
                    [self.cardFrames addObjectsFromArray:[self cardFramesWithCards:mainData.items]];
                }
            }
            // 刷新表格
            [self.tableView reloadData];
            
            //[MBProgressHUD hideHUD];
            //
            [MBProgressHUD showSuccess:@"加载成功"];
            
        }else
        {
            [MBProgressHUD showError:@"服务器维护中..."];
        }
    } failure:^(NSError *error) {
        //[MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"网络繁忙,请稍后再试!"];
        YFLog(@"YFHomeTool error is %@:", error);
    }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    return self.cardFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFCardCell *cell = [YFCardCell cellWithtableView:tableView];
    
    cell.cardFrame = self.cardFrames[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [self.cardFrames[indexPath.row] cardH];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 48;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[YFSectionHeaderView alloc] init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YFCard *card = [self.cardFrames[indexPath.row] card];
    
    YFPlayController *pVc = [[YFPlayController alloc] init];
    pVc.playTitle = card.title;
    pVc.urlStr = card.uri;
    
    
    [self.navigationController pushViewController:pVc animated:YES];
}


#pragma YFLoginControllerDelegate

- (void)openSliderWithUserInfo:(YFUserInfo *)userInfo
{
    [self openSlider:userInfo];
}

@end
