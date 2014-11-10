



#ifdef DEBUG  // 调试状态，打开LOG功能
#define YFLog(...) NSLog(__VA_ARGS__)
#else // 发展状态，关闭Log功能
#define YFLog(...)
#endif

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

// 判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] > 7.0)
// 是否为4inch
#define FourInch ([UIScreen mainScreen].bounds.size.height == 568.0)

// 颜色
#define YFColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define YFRandomColor YFColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define HMColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]



extern NSString * const UMAppKey;

extern NSString * const api_key;
extern NSString * const api_secret;

// 基本 urlStr
extern NSString * const testUrlStr;
extern NSString * const trueUrlStr;

extern NSString * const testCreateStr;

// 服务器返回正确
extern NSString * const statusTrue;


// 偏好设置的key
extern NSString * const YFUserAccount;
extern NSString * const YFUserPwd;

// Notification
extern NSString * const YFOpenLoginNotification;
extern NSString * const YFMainHeaderBtnDidClickNotification;
extern NSString * const YFMainHeaderBtnTitle;
extern NSString * const YFMainHeaderBtnUrlStr;

//// 通知(待修改成 const)
//#define YFMainHeaderBtnDidClickNotification @"MainHeaderbtnDidClickNotification"
//#define YFMainHeaderBtnTitle @"MainHeaderbtnDidClickNotification"


// 首页 Btn 中的常量
extern CGFloat const HomeBtnImageTopInset;
extern CGFloat const HomeBtnImageWidth;
extern CGFloat const HomeBtnImageHeight;


// 首页Card 中的常量
extern CGFloat const CardWidth;

extern CGFloat const CardLeftInset;

extern CGFloat const CardTopLabelTopInset;
extern CGFloat const CardTopLabelLeftInset;
extern CGFloat const CardTopLabelBottomInset;
extern CGFloat const CardTopLabelWidth;

extern CGFloat const CardTopBtnRightInset;
extern CGFloat const CardTopBtnTopInset;
extern CGFloat const CardTopBtnHeight;
extern CGFloat const CardTopBtnImaW;

extern CGFloat const CardMidIconTopInset;
extern CGFloat const CardMidIconLeftInset;
extern CGFloat const CardMidIconBottomInset;
extern CGFloat const CardMidIconRightInset;


extern CGFloat const CardBottomLabelLeftInset;
extern CGFloat const CardBottomLabelTopInset;
extern CGFloat const CardBottomLabelWidth;

extern CGFloat const CardBottomMarginBetweenLabelIcon;

extern CGFloat const CardBottomIconRightInset;
extern CGFloat const CardBottomIconBottomInset;
extern CGFloat const CardBottomIconWidth;
extern CGFloat const CardBottomIconHeight;

// show 常量
extern CGFloat const ShowMidViewUnderPlayerHeight;

extern NSString * const ShowMidFirstBtnTitle;
extern NSString * const ShowMidSecondBtnTitle;
extern NSString * const ShowMidThirdBtnTitle;

extern CGFloat const YFShowPageTopViewHeight;
