//
//  TwoButtonTableViewCell.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/11.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "TwoButtonTableViewCell.h"

@implementation TwoButtonTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIButton *)leftButton {
    if(_leftButton == nil) {
        _leftButton = [[UIButton alloc] init];
        _leftButton.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(80);
            make.centerY.equalTo(0);
            make.left.equalTo(5);
        }];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if(_rightButton == nil) {
        _rightButton = [[UIButton alloc] init];
        _rightButton.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:_rightButton];
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-5);
            make.left.equalTo(self.leftButton.mas_right).equalTo(5);
            make.width.height.equalTo(self.leftButton);
        }];
    }
    return _rightButton;
}




- (UIImageView *)headIcon {
    if(_headIcon == nil) {
        _headIcon = [[UIImageView alloc] init];
        [_headIcon.layer setCornerRadius:40];
        [_headIcon.layer setMasksToBounds:YES];
        [self.contentView addSubview:_headIcon];
        [_headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.top.equalTo(5);
            make.height.equalTo(80);
            make.width.equalTo(80);
        }];
    }
    return _headIcon;
}

- (UILabel *)oneWord {
    if(_oneWord == nil) {
        _oneWord = [[UILabel alloc] init];
        _oneWord.numberOfLines = 0;
        _oneWord.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:_oneWord];
        [_oneWord mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headIcon.mas_centerY);
            make.left.equalTo(self.headIcon.mas_right).equalTo(10);
            make.right.equalTo(-5);
        }];
    }
    return _oneWord;
}
@end
