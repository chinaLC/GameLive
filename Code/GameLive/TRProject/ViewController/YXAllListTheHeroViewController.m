//
//  YXAllListTheHeroViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/23.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXAllListTheHeroViewController.h"
#import "YXGameListCell.h"
#import "YXTheGameViewModel.h"
@import AVFoundation;
@import AVKit;
static NSString *const theHeroIdentify = @"TheHeroCell";
@interface YXAllListTheHeroViewController ()

/** YXTheGameViewModel */
@property (nonatomic, strong) YXTheGameViewModel *theGameVM;
@end
@implementation YXAllListTheHeroViewController
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
        
    }
    return self;
}
- (void)backToLastPage:sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
    [self.collectionView registerClass:[YXGameListCell class] forCellWithReuseIdentifier:theHeroIdentify];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回-默认"] landscapeImagePhone:[UIImage imageNamed:@"返回-按下"] style:UIBarButtonItemStyleDone target:self action:@selector(backToLastPage:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    [self.theGameVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
        [self.collectionView reloadData];
    }];
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.theGameVM getDataWithRequestMode:VMRequestModeRefresh completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
                return ;
            }
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
            if (weakSelf.theGameVM.hasMore) {
                [weakSelf.collectionView endFooterRefresh];
            }else{
                [weakSelf.collectionView endFooterRefreshWithNoMoreData];
            }
        }];
    }];
    [self.collectionView addBackFooterRefresh:^{
        
        [weakSelf.theGameVM getDataWithRequestMode:VMRequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                DDLogError(@"%@",error);
                return ;
            }
            [weakSelf.collectionView reloadData];
            if (weakSelf.theGameVM.hasMore) {
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
    return [self.theGameVM numberOfRow];
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXGameListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:theHeroIdentify forIndexPath:indexPath];
    cell.labelTitle.text = [self.theGameVM titleForRow:indexPath.row];
    cell.labelMan.text = [self.theGameVM onlineForRow:indexPath.row];
    cell.labelName.text = [self.theGameVM nameForRow:indexPath.row];
    [cell.imageV sd_setImageWithURL:[self.theGameVM iconIVForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"logo"]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
    playerVC.player = [AVPlayer playerWithURL:[self.theGameVM playAVForRow:indexPath.row]];
    [playerVC.player play];
    [self presentViewController:playerVC animated:YES completion:nil];
}
#pragma mark - LazyLoad 懒加载
- (YXTheGameViewModel *)theGameVM {
    if(_theGameVM == nil) {
        _theGameVM = [[YXTheGameViewModel alloc] initWithGameName:self.heroName];
    }
    return _theGameVM;
}
//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.theGameVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.theGameVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.theGameVM.dataTask cancel];
}

@end
