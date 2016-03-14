//
//  ComicNetManager.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "ComicNetManager.h"
#import "ComicsBestModel.h"

@implementation ComicNetManager
+(id)getComicsBestInfoCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kComicsBestPath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([ComicsBestModel parse:responseObj],error);
    }];
}
@end
