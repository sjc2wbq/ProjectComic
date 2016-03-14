//
//  Factory.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/1.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
+ (void)addBackItemToVC:(UIViewController *)vc;
+ (NSString *)md5:(NSString *)str;

@end
