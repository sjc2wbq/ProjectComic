//
//  CarToonViewModel.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/11.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "CarToonViewModel.h"

@implementation CarToonViewModel
-(NSURL *)categoryImg:(NSInteger)row{
    return nil;
    
}
-(NSString *)categoryTitle:(NSInteger)row{
    return nil;
    
}
-(NSString *)photoNum:(NSInteger)row{
    return nil;
    
}
-(NSString *)categoryId:(NSInteger)row{
    return nil;
}
-(void)getAllCategoriesCompletionHandler:(void(^)(NSError *error))completionHandler{
    self.dataTask = [CarToonNetManager getAllCarToonsCompletionHandler:^(id model, NSError *error) {
        self.categoriseArr = model;
        completionHandler(error);
    }];
}
-(void)getDataWithType:(picType)type RequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *))completionHandle{
    
    NSInteger start = arc4random()%8+1;
    NSInteger count = start + 5;
    switch (type) {
        case picTop: {
            NSString *path = [NSString stringWithFormat:kTopCarTooPath,start,count];
            [self getDataWithRequestMode:requestMode andPath:path completionHandler:completionHandle];
            break;
        }
        case picGirl: {
            NSString *path = [NSString stringWithFormat:kGirlCarToonPath,start,count];
            [self getDataWithRequestMode:requestMode andPath:path completionHandler:completionHandle];
            break;
        }
        case picScene: {
            NSString *path = [NSString stringWithFormat:kSceneCarToonPath,start,count];
            [self getDataWithRequestMode:requestMode andPath:path completionHandler:completionHandle];
            break;
        }
        case picOther: {
            
            break;
        }
    }
}

-(void)getDataWithRequestMode:(RequestMode)mode andPath:(NSString *)path completionHandler:(void(^)(NSError *error))completionHandler {
//    switch (mode) {
//        case RequestModeRefresh: {
//       
//            break;
//        }
//        case RequestModeMore: {
//            
//            break;
//        }
//    }
    self.dataTask = [CarToonNetManager getDataWithPath:path completionHandler:^(id model, NSError *error) {
        self.picArr = model;
        completionHandler(error);
    }];
}


-(OneCarToonModel *)OneCarToomModel:(NSInteger)row{
    return (OneCarToonModel *)self.picArr[row];
}
-(NSInteger)picNum{
    return self.picArr.count;
}
-(NSURL *)onePicImg:(NSInteger)row{
    NSString *path = [self OneCarToomModel:row].path;
    path = [kCarToonPicPath stringByAppendingString:path];
//    NSLog(@"path:%@",path);
    return [NSURL URLWithString:path];
    
}
-(NSString *)heightImg:(NSInteger)row{
    return [self OneCarToomModel:row].height;
    
}
-(NSString *)widthImg:(NSInteger)row{
    return  [self OneCarToomModel:row].width;
    
}
-(NSString *)hits:(NSInteger)row{
    return [self OneCarToomModel:row].hits;
    
}
@end
