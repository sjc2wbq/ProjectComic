//
//  CarToonViewModel.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/11.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarToonModel.h"
#import "OneCarToonModel.h"
#import "NSObject+ViewModel.h"
#import "CarToonNetManager.h"

typedef NS_ENUM(NSUInteger, picType) {
    picTop,
    picGirl,
    picScene,
    picOneCategory
};
@interface CarToonViewModel : NSObject
@property(nonatomic) NSArray *categoriseArr;
//图片数组
@property(nonatomic) NSMutableArray *oneCategoryArr;
@property(nonatomic) NSString *oneCategoryID;
@property(nonatomic) NSMutableArray *picArr;
@property(nonatomic) NSInteger categoriesNum;
@property(nonatomic) NSInteger picNum;
//所有分类的信息
-(NSURL *)categoryImg:(NSInteger)row;
-(NSString *)categoryTitle:(NSInteger)row;
-(NSString *)photoNum:(NSInteger)row;
-(NSString *)categoryId:(NSInteger)row;

-(void)getAllCategoriesCompletionHandler:(void(^)(NSError *error))completionHandler;
-(void)getDataWithType:(picType)type RequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *error))completionHandle;
//图片信息
-(NSURL *)onePicImg:(NSInteger)row;
-(NSString *)heightImg:(NSInteger)row;
-(NSString *)widthImg:(NSInteger)row;
-(NSString *)hits:(NSInteger)row;
-(NSString *)ID:(NSInteger)row;

@end
