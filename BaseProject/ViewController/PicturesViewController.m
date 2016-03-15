//
//  PicturesViewController.m
//  BaseProject
//
//  Created by junchuanshi on 16/3/14.
//  Copyright © 2016年 JunSung. All rights reserved.
//

#import "PicturesViewController.h"
#import "ShowViewController.h"

@interface PicturesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic) UITableView  *tableView;
@end

@implementation PicturesViewController
#pragma mark - UITableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"lala";
    return cell;
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
	}
	return _tableView;
}

@end
