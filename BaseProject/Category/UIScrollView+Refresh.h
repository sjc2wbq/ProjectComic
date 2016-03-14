//
//  UIScrollView+Refresh.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/1.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
@interface UIScrollView (Refresh)

- (void)addAnimateHeaderRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 添加脚部自动刷新 */
- (void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 添加脚步返回刷新 */
- (void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 结束头部刷新 */
- (void)endHeaderRefresh;
/** 结束脚部刷新 */
- (void)endFooterRefresh;
/** 开始头部刷新 */
- (void)beginHeaderRefresh;
/** 开始脚部刷新 */
- (void)beginFooterRefresh;
-(void)loadNewData;
@end
