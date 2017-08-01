//
//  ZFCollectionViewFlowLayout.m
//  ZFSearchBarViewController
//
//  Created by xinshiyun on 2017/7/27.
//  Copyright © 2017年 林再飞. All rights reserved.
//

#import "ZFCollectionViewFlowLayout.h"

@interface ZFCollectionViewFlowLayout()
@property(assign,nonatomic)CGFloat pointY;
@end

@implementation ZFCollectionViewFlowLayout

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *layoutAttributesArr = [super layoutAttributesForElementsInRect:rect];
    

    __block CGRect frame;
    self.pointY = self.sectionInset.top;
    __block CGFloat pointX = self.sectionInset.left;
    __block CGFloat currentX = self.sectionInset.left;
    
    [layoutAttributesArr enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull attribute, NSUInteger idx, BOOL * _Nonnull stop) {
        if (attribute.representedElementKind == UICollectionElementKindSectionHeader) {
            return;
        }
        frame = attribute.frame;
        currentX += (self.minimumInteritemSpacing + frame.size.width);
        
        if (currentX - self.minimumInteritemSpacing + self.sectionInset.right > self.collectionView.frame.size.width) {
            
            pointX = self.sectionInset.left;
            self.pointY += (frame.size.height + self.minimumLineSpacing);
            currentX = (self.sectionInset.left + self.minimumInteritemSpacing + frame.size.width);
        }else{
            pointX = currentX - (self.minimumInteritemSpacing + frame.size.width);
        }
        attribute.frame = CGRectMake(pointX, self.pointY, frame.size.width, frame.size.height);

    }];
   
    return layoutAttributesArr;
}

-(CGSize)collectionViewContentSize{
    NSLog(@"%f",self.collectionView.frame.size.height);
    NSLog(@"%f",self.collectionView.frame.size.width);
    NSLog(@"%f",self.pointY);
   return CGSizeMake(self.collectionView.frame.size.width, self.pointY + 28);
}

@end
