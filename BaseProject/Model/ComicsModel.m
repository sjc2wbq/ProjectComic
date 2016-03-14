//
//  ComicsModel.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "ComicsModel.h"

@implementation ComicsModel

@end
@implementation ComicsDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [ComicsDataItemsModel class]};
}

@end

@implementation ComicsDataItemsModel
+(NSDictionary *)replaceKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


