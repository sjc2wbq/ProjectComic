//
//  CategoriesCollectionViewCell.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/12.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "CategoriesCollectionViewCell.h"

@implementation CategoriesCollectionViewCell
- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:12];
        _label.backgroundColor = kRGBA(0, 0, 0, 0.5);
        [_label.layer setCornerRadius:2];
//        _label.layer.masksToBounds = YES;
        [_label.layer setMasksToBounds:YES];
        [self.imgV addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(0);
            make.height.equalTo(20);
        }];
    }
    return _label;
}

- (UIImageView *)imgV {
    if(_imgV == nil) {
        _imgV = [[UIImageView alloc] init];
        _imgV.contentMode = UIViewContentModeScaleAspectFill;
        _imgV.clipsToBounds = YES;
        _imgV.backgroundColor = [UIColor orangeColor];
//        [_imgV.layer setCornerRadius:2];
//        [_imgV.layer setMasksToBounds:YES];
        [self.contentView addSubview:_imgV];
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(kCategoryHeight);
        }];
    }
    return _imgV;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //[self label];
        [self imgV];
    }
    return self;
}

@end
