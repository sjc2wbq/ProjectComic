//
//  TwoButtonTableViewCell.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/11.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TwoButtonTableViewCellDelegate <NSObject>
-(void)leftButton:(UIButton *)clickIn;
-(void)rightButton:(UIButton *)clickIn;
@end

@interface TwoButtonTableViewCell : UITableViewCell
@property(nonatomic) UIButton *leftButton;
@property(nonatomic) UIButton *rightButton;
@property(nonatomic) UIImageView *headIcon;
@property(nonatomic) UILabel *oneWord;
@property(nonatomic,weak) id<TwoButtonTableViewCellDelegate> delegate;
@end
