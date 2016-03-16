//
//  CategoriesTableViewCell.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/11.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "CategoriesTableViewCell.h"
#import "CategoriesCollectionViewCell.h"
#import "CarToonNetManager.h"
@implementation CategoriesTableViewCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = kRGBA(245, 245, 245, 1);
    }
    return self;
}

- (UIView *)bgViwe {
    if(_bgViwe == nil) {
        _bgViwe = [[UIView alloc] init];
        _bgViwe.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_bgViwe];
        [_bgViwe mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(kTopInst);
        }];
    }
    return _bgViwe;
}

- (UIButton *)leftButton {
    if(_leftButton == nil) {
        _leftButton = [[UIButton alloc] init];
        _leftButton.backgroundColor = [UIColor orangeColor];
        [_leftButton addTarget:self.delegate action:@selector(categoryButton:) forControlEvents:UIControlEventTouchUpInside];
//        [_leftButton.layer setMasksToBounds:YES];
//        [_leftButton.layer setCornerRadius:2];
        [self.bgViwe addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(kCategoryHeight);
            make.width.equalTo(kCategoryHeight+2);
            make.top.equalTo(kTopInst);
            make.left.equalTo(-2);
        }];
    }
    return _leftButton;
}


- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[CategoriesCollectionViewCell class] forCellWithReuseIdentifier:@"CateCell"];
        _collectionView.showsHorizontalScrollIndicator = NO;//关闭横向滚动条
        [self.bgViwe addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftButton.mas_right).equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(self.leftButton.mas_height);
            make.centerY.equalTo(self.leftButton.mas_centerY);
        }];
        
    }
    return _collectionView;
}

- (UILabel *)bottomLb {
    if(_bottomLb == nil) {
        _bottomLb = [[UILabel alloc] init];
        _bottomLb.text = @"title hehe";
        _bottomLb.textColor = [UIColor lightGrayColor];
        _bottomLb.backgroundColor = [UIColor whiteColor];
        [self.bgViwe addSubview:_bottomLb];
        [_bottomLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.left.equalTo(kLeftRightInset);
            make.top.equalTo(self.leftButton.mas_bottom);
            make.bottom.equalTo(0);
            make.height.equalTo(kTitlelbHeight);
        }];
    }
    return _bottomLb;
}

- (UICollectionViewFlowLayout *)layout {
    if(_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 0;
        _layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 0);
        
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        _layout.itemSize = CGSizeMake(kCategoryHeight, kCategoryHeight);
    }
    return _layout;
}
@end
