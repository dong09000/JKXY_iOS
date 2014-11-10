//
//  YFShowFisrtPageCell.m
//  JKXY_iOS
//
//  Created by dyf on 14/10/19.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "YFShowFisrtPageCell.h"
#import "YFShowThirdDataItemsElement.h"

@interface YFShowFisrtPageCell ()
@property (weak, nonatomic) IBOutlet UILabel *idLab;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UILabel *duraLab;

@end

@implementation YFShowFisrtPageCell


- (void)setData3Ele:(YFShowThirdDataItemsElement *)data3Ele
{
    _data3Ele = data3Ele;
    
    self.titleLab.text = data3Ele.title;
    self.duraLab.text = data3Ele.length;
    self.idLab.text = data3Ele.content;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"firstPage";
    YFShowFisrtPageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"YFShowFisrtPageCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
