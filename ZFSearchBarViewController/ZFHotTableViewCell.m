//
//  ZFHotTableViewCell.m
//  ZFSearchBarViewController
//
//  Created by xinshiyun on 2017/7/31.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFHotTableViewCell.h"
#import "ZFLayoutView.h"

@interface ZFHotTableViewCell()
@property(strong,nonatomic)ZFLayoutView *layoutView;
@end
@implementation ZFHotTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    self.layoutView = [[ZFLayoutView alloc] initWithFrame:CGRectMake(0, 100, 320, 0)];
    
    self.layoutView.tagHeight = 30;
//    self.layoutView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.layoutView];
    
    [self.layoutView setDidClickTag:^(NSInteger index, UILabel *tagLabel) {
        NSLog(@"%@",tagLabel.text);
    }];
    self.layoutView.dataArr = @[@"几点几数据的",@"多撒多",@"几点",@"多打算大多",@"多",@"多大多",@"多打算大多hg"];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
   
    
  

    
    
}

-(void)setDataArr:(NSArray *)dataArr{
    _dataArr = dataArr;
    
}


@end
