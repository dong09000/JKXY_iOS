//
//  YFPlayController.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-17.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFPlayController.h"
#import "YFShowTool.h"
#import "YFShowFourthData.h"
#import "YFShowFirstData.h"
#import "YFShowSecondData.h"
#import "YFShowThirdData.h"
#import <MediaPlayer/MediaPlayer.h>

#import "YFShowUnderPlayerView.h"

#import "YFShowFirstPageController.h"
#import "YFShowSecondPageController.h"

#define YFShowPlayerFrame CGRectMake(0, 64, ScreenWidth, 180)
#define YFShowPlayerPage1ID @"YFShowPlayerPage1IDCell"
#define YFShowPlayerPage2ID @"YFShowPlayerPage2IDCell"
#define YFShowPlayerPage3ID @"YFShowPlayerPage3IDCell"

@interface YFPlayController () <UITableViewDataSource, UITableViewDelegate, YFShowUnderPlayerViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, YFShowFirstPageControllerDelegate>

@property (nonatomic, strong) NSMutableArray *cellModals;
@property (nonatomic, strong) MPMoviePlayerController *mpc;

@property (nonatomic, strong) YFShowThirdData *data3;
@property (nonatomic, strong) YFShowSecondData *data2;

#warning 修改成加载动画好些
@property (nonatomic, strong) UIImageView *playBegainImageView;
@property (nonatomic, copy) NSString *viedoUrlStr;

@property (nonatomic, strong) YFShowUnderPlayerView *midViewUnderPlayer;
@property (nonatomic, strong) UICollectionView *pageView;
@property (nonatomic, weak) UIImageView *imageUnderBtn;


@end

@implementation YFPlayController

// 懒加载
- (NSMutableArray *)cellModals
{
    if (!_cellModals) {
        _cellModals = [NSMutableArray array];
    }
    return _cellModals;
}

- (UIImageView *)playBegainImageView
{
    if (!_playBegainImageView) {
        _playBegainImageView = [[UIImageView alloc]initWithFrame:YFShowPlayerFrame];
        [_playBegainImageView setImage:[UIImage imageNamed:@"play_bg_play_btn"]];
    }
    _playBegainImageView.hidden = NO;
    return _playBegainImageView;
}
- (UIView *)midViewUnderPlayer
{
    if (!_midViewUnderPlayer) {
        _midViewUnderPlayer = [[YFShowUnderPlayerView alloc] init];
        _midViewUnderPlayer.delegate = self;
        _midViewUnderPlayer.btnsTitlesArray = @[ShowMidFirstBtnTitle, ShowMidSecondBtnTitle];
        [self.view addSubview:_midViewUnderPlayer];
    }
    return _midViewUnderPlayer;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = YFColor(243, 243, 243);
    
    
    
}

- (void)setupScrollPages
{
    CGFloat x = 0;
    CGFloat y = CGRectGetMaxY(self.midViewUnderPlayer.frame);
    CGFloat width = self.view.width;
    CGFloat height = self.view.height - y;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置collectionview中cell的大小
    layout.itemSize = CGSizeMake(width, height);
    // 设置collectionview横向滚动
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置collectionview 行 列 间距
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    UICollectionView *pageView = [[UICollectionView alloc] initWithFrame:CGRectMake(x, y , width, height) collectionViewLayout:layout];
    pageView.backgroundColor = [UIColor whiteColor];
    // 注册collectionView的cell
    [pageView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:YFShowPlayerPage1ID];
    [pageView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:YFShowPlayerPage2ID];
    [pageView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:YFShowPlayerPage3ID];
    [self.view addSubview:pageView];
    self.pageView = pageView;
    self.pageView.pagingEnabled = YES;
    
    self.pageView.dataSource = self;
    self.pageView.delegate = self;
}

#warning 待修改
- (void)setPlayTitle:(NSString *)playTitle
{
    _playTitle = [playTitle copy];
    
    self.title = @"视频详情";
}

- (void)setUrlStr:(NSString *)urlStr
{
    _urlStr = [_urlStr copy];
    
    [YFShowTool getShowAllInfoWithBaseUrlStr:urlStr success:^(YFShowAll *result) {
        //
        if ([result.status isEqualToString:statusTrue]) {
            //
            YFShowAll *showAllInfo = result;
            YFShowFirstData *data1 = result.data.firstObject;
            self.viedoUrlStr = data1.video_uri;
            self.data2 = result.data[1];
            self.data3 = result.data[2];
            YFShowFourthData *data4 = result.data[3];
            [self.cellModals addObjectsFromArray:data4.items];
            
            // 设置下面的目录,详情,相关课程
            [self setupScrollPages];
            
            [MBProgressHUD showSuccess:@"Success"];
        }else
        {
            [MBProgressHUD showError:@"服务器维护中..."];
        }
    } failure:^(NSError *error) {
        //
        [MBProgressHUD showError:@"网络繁忙,请稍后再试..."];
    }];
    
}

- (void)setViedoUrlStr:(NSString *)viedoUrlStr
{
    _viedoUrlStr = [viedoUrlStr copy];
    
    [self moviewPlayerControllerWithVideoUrlStr:viedoUrlStr];
    
    self.midViewUnderPlayer.frame = CGRectMake(0, CGRectGetMaxY(self.mpc.view.frame), ScreenWidth, ShowMidViewUnderPlayerHeight);
}

#pragma mark - 视频播放
- (void)moviewPlayerControllerWithVideoUrlStr:(NSString *)videoUrlStr
{
    // 创建播放器对象
    MPMoviePlayerController *mpc = [[MPMoviePlayerController alloc] init];
    // 设置URL
    mpc.contentURL = [NSURL URLWithString:videoUrlStr];
    
    // 添加播放器界面到控制器的view上面
    mpc.view.frame = YFShowPlayerFrame;
    [self.view addSubview:mpc.view];
    //mpc.controlStyle = MPMovieControlStyleDefault;
    
    [mpc shouldAutoplay];
    [mpc play];
    
//    UIView *controlView = [[UIView alloc] init];
//    controlView.backgroundColor = [UIColor redColor];
//    controlView.frame = CGRectMake(0, 0, 300, 50);
//    [mpc.view addSubview:controlView];
//    
//    // 隐藏自动自带的控制面板
//    mpc.controlStyle = MPMovieControlStyleNone;
    
    // 监听播放器
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieDidFinish) name:MPMoviePlayerPlaybackDidFinishNotification object:mpc];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieStateDidChange) name:MPMoviePlayerPlaybackStateDidChangeNotification object:mpc];
    
    //视频将要开始播放时的回调方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerNowPlayingMovieDidChangeButtonOnClick:) name:MPMoviePlayerNowPlayingMovieDidChangeNotification object:nil];
    
    self.mpc = mpc;
    
    [self.view addSubview:self.playBegainImageView];
}
- (void)playerNowPlayingMovieDidChangeButtonOnClick: (NSNotification*)aNotification
{
    //隐藏图片
    self.playBegainImageView.hidden = YES;

}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)movieDidFinish
{
    YFLog(@"----播放完毕");
}

- (void)movieStateDidChange
{
    YFLog(@"----播放状态--%ld", self.mpc.playbackState);
}

#pragma YFShowUnderPlayerViewDelegate方法

- (void)pageChageWithTag:(NSString *)strTag
{
    if ([strTag isEqualToString:ShowMidFirstBtnTitle]) {
        // 滑到 page1
        YFLog(@"tableView 显示  目录");
        
    }else if ([strTag isEqualToString:ShowMidSecondBtnTitle])
    {
        // 滑到 page2
        YFLog(@"textFiled 显示  详情");
    }else if ([strTag isEqualToString:ShowMidThirdBtnTitle])
    {
        // 滑到 page3
        YFLog(@"tableView 显示 相关课程");
    }
}

#pragma - YFShowFirstPageControllerDelegate
- (void)playWithURLStr:(NSString *)videoUrlStr
{
    [self.pageView reloadData];
    NSString *realplayUrlStr = [videoUrlStr stringByAppendingString:[YFCreateConnectStrUntiy CreateStr:@"other"]];
    [self.mpc stop];
    self.mpc.contentURL = [NSURL URLWithString:realplayUrlStr];
    [self.mpc play];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.midViewUnderPlayer.subviews.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:YFShowPlayerPage1ID forIndexPath:indexPath];
    
    if (0 == indexPath.item) {
        YFShowFirstPageController *sfpc = [[YFShowFirstPageController alloc] init];
        
        sfpc.data3 = self.data3;
        sfpc.delegate = self;
        [self addChildViewController:sfpc];
        
        sfpc.view.frame = cell.contentView.bounds;
        [cell.contentView addSubview:sfpc.view];
        
    } else if (1 == indexPath.item)
    {
        YFShowSecondPageController *sspc = [[YFShowSecondPageController alloc] init];
        
        sspc.data2 = self.data2;
        [self addChildViewController:sspc];
        sspc.view.frame = cell.contentView.bounds;
        sspc.height = cell.contentView.bounds.size.height;
        [cell.contentView addSubview:sspc.view];
        
    } else if (2 == indexPath.item)
    {
        
    }
    
    return cell;
}

@end
