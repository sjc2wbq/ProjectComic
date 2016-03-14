//
//  ComicsViewModel.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/12.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+ViewModel.h"
@interface ComicsViewModel : NSObject

@property(nonatomic) NSInteger comicsBestNum;
@property(nonatomic) NSArray *comicsBestArr;
-(NSString *)titleAtRow:(NSInteger)row;
-(NSString *)genreAtRow:(NSInteger)row;
-(NSString *)infoAtRow:(NSInteger)row;
-(NSURL *)bgImgVAtRow:(NSInteger)row;


@end
