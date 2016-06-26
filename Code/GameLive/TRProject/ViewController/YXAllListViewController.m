//
//  YXAllListViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXAllListViewController.h"
#import "YXAllListCell.h"
#import "YXAllListViewModel.h"
#import "YXAllListTheHeroViewController.h"
static NSString *const allListIdentify = @"AllListCell";

@interface YXAllListViewController ()

/** YXAllListViewModel */
@property (nonatomic, strong) YXAllListViewModel *allListVM;
@end
@implementation YXAllListViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    CGFloat width = (kScreenW - 40.01)/3.0;
    CGFloat height = width / 230.0 * 325 + 30;
    layout.itemSize = CGSizeMake(width , height);
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.title = @"栏目";
        self.tabBarItem.image = [UIImage imageNamed:@"栏目-默认"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"栏目-焦点"];
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
    [self.collectionView registerClass:[YXAllListCell class] forCellWithReuseIdentifier:allListIdentify];
    [self.allListVM getAllListCompletionHandler:^(NSError *error) {
        [self.collectionView reloadData];
    }];
}
#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.allListVM.numberForRow;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXAllListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:allListIdentify forIndexPath:indexPath];
    [cell.imageV sd_setImageWithURL:[self.allListVM iconIVForRow:indexPath.row] placeholderImage:nil];
    cell.labelTitle.text = [self.allListVM nameForRow:indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    YXAllListTheHeroViewController *heroVC = [YXAllListTheHeroViewController new];
    heroVC.heroName = [self.allListVM gameNameForRow:indexPath.row];
    heroVC.navigationItem.title = [self.allListVM nameForRow:indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:heroVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
#pragma mark - LazyLoad 懒加载
- (YXAllListViewModel *)allListVM {
	if(_allListVM == nil) {
		_allListVM = [[YXAllListViewModel alloc] init];
	}
	return _allListVM;
}
//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.allListVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.allListVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.allListVM.dataTask cancel];
}

@end
