//
//  OneWordTableViewCell.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/11.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "OneWordTableViewCell.h"

@implementation OneWordTableViewCell
- (UILabel *)message {
    if(_message == nil) {
        _message = [[UILabel alloc] init];
        _message.text = @"message";
        _message.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_message];
        [_message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImgV.mas_bottom).equalTo(5);
            make.left.equalTo(5);
            make.right.equalTo(-5);
        }];
    }
    return _message;
}

- (UIImageView *)bgImgV {
    if(_bgImgV == nil) {
        _bgImgV = [[UIImageView alloc] init];
        _bgImgV.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_bgImgV];
        [_bgImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.right.equalTo(-5);
            make.top.equalTo(5);
            make.height.equalTo(200);
        }];
    }
    return _bgImgV;
}
- (UIView *)seperateLine {
    if(_seperateLine == nil) {
        _seperateLine = [[UIView alloc] init];
        _seperateLine.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_seperateLine];
        [_seperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.message.mas_bottom);
            make.left.right.equalTo(0);
            make.height.equalTo(1);
            make.bottom.equalTo(0);
        }];
    }
    return _seperateLine;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        [self bgImgV];
        [self message];
        [self seperateLine];
    }
    return self;
}

@end
