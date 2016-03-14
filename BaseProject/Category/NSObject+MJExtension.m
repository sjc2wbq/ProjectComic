//
//  NSObject+MJExtension.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/1.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "NSObject+MJExtension.h"

@implementation NSObject (MJExtension)
+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

+ (NSDictionary *)mj_objectClassInArray{
    return [self objClassInArray];
}
+ (NSDictionary *)objClassInArray{
    return nil;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return [self replaceKeyFromPropertyName];
}
+ (NSDictionary *)replaceKeyFromPropertyName{
    return nil;
}

@end
