//
//  pathContainers.h
//  BaseProject
//
//  Created by junchuanshi on 16/3/9.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#ifndef pathContainers_h
#define pathContainers_h

#define kCarToonPageCount 12

#define kCarToonPath @"http://magisword.com/acgwallpaper/api/album.php?cate=1"
#define kOneCarToonPath @"http://magisword.com/acgwallpaper/api/photo_new.php?aid=%@&start=%ld&count=%ld"
#define kTopCarTooPath @"http://magisword.com/acgwallpaper/api/photo_top.php?start=%ld&count=%ld"
#define kGirlCarToonPath @"http://magisword.com/acgwallpaper/api/photo_new.php?aid=31&start=%ld&count=%ld"
#define kSceneCarToonPath @"http://magisword.com/acgwallpaper/api/photo_new.php?aid=183&start=%ld&count=%ld"
#define kCarToonPicPath @"http://7sbp4b.com1.z0.glb.clouddn.com/"


/** 所有动漫分类*/
#define kComicCategoryPath @"http://api.puacg.com/data/categories.json"
//http://api.puacg.com/data/movies/romance/new/pages/2.json
/** 某一类型所有动漫*/
#define kComicsPath @"http://api.puacg.com/data/movies/%@/new/pages/%ld.json"
/** 某个动漫的详情*/
#define kComicInfoPath @"http://api.puacg.com/data/details/%@.json"
/** 精选页*/
#define kComicsBestPath @"http://api.puacg.com/data/1.1/featured.json"
/** 新番页*/
#define kComicNew @"http://api.puacg.com/data/new.json"

#endif /* pathContainers_h */
