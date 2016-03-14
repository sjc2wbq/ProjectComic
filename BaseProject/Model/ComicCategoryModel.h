//
//  ComicCategoryModel.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "BaseModel.h"
//所有动漫类型
@class ComicCategoriyDataModel,ComicCategoryDataItemsModel;
@interface ComicCategoryModel : BaseModel

@property (nonatomic, copy) NSString *apiVersion;

@property (nonatomic, strong) ComicCategoriyDataModel *data;

@end
@interface ComicCategoriyDataModel : NSObject

@property (nonatomic, strong) NSArray<ComicCategoryDataItemsModel *> *items;
/** 貌似是某类所有漫画的前缀：http://api.puacg.com/data/movies/%s*/
@property (nonatomic, copy) NSString *pageLinkTemplate;

@end

@interface ComicCategoryDataItemsModel : NSObject
/** 漫画类型参数，获得某类漫画*/
@property (nonatomic, copy) NSString *name;
/** 中文分类标题*/
@property (nonatomic, copy) NSString *label;
/** 封面图*/
@property (nonatomic, copy) NSString *poster;

@end

