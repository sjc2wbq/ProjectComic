//
//  ComicsViewModel.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/12.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "ComicsViewModel.h"
#import "ComicNetManager.h"
#import "ComicsBestModel.h"
@implementation ComicsViewModel

//@property(nonatomic) NSInteger comicsBestNum{
//    
//}
//@property(nonatomic) NSArray *comicsBestArr{
//    
//}
-(NSInteger)comicsBestNum{
    return self.comicsBestArr.count;
}
-(NSString *)titleAtRow:(NSInteger)row{
    return [self comicsBestModelAtRow:row].title;
}
-(NSString *)genreAtRow:(NSInteger)row{
    return [self comicsBestModelAtRow:row].genre;

}
-(NSString *)infoAtRow:(NSInteger)row{
    return [self comicsBestModelAtRow:row].summary;
}
-(NSURL *)bgImgVAtRow:(NSInteger)row{
    NSString *path = [self comicsBestModelAtRow:row].poster;
    return [NSURL URLWithString:path];
}

-(ComicsBestDataItemsModel *)comicsBestModelAtRow:(NSInteger)row{
    return self.comicsBestArr[row];
}
-(void)getDataWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *))completionHandle{
    self.dataTask = [ComicNetManager getComicsBestInfoCompletionHandler:^(ComicsBestModel *model, NSError *error) {
        self.comicsBestArr = model.data.items;
        completionHandle(error);
    }];
}
- (NSArray *)comicsBestArr {
    if(_comicsBestArr == nil) {
        _comicsBestArr = [[NSArray alloc] init];
    }
    return _comicsBestArr;
}
@end
