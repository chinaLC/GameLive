//
//  YXGameListViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameListViewController.h"
#import "YXGameListCell.h"
#import "YXGameListViewModel.h"
@import AVKit;
@import AVFoundation;
static NSString *const gameListIdentify = @"GameListCell";

@interface YXGameListViewController ()

/** YXGameListViewModel */
@property (nonatomic, strong) YXGameListViewModel *gameListVM;
@end
@implementation YXGameListViewController
#pragma mark - LifeCycle 生命周期
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    CGFloat width = (kScreenW - 30)/2.0;
    CGFloat height = width / 350.0 * 200 + 30;
    layout.itemSize = CGSizeMake(width , height);
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.title = @"直播";
        self.tabBarItem.image = [UIImage imageNamed:@"发现-默认"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"发现-焦点"];
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
    [self.collectionView registerClass:[YXGameListCell class] forCellWithReuseIdentifier:gameListIdentify];
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.gameListVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                return ;
            }
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
            if (weakSelf.gameListVM.hasMore) {
                [weakSelf.collectionView endFooterRefresh];
            }else{
                [weakSelf.collectionView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.collectionView addBackFooterRefresh:^{
        [weakSelf.gameListVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                return ;
            }
            [weakSelf.collectionView reloadData];
            if (weakSelf.gameListVM.hasMore) {
                [weakSelf.collectionView endFooterRefresh];
            }else{
                [weakSelf.collectionView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.collectionView beginHeaderRefresh];
}
#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.gameListVM.numberOfRow;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXGameListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:gameListIdentify forIndexPath:indexPath];
    cell.labelTitle.text = [self.gameListVM titleForRow:indexPath.row];
    cell.labelMan.text = [self.gameListVM onlineForRow:indexPath.row];
    cell.labelName.text = [self.gameListVM nameForRow:indexPath.row];
    [cell.imageV sd_setImageWithURL:[self.gameListVM iconIVForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"logo"]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
    playerVC.player = [AVPlayer playerWithURL:[self.gameListVM playAVForRow:indexPath.row]];
    [playerVC.player play];
    [self presentViewController:playerVC animated:YES completion:nil];
}
#pragma mark - LazyLoad 懒加载
- (YXGameListViewModel *)gameListVM {
	if(_gameListVM == nil) {
		_gameListVM = [[YXGameListViewModel alloc] init];
	}
	return _gameListVM;
}

//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.gameListVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.gameListVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.gameListVM.dataTask cancel];
}

@end
