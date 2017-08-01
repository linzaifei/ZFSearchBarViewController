//
//  ZFLayoutView.m
//  ZFSearchBarViewController
//
//  Created by xinshiyun on 2017/7/28.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFLayoutView.h"
#import "ZFCollectionViewFlowLayout.h"
#import "ZFCollectionViewCell.h"
@interface ZFLayoutView()

@property(strong,nonatomic)NSMutableArray *titleArr;
@property(strong,nonatomic)DidClickTagBlock clickBlock;
@end

@implementation ZFLayoutView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setConfig];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
     
        [self setConfig];
    }
    return self;
}

-(void)setConfig{
    self.tagInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
    self.font = 14;
    self.textColor = [UIColor grayColor];
    self.backgroundColor = [UIColor clearColor];
    self.borderWidth = 1.0;
    self.borderColor = [UIColor lightGrayColor];
    self.cornerRadius = 2;
}

-(void)setDataArr:(NSArray *)dataArr{
    if (_dataArr != dataArr) {
        _dataArr = dataArr;
        NSInteger count = self.titleArr.count;
        
        if (_dataArr.count > count) {
            for (int i = 0 ; i < _dataArr.count - count ; i++) {
                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
                titleLabel.userInteractionEnabled = YES;
                titleLabel.textAlignment = NSTextAlignmentCenter;
                titleLabel.layer.masksToBounds = YES;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTag:)];
                titleLabel.tag = i + 400;
                [titleLabel addGestureRecognizer:tap];
                [self addSubview:titleLabel];
                [self.titleArr addObject:titleLabel];
            }
        }
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    __block CGRect frame = self.frame;
    __block CGFloat pointY = self.tagInsets.top;
    __block CGFloat pointX = self.tagInsets.left;
    __block CGFloat currentX = self.tagInsets.left;
    
    __weak ZFLayoutView *ws = self;
    [self.titleArr enumerateObjectsUsingBlock:^(UILabel  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.font = [UIFont systemFontOfSize:self.font];
        obj.textColor = self.textColor;
        obj.backgroundColor = self.backgroundColor;
        obj.layer.borderWidth = self.borderWidth;
        obj.layer.borderColor = self.borderColor.CGColor;
        obj.layer.cornerRadius = self.cornerRadius;
        obj.text = ws.dataArr[idx];
        CGFloat width = [ws getWidthWithString:ws.dataArr[idx]];
        currentX += (ws.minimumInteritemSpacing + width);
        if (currentX - ws.minimumInteritemSpacing + ws.tagInsets.right > frame.size.width) {
            pointX = ws.tagInsets.left;
            pointY += (ws.tagHeight + ws.minimumLineSpacing);
            currentX = (ws.tagInsets.left + ws.minimumInteritemSpacing + width);
        }else{
            pointX = currentX - (self.minimumInteritemSpacing + width);
        }
        obj.frame = CGRectMake(pointX, pointY,width, ws.tagHeight);
    }];
    
    CGFloat height = pointY + self.tagHeight + self.tagInsets.bottom;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);
}

-(CGFloat)getWidthWithString:(NSString *)str{
    CGFloat width = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}].width;
    if(width > CGRectGetWidth(self.frame) ) {
        width = CGRectGetWidth(self.frame) ;
    }
    return width + 10;
}

-(void)clickTag:(UITapGestureRecognizer *)tap{
    UILabel *label = (UILabel *)tap.view;
    if (self.clickBlock) {
        self.clickBlock(label.tag -400,label);
    }

}

/** 回调 */
-(void)setDidClickTag:(DidClickTagBlock)clickTag{
    self.clickBlock = clickTag;
}
-(NSMutableArray *)titleArr{
    if (_titleArr == nil) {
        _titleArr = [NSMutableArray array];
    }
    return _titleArr;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
