//
//  ComicCategoryModel.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "ComicCategoryModel.h"

@implementation ComicCategoryModel

@end
@implementation ComicCategoriyDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [ComicCategoryDataItemsModel class]};
}

@end


@implementation ComicCategoryDataItemsModel

@end


