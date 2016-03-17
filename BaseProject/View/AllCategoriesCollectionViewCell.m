//
//  AllCategoriesCollectionViewCell.m
//  BaseProject
//
//  Created by JunChuanShi on 16/3/17.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "AllCategoriesCollectionViewCell.h"
#define kAllCategoryCellHeight (kScreenW-10*2-5*2)/2
@implementation AllCategoriesCollectionViewCell

- (UIImageView *)iconImgV {
    if(_iconImgV == nil) {
        _iconImgV = [[UIImageView alloc] init];
        [_iconImgV.layer setCornerRadius:5];
        [_iconImgV.layer setMasksToBounds:YES];
        _iconImgV.contentMode = UIViewContentModeScaleAspectFill;

        [self.contentView addSubview:_iconImgV];
        [_iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.width.height.equalTo(kAllCategoryCellHeight);
        }];
    }
    return _iconImgV;
}

- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = kRGBA(245, 245, 245, 1);
        [_label.layer setMasksToBounds:YES];
        [_label.layer setCornerRadius:5];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImgV.mas_bottom).equalTo(5);
            make.left.right.equalTo(0);
            make.height.equalTo(35);
        }];
    }
    return _label;
}
@end
