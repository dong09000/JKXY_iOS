//
//  YFAppDelegate.m
//  JKXY_iOS
//
//  Created by dyf on 14-9-17.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "YFAppDelegate.h"

#import "YFNavigationController.h"
#import "YFHomeController.h"
#import "YFConfigTool.h"

#import "SDImageCache.h"
#import "SDWebImageManager.h"

@implementation YFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    // 2.显示窗口(成为主窗口)
    [self.window makeKeyAndVisible];
    
    // 3.设置窗口的根控制器
    YFConfig *config = [YFConfigTool config];
#warning 待完善(根控制器选择--工具类)
    if (config) {
        // 选则根控制器
        YFNavigationController *nav = [[YFNavigationController alloc] initWithRootViewController:[[YFHomeController alloc] init]];
        self.window.rootViewController = nav;
    } else
    {
        // 4.获取并且保存 URL 字符串接口和用户的身份(auth_level 游客 = 0,普通用户 =1, 月会员 = 2, 年会员 =3)
        [YFConfigTool urlInfoWithParam:nil success:^(YFConfig *result) {
            
            YFLog(@"result = %@", result);
            // 保存
            [YFConfigTool saveConfig:result];

            // 切换根控制器(可能去新特性)
            YFNavigationController *nav = [[YFNavigationController alloc] initWithRootViewController:[[YFHomeController alloc] init]];
            self.window.rootViewController = nav;
            
        } failure:^(NSError *error) {
            //
            YFLog(@"%@", error);
        }];
    }
    
    

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    // 赶紧清除所有的内存缓存
    [[SDImageCache sharedImageCache] clearMemory];
    
    // 赶紧停止正在进行的图片下载操作
    [[SDWebImageManager sharedManager] cancelAll];
}

@end
