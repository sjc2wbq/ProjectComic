//
//  ContentViewController.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/10.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "ContentViewController.h"
#import "TwoButtonTableViewCell.h"
#import "OneWordTableViewCell.h"
#import "CategoriesTableViewCell.h"
#import "CarToonViewModel.h"
#import "CategoriesCollectionViewCell.h"
#import "ComicsViewModel.h"
#import "NSObject+AFNetworking.h"
#import "ShowViewController.h"
#import "PicturesViewController.h"
#import "AllCategoriesViewController.h"
@interface ContentViewController()<UITableViewDelegate,UITableViewDataSource,iCarouselDelegate,iCarouselDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CategorieTableViewDelegate,TwoButtonTableViewCellDelegate>
@property(nonatomic) UITableView *tableView;
@property(nonatomic) UICollectionView *bestCollectionView;
@property(nonatomic) UICollectionView *allCateColletionView;
@property(nonatomic) UIPageControl *pageControl;
/**
 *  头部展示iC
 */
@property(nonatomic) iCarousel *headerCarousel;
/**
 *  头部展示跳动时间
 */
@property(nonatomic) NSTimer *timer;
/**
 *  卡通壁纸ViewModel
 */
@property(nonatomic) CarToonViewModel *carToonTopVV;
/**
 *  tableview第一组colleview数组
 */
@property(nonatomic) NSMutableArray *bestImgArr;
/**
 *  tableview第二组colleview数组
 */
@property(nonatomic) NSMutableArray *allCategoriesArr;
/**
 *  动漫精选ViewModel（待取舍）
 */
@property(nonatomic) ComicsViewModel *comicsBestVV;
/**
 *  一言数组（待取舍）
 */
@property(nonatomic) NSArray *oneWordArr;
@end
@implementation ContentViewController
#pragma mark - UIcollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CarToonModel *cartoon = [CarToonModel new];
    if (collectionView == self.bestCollectionView) {
        cartoon = self.bestImgArr[indexPath.row];
    }
    if (collectionView == self.allCateColletionView) {
        cartoon = self.allCategoriesArr[indexPath.row];
    }
    PicturesViewController *vc = [PicturesViewController new];
    vc.oneCatToonVV.oneCategoryID = cartoon.ID;
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.bestImgArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CategoriesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CateCell" forIndexPath:indexPath];
    CarToonModel *cartoon = [CarToonModel new];
    if (collectionView == self.bestCollectionView) {
        cartoon = self.bestImgArr[indexPath.row];
    }
    if (collectionView == self.allCateColletionView) {
        cartoon = self.allCategoriesArr[indexPath.row];
    }
    if (indexPath.row!=10) {
        NSString *path =[kCarToonPicPath stringByAppendingString: cartoon.cover_url];
        [cell.imgV setImageWithURL:[NSURL URLWithString:path]];
        //cell.label.text = cartoon.tags;
    }
    return cell;
}
#pragma mark - UIcollectionViewlayout返回collectionview的排版，大小，间距等 Delegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 10) {
        return CGSizeMake(kCategoryHeight/4, kCategoryHeight);
    }
    return CGSizeMake(kCategoryHeight, kCategoryHeight);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 0);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
#pragma mark - 头部滚动页ICarousel Delegate
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    ShowViewController *showVc = [ShowViewController new];
    for (int i = 0; i<5; i++) {
        [showVc.picArr addObject:[MWPhoto photoWithURL:[self.carToonTopVV onePicImg:i]]];
    }
    [showVc setCurrentPhotoIndex:index];//设置图片展示的当前图片
    [self.navigationController pushViewController:showVc animated:YES];
}
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pageControl.currentPage = carousel.currentItemIndex;
}
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return [self.carToonTopVV picNum];
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (view == nil) {
        view = [[UIView alloc]initWithFrame:carousel.frame];
        UIImageView *img = [UIImageView new];
        img.tag = 100;
        [view addSubview:img];
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(0);
        }];
    }
    UIImageView *img = [view viewWithTag:100];
    img.contentMode = UIViewContentModeScaleAspectFill;
    img.clipsToBounds = YES;
    [img setImageWithURL:[self.carToonTopVV onePicImg:index]];
    return view;
}
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
#pragma mark - 两个带有collectionview的cell的创建方法 Method
-(CategoriesTableViewCell *)creatCellWithTitle:(NSString *)title andInfo:(NSString *)info ButtonTag:(NSInteger)tag{
    CategoriesTableViewCell *cell = [CategoriesTableViewCell new];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.leftButton setTitle:title forState:UIControlStateNormal];
    cell.leftButton.tag = tag;
    cell.bottomLb.text = info;
    cell.delegate = self;
    [self initAndRefreshColletionView:cell.collectionView];
    return cell;
}
#pragma mark - colletionView的初始化以及刷新方法 Method
-(void)initAndRefreshColletionView:(UICollectionView *)collectionView{
    collectionView.delegate = self;
    collectionView.dataSource = self;
    if (_bestImgArr == nil) {
        _bestImgArr = [NSMutableArray new];
        _allCategoriesArr = [NSMutableArray new];
        [CarToonNetManager getAllCarToonsCompletionHandler:^(NSArray *model, NSError *error) {
            if (!error) {
                for (int i = 0; i<11; i++) {
                    [_bestImgArr addObject:model[i]];
                    [_allCategoriesArr addObject:model[i+10]];
                }
                [collectionView reloadData];
                if (collectionView == self.bestCollectionView) {
                    [self.tableView reloadData];//解决best：精选栏目collotionview刷新时，所有栏目collectionview不刷新的问题
                }
            }
        }];
    }
}
#pragma mark - CategorieTableView Delegate
-(void)leftButton:(UIButton *)clickIn{
    NSLog(@"leftButton");
}
-(void)rightButton:(UIButton *)clickIn{
    NSLog(@"rightButton");
}
-(void)categoryButton:(UIButton *)button{
    if (button.tag == 500) {
        NSLog(@"精选");
    }
    if (button.tag == 600) {
        NSLog(@"所有");
        AllCategoriesViewController *vc = [AllCategoriesViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
#pragma mark - UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.comicsBestVV comicsBestNum]+3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TwoButtonTableViewCell *cell = [TwoButtonTableViewCell new];
        //        cell.headIcon.image = [UIImage imageNamed:@"hitokoto"];
        //        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        //        animation.duration = 20;
        //        animation.repeatCount = MAXFLOAT;
        //        animation.toValue = @(2*M_PI);
        //        //动画完之后不移除
        //        animation.removedOnCompletion = false;
        //        [cell.headIcon.layer addAnimation:animation forKey:nil];
        static NSString *title = @"嗯嗯，说点什么呢";
        //        [NSTimer bk_scheduledTimerWithTimeInterval:10 block:^(NSTimer *timer) {
        //            [NSObject GET:kOneWordPath parameters:nil progress:nil completionHandler:^(id responseObj, NSError *error) {
        //                NSDictionary *dic = responseObj;
        //                title  = dic[@"hitokoto"];
        //            }];
        //            cell.oneWord.text = title;
        //        } repeats:YES];
        //        cell.oneWord.text = title;
        [cell.leftButton setTitle:@"一言" forState:UIControlStateNormal];
        [cell.rightButton setTitle:@"番剧资讯" forState:UIControlStateNormal];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.row == 1 ) {
        CategoriesTableViewCell *cell = [self creatCellWithTitle:@"精选" andInfo:@"我的世界你懂得，呦呦" ButtonTag:500];
        self.bestCollectionView = cell.collectionView;
        return cell;
    }
    if (indexPath.row == 2) {
        CategoriesTableViewCell *cell = [self creatCellWithTitle:@"所有" andInfo:@"啊啊哈哈" ButtonTag:600];
        self.allCateColletionView = cell.collectionView;
        return cell;
    }
    OneWordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"one" forIndexPath:indexPath];
    [cell.bgImgV setImageWithURL:[self.comicsBestVV bgImgVAtRow:indexPath.row -3]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 100;
    }
    if (indexPath.row ==1 || indexPath.row==2) {
        return kTopInst*2+kCategoryHeight+kTitlelbHeight;
    }
    return 230;
}
#pragma mark - 生命周期 LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = self.headerCarousel;
    self.view.backgroundColor = [UIColor orangeColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks handler:^(id sender) {
        [self.sideMenuViewController presentRightMenuViewController];
    }];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
+(ContentViewController *)shareContenVC{
    static ContentViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"demo";
    });
    return vc;
}
#pragma mark - 懒加载 Lazyload
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor orangeColor];
        _tableView.separatorStyle = UITextAutocapitalizationTypeNone;
        [_tableView registerClass:[OneWordTableViewCell class] forCellReuseIdentifier:@"one"];
        [_tableView registerClass:[TwoButtonTableViewCell class] forCellReuseIdentifier:@"two"];
        [_tableView registerClass:[CategoriesTableViewCell class] forCellReuseIdentifier:@"category"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _tableView;
}
- (iCarousel *)headerCarousel {
    if(_headerCarousel == nil) {
        _headerCarousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW*224/400)];
        _headerCarousel.delegate = self;
        _headerCarousel.dataSource = self;
        _headerCarousel.backgroundColor = kRGBA(245, 245, 245, 1);
        _headerCarousel.pagingEnabled = YES;
        _headerCarousel.stopAtItemBoundary = YES;
        _headerCarousel.scrollSpeed = 0.5;
        _pageControl = [UIPageControl new];
        _pageControl.userInteractionEnabled = NO;
        _pageControl.numberOfPages = 5;    //待定
        [_headerCarousel addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);       //待定
            make.bottom.equalTo(2);        //待定
        }];
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_headerCarousel scrollToItemAtIndex:_headerCarousel.currentItemIndex+1 animated:YES];
        } repeats:YES];
        [self.carToonTopVV getDataWithType:picTop RequestMode:RequestModeRefresh completionHanle:^(NSError *error) {
            if (!error) {
                [_headerCarousel reloadData];
            }
        }];
        //        [self.comicsBestVV getDataWithRequestMode:RequestModeRefresh completionHanle:^(NSError *error){
        //        }];
    }
    return _headerCarousel;
}

- (CarToonViewModel *)carToonTopVV {
    if(_carToonTopVV == nil) {
        _carToonTopVV = [[CarToonViewModel alloc] init];
    }
    return _carToonTopVV;
}
- (NSMutableArray *)bestImgArr {
    if(_bestImgArr == nil) {
        _bestImgArr = [[NSMutableArray alloc] init];
    }
    return _bestImgArr;
}
- (ComicsViewModel *)comicsBestVV {
    if(_comicsBestVV == nil) {
        _comicsBestVV = [[ComicsViewModel alloc] init];
    }
    return _comicsBestVV;
}
- (NSArray *)oneWordArr {
    if(_oneWordArr == nil) {
        _oneWordArr = [[NSArray alloc] init];
    }
    return _oneWordArr;
}
@end
