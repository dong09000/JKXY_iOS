//
//  YFURL.h
//  JKXY_iOS
//
//  Created by dyf on 14-9-23.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YFURL : NSObject <NSCoding>

/*
 * base_uri：本配置文件的地址，替换本地，下次从这个地址取（防止域名变更）；
 * slider_uri：侧边栏接口地址；
 * main_uri： 首页接口地址；
 * search_uri：搜索地址
 * login_uri：登录接口地址
 * reg_uri：注册接口地址
 * about_uri：关于我们的页面地址
 * splash_uri：闪屏图片地址，异步更新，下次使用
 * vip_uri：vip会员说明uri
 * faq_uri：常见问题uri
 * ios_app_uri：ios软件商店地址
 * weibo_uri：极客学院微博地址
 * share_app_uri：推荐给好友的uri
 * share_app_icon：推荐给好友的图片
 * share_app_text：推荐给好友的文字
 * help_uri：帮助信息地址
 * feedback_email：意见反馈接收邮件地址
 * feedback_title：意见反馈默认邮件标题
 
 "base_uri": "http://api.jikexy.com/v1/config",
 "slider_uri": "http://api.jikexy.com/v1/slider",
 "main_uri": "http://api.jikexy.com/v1/main",
 "search_uri": "http://api.jikexy.com/v1/search/q",
 "login_uri": "http://api.jikexy.com/v1/login",
 "reg_uri": "http://api.jikexy.com/v1/reg",
 "about_uri": "http://www.jikexy.com/m/about.html",
 "splash_uri": "http://assets.jikexueyuan.com/m/splash.png",
 "vip_uri": "http://www.jikexy.com/m/vip.html",
 "faq_uri": "http://www.jikexy.com/m/faq.html",
 "ios_app_uri": "itms-apps://itunes.apple.com/us/app/ji-ke-xue-yuan/id888244849?ls=1&mt=8",
 "weibo_uri": "http://weibo.com/jikexueyuan",
 "share_app_uri": "http://www.jikexy.com/m/app.html",
 "share_app_icon": "http://assets.jikexueyuan.com/m/icon.png",
 "share_app_text": "快去下载极客学院手机客户端，大量Android/iOS/swift/cocos2d-x的视频课程，支持离线学习",
 "feedback_email": "iceskysl-809197@mailer.tower.im",
 "feedback_title": "给极客学院反馈意见~",
 "author_status": "false",
 "buy_info_uri": "http://api.jikexy.com/v1/vip",
 "buy_action_uri": "http://api.jikexy.com/v1/buy",
 "pay_ret_uri": "http://api.jikexy.com/v1/payret",
 "copyright_uri": "http://api.jikexy.com/v1/help/s/copyright"
 
 
 "data": {
 "base_uri": "http://api.jikexy.com/v2/config",
 "slider_uri": "http://api.jikexy.com/v2/slider",
 "main_uri": "http://api.jikexy.com/v2/main",
 "search_uri": "http://api.jikexy.com/v2/search/q",
 "login_uri": "http://api.jikexy.com/v2/login",
 "reg_uri": "http://api.jikexy.com/v2/reg",
 "about_uri": "http://www.jikexy.com/m/about.html",
 "splash_uri": "http://assets.jikexueyuan.com/m/splash.png",
 "vip_uri": "http://www.jikexy.com/m/vip.html",
 "faq_uri": "http://www.jikexy.com/m/faq.html",
 "ios_app_uri": "itms-apps://itunes.apple.com/us/app/ji-ke-xue-yuan/id888244849?ls=1&mt=8",
 "weibo_uri": "http://weibo.com/jikexueyuan",
 "share_app_uri": "http://www.jikexy.com/m/app.html",
 "share_app_icon": "http://assets.jikexueyuan.com/m/icon.png",
 "share_app_text": "快去下载极客学院手机客户端，大量Android/iOS/swift/cocos2d-x的视频课程，支持离线学习",
 "feedback_email": "iceskysl-809197@mailer.tower.im",
 "feedback_title": "给极客学院反馈意见~",
 "author_status": "false",
 "buy_info_uri": "http://api.jikexy.com/v2/vip",
 "buy_action_uri": "http://api.jikexy.com/v2/buy",
 "pay_ret_uri": "http://api.jikexy.com/v2/payret",
 "copyright_uri": "http://api.jikexy.com/v2/help/s/copyright",
 "getclass_uri": "http://api.jikexy.com/v2/getclass"
 }
 */
@property (nonatomic, copy) NSString *base_uri;
@property (nonatomic, copy) NSString *slider_uri;
@property (nonatomic, copy) NSString *main_uri;
@property (nonatomic, copy) NSString *search_uri;
@property (nonatomic, copy) NSString *login_uri;
@property (nonatomic, copy) NSString *reg_uri;
@property (nonatomic, copy) NSString *about_uri;
@property (nonatomic, copy) NSString *splash_uri;
@property (nonatomic, copy) NSString *vip_uri;
@property (nonatomic, copy) NSString *faq_uri;
@property (nonatomic, copy) NSString *ios_app_uri;
@property (nonatomic, copy) NSString *weibo_uri;
@property (nonatomic, copy) NSString *share_app_uri;
@property (nonatomic, copy) NSString *share_app_icon;
@property (nonatomic, copy) NSString *share_app_text;
//@property (nonatomic, copy) NSString *help_uri;
@property (nonatomic, copy) NSString *feedback_email;
@property (nonatomic, copy) NSString *feedback_title;
@property (nonatomic, copy) NSString *author_status;
@property (nonatomic, copy) NSString *buy_info_uri;
@property (nonatomic, copy) NSString *buy_action_uri;
@property (nonatomic, copy) NSString *pay_ret_uri;
@property (nonatomic, copy) NSString *copyright_uri;
@property (nonatomic, copy) NSString *getclass_uri;

@end
