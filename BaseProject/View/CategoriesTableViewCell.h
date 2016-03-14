//
//  CategoriesTableViewCell.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/11.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategorieTableViewDelegate <NSObject>

-(void)categoryButton:(UIButton*)button;

@end
@interface CategoriesTableViewCell : UITableViewCell
@property(nonatomic) UIButton *leftButton;
@property(nonatomic) UILabel *bottomLb;
@property(nonatomic) UIView *bgViwe;
@property(nonatomic) UICollectionView *collectionView;
@property(nonatomic) UICollectionViewFlowLayout *layout;
@property(nonatomic,weak) id<CategorieTableViewDelegate> delegate;

@end
