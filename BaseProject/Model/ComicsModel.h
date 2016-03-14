//
//  ComicsModel.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "BaseModel.h"
@class ComicsDataModel,ComicsDataItemsModel;
//某一类型所有动漫
@interface ComicsModel : BaseModel
@property (nonatomic, copy) NSString *apiVersion;
@property (nonatomic, strong) ComicsDataModel *data;
@end

@interface ComicsDataModel : NSObject

@property (nonatomic, assign) NSInteger totalPages;

@property (nonatomic, assign) NSInteger pageIndex;

@property (nonatomic, assign) NSInteger totalItems;

@property (nonatomic, strong) NSArray<ComicsDataItemsModel *> *items;

@property (nonatomic, assign) NSInteger itemPerPage;

@end

@interface ComicsDataItemsModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *poster;

@property (nonatomic, assign) CGFloat ratings;

@property (nonatomic, assign) NSInteger episodeCount;

@property (nonatomic, assign) NSInteger totalEpisodeCount;

@end

