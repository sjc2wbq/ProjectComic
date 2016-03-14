//
//  CarToonNetManager.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarToonNetManager : NSObject
+(id)getDataWithPath:(NSString *)path completionHandler:kCompetionHandlerBlock;
/** 获得所有漫图分类*/
+(id)getAllCarToonsCompletionHandler:kCompetionHandlerBlock;
/** 获得某种分类漫图*/
+(id)getOneCarToonWithAlbumID:(NSString *)ID start:(NSInteger)start count:(NSInteger)count completionHandler:kCompetionHandlerBlock;
/** 获得热门漫图*/
+(id)getTopCarToonFromStart:(NSInteger)start count:(NSInteger)count completionHandler:kCompetionHandlerBlock;
@end
