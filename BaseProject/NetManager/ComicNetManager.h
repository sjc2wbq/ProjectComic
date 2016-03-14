//
//  ComicNetManager.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComicNetManager : NSObject
/** 获得动漫所有分类*/
+(id)getComicWithPath:(NSString *)path ompletionHandler:kCompetionHandlerBlock;
/** 获得某类所有动漫*/
+(id)getComicsWithCategory:(NSString *)category page:(NSInteger)page competionHandler:kCompetionHandlerBlock;
+(id)getComicInfoWithID:(NSString *)ID completionHandler:kCompetionHandlerBlock;

+(id)getComicsBestInfoCompletionHandler:kCompetionHandlerBlock;
@end
