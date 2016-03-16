//
//  ShowViewController.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/14.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()<MWPhotoBrowserDelegate>

@end

@implementation ShowViewController

-(instancetype)init{
    if (self = [super init]) {
        self.delegate = self;

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.displayActionButton = YES; // Show action button to allow sharing, copying, etc (defaults to YES)
    self.displayNavArrows = NO; // Whether to display left and right nav arrows on toolbar (defaults to NO)
    self.displaySelectionButtons = NO; // Whether selection buttons are shown on each image (defaults to NO)
    self.zoomPhotosToFill = YES; // Images that almost fill the screen will be initially zoomed to fill (defaults to YES)
    self.alwaysShowControls = NO; // Allows to control whether the bars and controls are always visible or whether they fade away to show the photo full (defaults to NO)
    self.enableGrid = YES; // Whether to allow the viewing of all the photo thumbnails on a grid (defaults to YES)
    self.startOnGrid = NO; // Whether to start on the grid of thumbnails instead of the first photo (defaults to NO)
    self.autoPlayOnAppear = NO; // Auto-play first video
    
    // Customise selection images to change colours if required
    self.customImageSelectedIconName = @"ImageSelected.png";
    self.customImageSelectedSmallIconName = @"ImageSelectedSmall.png";
    

    [self showNextPhotoAnimated:YES];
    [self showPreviousPhotoAnimated:YES];
//    [self setCurrentPhotoIndex:10];

}


- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.picArr.count;
}
//2.每一个显示什么样式
- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
   // MWPhoto *photo = [MWPhoto photoWithURL:[self.picVM onePicImg:index]];
    return self.picArr[index];
    //return photo;
}
- (NSMutableArray *)picArr {
    if(_picArr == nil) {
        _picArr = [[NSMutableArray alloc] init];
    }
    return _picArr;
}

@end
