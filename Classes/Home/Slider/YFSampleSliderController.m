//
//  YFSampleSliderController.m
//  JKXY_iOS
//
//  Created by dyf on 14-10-9.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFSampleSliderController.h"
#import "YFLoginController.h"
#import "YFNavigationController.h"

@interface YFSampleSliderController ()

@end

@implementation YFSampleSliderController
- (IBAction)backOnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)openLoginOnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:YFOpenLoginNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //
    }
    return self;
}

@end
