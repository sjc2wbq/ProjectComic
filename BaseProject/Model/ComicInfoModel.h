//
//  ComicInfoModel.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "BaseModel.h"
@class ComicInfoDataModel,ComicInfoDataItemsModel;
//动画详情页
@interface ComicInfoModel : BaseModel


@property (nonatomic, copy) NSString *apiVersion;

@property (nonatomic, strong) ComicInfoDataModel *data;

@end

@interface ComicInfoDataModel : NSObject

@property (nonatomic, assign) NSInteger totalPages;

@property (nonatomic, assign) NSInteger pageIndex;

@property (nonatomic, assign) NSInteger totalItems;

@property (nonatomic, strong) NSArray<ComicInfoDataItemsModel *> *items;

@property (nonatomic, assign) NSInteger itemPerPage;

@end

@interface ComicInfoDataItemsModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *poster;

@property (nonatomic, assign) CGFloat ratings;

@property (nonatomic, assign) NSInteger episodeCount;

@property (nonatomic, assign) NSInteger totalEpisodeCount;

@end

