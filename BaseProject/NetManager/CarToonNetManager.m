//
//  CarToonNetManager.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "CarToonNetManager.h"
#import "CarToonModel.h"
#import "OneCarToonModel.h"
@implementation CarToonNetManager
+(id)getTopCarToonFromStart:(NSInteger)start count:(NSInteger)count completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kTopCarTooPath,start,count];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([OneCarToonModel parse:responseObj],error);
    }];
}
+(id)getDataWithPath:(NSString *)path completionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([OneCarToonModel parse:responseObj],error);
    }];
}
+(id)getAllCarToonsCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kCarToonPath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([CarToonModel parse:responseObj],error);
    }];
}
+(id)getOneCarToonWithAlbumID:(NSString *)ID start:(NSInteger)start count:(NSInteger)count completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kOneCarToonPath,ID,start,count];
    return [self GET:path parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([OneCarToonModel parse:responseObj],error);
    }];
}
@end
