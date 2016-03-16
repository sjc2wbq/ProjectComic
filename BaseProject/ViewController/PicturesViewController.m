//
//  PicturesViewController.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/14.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "PicturesViewController.h"
#import "ShowViewController.h"
#import "CarToonViewModel.h"
#import "OneCategoryPicTableViewCell.h"
#import "ShowViewController.h"
@interface PicturesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic) UITableView  *tableView;
@end

@implementation PicturesViewController
#pragma mark - UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"num:%ld",[self.oneCatToonVV picNum]);
    return [self.oneCatToonVV picNum];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OneCategoryPicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell.iconImgV setImageWithURL:[self.oneCatToonVV onePicImg:indexPath.row]];
    cell.viewCount.text = [self.oneCatToonVV hits:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float height = [self.oneCatToonVV heightImg:indexPath.row].floatValue;
    float width = [self.oneCatToonVV widthImg:indexPath.row].floatValue;
    return kScreenW/width*height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ShowViewController *vc = [ShowViewController new];
    for (int i = 0; i<[self.oneCatToonVV picNum]; i++) {
        [vc.picArr addObject:[MWPhoto photoWithURL:[self.oneCatToonVV onePicImg:i]]];
    }
    [vc setCurrentPhotoIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"lalallalallaPic");
}

#pragma mark - 生命周期 LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 懒加载 Lazyload


- (UITableView  *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView  alloc] init];
        [_tableView registerClass:[OneCategoryPicTableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        WK(weakSelf);
        [_tableView addHeaderRefresh:^{
            [weakSelf.oneCatToonVV getDataWithType:picOneCategory RequestMode:RequestModeRefresh completionHanle:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                    [weakSelf.tableView endHeaderRefresh];
                }
            }];
        }];
        [_tableView beginHeaderRefresh];
        [_tableView addBackFooterRefresh:^{
            [weakSelf.oneCatToonVV getDataWithType:picOneCategory RequestMode:RequestModeMore completionHanle:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                    [weakSelf.tableView endFooterRefresh];
                }
            }];
        }];
        
        
        
    }
    return _tableView;
}
#pragma mark - 懒加载 Lazyload
- (CarToonViewModel *)oneCatToonVV {
    if(_oneCatToonVV == nil) {
        _oneCatToonVV = [[CarToonViewModel alloc] init];
    }
    return _oneCatToonVV;
}
@end
