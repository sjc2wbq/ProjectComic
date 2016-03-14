//
//  NSObject+MJExtension.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/1.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>
@interface NSObject (MJExtension)
+ (id)parse:(id)responseObj;
+ (NSDictionary *)objClassInArray;
+ (NSDictionary *)replaceKeyFromPropertyName;
@end
