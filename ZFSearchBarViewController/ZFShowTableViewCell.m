//
//  ZFShowTableViewCell.m
//  ZFSearchBarViewController
//
//  Created by xinshiyun on 2017/7/20.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFShowTableViewCell.h"
@interface ZFShowTableViewCell()

@property(strong,nonatomic)UILabel *piceLabel;
@end

@implementation ZFShowTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    
    self.piceLabel = [UILabel new];
    self.piceLabel.font = [UIFont systemFontOfSize:15];
    self.piceLabel.textColor = [UIColor grayColor];
    self.piceLabel.textAlignment = NSTextAlignmentCenter;
    self.piceLabel.numberOfLines = 0;
    self.piceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.piceLabel];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_piceLabel]-0-|" options:NSLayoutFormatDirectionMask metrics:nil views:NSDictionaryOfVariableBindings(_piceLabel)]];
    
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_piceLabel]-0-|" options:NSLayoutFormatDirectionMask metrics:nil views:NSDictionaryOfVariableBindings(_piceLabel)]];
    self.piceLabel.text = @"dasdaddadasdadadsadasdasdadasdsadadsadasdaddsadasddsa啊首付大厦法定是发顺丰法第三方分身乏术放散阀发发生的方式打发第三方撒发士大夫撒旦放到发送发顺丰范德萨范德萨发方法撒法第三方付付付所多ddaddasdadddasdsdas";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
