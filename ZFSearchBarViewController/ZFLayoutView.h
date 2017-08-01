//
//  ZFLayoutView.h
//  ZFSearchBarViewController
//
//  Created by xinshiyun on 2017/7/28.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^DidClickTagBlock)(NSInteger index,UILabel *tagLabel);

@interface ZFLayoutView : UIView
/** 配置信息 */

/** 默认 (5, 5, 5, 5) */
@property(assign,nonatomic)UIEdgeInsets tagInsets;
/** 默认 10*/
@property(assign,nonatomic)CGFloat minimumLineSpacing;
/** 默认 10 */
@property(assign,nonatomic)CGFloat minimumInteritemSpacing;
/** 标签高度 */
@property(assign,nonatomic)CGFloat tagHeight;
/** 标签颜色 */
@property(strong,nonatomic)UIColor *textColor;
/** 标签背景颜色颜色 */
@property(strong,nonatomic)UIColor *backgroundColor;
/** text 大小 */
@property(assign,nonatomic)NSInteger font;
/** 边缘宽度 大小 */
@property(assign,nonatomic)NSInteger borderWidth;
/** 边缘宽度 颜色 */
@property(strong,nonatomic)UIColor *borderColor;
/** 边缘角度 */
@property(assign,nonatomic)CGFloat cornerRadius;

/** 回调 */
-(void)setDidClickTag:(DidClickTagBlock)clickTag;

/** 数据源 */
@property(strong,nonatomic)NSArray *dataArr;

@end
