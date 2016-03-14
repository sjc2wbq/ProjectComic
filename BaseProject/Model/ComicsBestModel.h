//
//  ComicsBestModel.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/12.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "BaseModel.h"

@class ComicsBestDataModel,ComicsBestDataItemsModel;
@interface ComicsBestModel : BaseModel

@property (nonatomic, copy) NSString *apiVersion;

@property (nonatomic, strong) ComicsBestDataModel *data;

@end
@interface ComicsBestDataModel : NSObject

@property (nonatomic, strong) NSArray<ComicsBestDataItemsModel *> *items;

@end

@interface ComicsBestDataItemsModel : NSObject

@property (nonatomic, copy) NSString *genre;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *poster;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *summary;

@end

