//
//  YFShowSecondPageController.m
//  JKXY_iOS
//
//  Created by dyf on 14/10/19.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowSecondPageController.h"
#import "YFShowSecondData.h"

@interface YFShowSecondPageController ()

/** label+btn, 但是目前没有数据 */
@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UITextView *textView;

@end

@implementation YFShowSecondPageController

- (UIView *)topView
{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.frame = CGRectMake(0, 0, self.view.width, YFShowPageTopViewHeight);
        [self.view addSubview:_topView];
    }
    return _topView;
}
- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        //_textView.editable = NO;
        _textView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_textView];
    }
    return _textView;
}

- (void)setHeight:(CGFloat)height
{
    _height = height;
    
    _textView.frame = CGRectMake(10, YFShowPageTopViewHeight, self.view.width - 20, self.height - YFShowPageTopViewHeight * 2);
}

- (void)setData2:(YFShowSecondData *)data2
{
    _data2 = data2;
    
    NSString *htmlContentStr = data2.content;
    NSAttributedString *attributedStr = [[NSAttributedString alloc] initWithData:[htmlContentStr dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.textView.attributedText = attributedStr;
    
    [self topView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
