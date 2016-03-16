//
//  OneCategoryPicTableViewCell.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/16.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "OneCategoryPicTableViewCell.h"

@implementation OneCategoryPicTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self iconImgV];
        [self blackLine];
        [self viewCount];
    }
    return self;
}
- (UIImageView *)iconImgV {
    if(_iconImgV == nil) {
        _iconImgV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconImgV];
        [_iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _iconImgV;
}

- (UIView *)blackLine {
    if(_blackLine == nil) {
        _blackLine = [[UIView alloc] init];
        _blackLine.backgroundColor = kRGBA(0, 0, 0, 0.5);
        [self.contentView addSubview:_blackLine];
        [_blackLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _blackLine;
}

- (UILabel *)viewCount {
    if(_viewCount == nil) {
        _viewCount = [[UILabel alloc] init];
        _viewCount.backgroundColor = [UIColor clearColor];
        _viewCount.textColor = [UIColor whiteColor];
        _viewCount.textAlignment = NSTextAlignmentRight;
        [self.blackLine addSubview:_viewCount];
        [_viewCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
            make.width.equalTo(100);
        }];
    }
    return _viewCount;
}

@end
