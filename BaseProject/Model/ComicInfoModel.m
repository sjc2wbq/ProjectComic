//
//  ComicInfoModel.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "ComicInfoModel.h"

@implementation ComicInfoModel

@end


@implementation ComicInfoDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [ComicInfoDataItemsModel class]};
}

@end


@implementation ComicInfoDataItemsModel
+(NSDictionary *)replaceKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


