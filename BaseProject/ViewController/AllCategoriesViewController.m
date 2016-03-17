//
//  AllCategoriesViewController.m
//  BaseProject
//
//  Created by JunChuanShi on 16/3/17.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "AllCategoriesViewController.h"
#import "CarToonViewModel.h"
#import "AllCategoriesCollectionViewCell.h"
#import "PicturesViewController.h"
@interface AllCategoriesViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic) UICollectionView *collectionView;
@property(nonatomic) UICollectionViewFlowLayout *layout;
@property(nonatomic) CarToonViewModel *allCatoonsVV;
@end

@implementation AllCategoriesViewController
#pragma mark - UICollectionView Delegate
-(UIColor *)GetRandomColor{
    float R = arc4random()%256;
    float G = arc4random()%256;
    float B = arc4random()%256;
    return kRGBA(R, G, B, 1);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.allCatoonsVV categoriesNum];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AllCategoriesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.iconImgV setImageWithURL:[self.allCatoonsVV categoryImg:indexPath.row]];
    cell.label.text = [self.allCatoonsVV photoNum:indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PicturesViewController *pictureVC = [PicturesViewController new];
    pictureVC.oneCatToonVV.oneCategoryID = [self.allCatoonsVV categoryId:indexPath.row];
    [self.navigationController pushViewController:pictureVC animated:YES];
}
#pragma mark - 生命周期 LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self collectionView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 懒加载 Lazyload
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor orangeColor];
        [_collectionView registerClass:[AllCategoriesCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        [self.allCatoonsVV getAllCategoriesCompletionHandler:^(NSError *error) {
            [self.collectionView reloadData];
        }];
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)layout {
	if(_layout == nil) {
		_layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 20;
        _layout.minimumInteritemSpacing = 5;
        _layout.sectionInset = UIEdgeInsetsMake(20, 10, 5, 10);
       // UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
        float width = (kScreenW-10*2-5*2)/2;
        _layout.itemSize = CGSizeMake(width, width+40);
	}
	return _layout;
}

- (CarToonViewModel *)allCatoonsVV {
	if(_allCatoonsVV == nil) {
		_allCatoonsVV = [[CarToonViewModel alloc] init];
	}
	return _allCatoonsVV;
}

@end
