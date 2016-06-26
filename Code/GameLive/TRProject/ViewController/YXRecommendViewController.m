//
//  YXRecommendViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/22.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendViewController.h"
#import "YXGameListCell.h"
#import "YXRecommendHeaderView.h"
#import "YXRecommendViewModel.h"
#import "YXAllListTheHeroViewController.h"

@import AVKit;
@import AVFoundation;

static NSString *const recommendIdentify = @"RecommendCell";
static NSString *const recommendHeaderIdentify = @"RecommendHeader";
//换一换 变量
static NSInteger itemNum = 0;

@interface YXRecommendViewController ()

/** YXRecommendViewModel */
@property (nonatomic, strong) YXRecommendViewModel *recommendVM;

/** headerView */
@property (nonatomic, strong) UIView *headerView;
@end
@implementation YXRecommendViewController
#pragma mark - init
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.headerReferenceSize = CGSizeMake(kScreenW, 50);
    CGFloat width = (kScreenW - 30)/2.0;
    CGFloat height = width / 351.0 * 263;
    layout.itemSize = CGSizeMake(width , height);
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"推荐-默认"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐-焦点"];
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
    [self.collectionView registerClass:[YXGameListCell class] forCellWithReuseIdentifier:recommendIdentify];
    [self.collectionView registerClass:[YXRecommendHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:recommendHeaderIdentify];
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.recommendVM getDataCompletionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [self.collectionView beginHeaderRefresh];
}
#pragma mark - CollectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.recommendVM.numberOfSection;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXGameListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:recommendIdentify forIndexPath:indexPath];
    if (!indexPath.section) {
        cell.labelTitle.text = [self.recommendVM titleForRow:indexPath.row+itemNum Section:indexPath.section];
        cell.labelMan.text = [self.recommendVM onlineForRow:indexPath.row+itemNum Section:indexPath.section];
        cell.labelName.text = [self.recommendVM nameForRow:indexPath.row+itemNum Section:indexPath.section];
        [cell.imageV sd_setImageWithURL:[self.recommendVM iconIVForRow:indexPath.row+itemNum Section:indexPath.section] placeholderImage:[UIImage imageNamed:@"logo"]];
        return cell;
    }
    cell.labelTitle.text = [self.recommendVM titleForRow:indexPath.row Section:indexPath.section];
    cell.labelMan.text = [self.recommendVM onlineForRow:indexPath.row Section:indexPath.section];
    cell.labelName.text = [self.recommendVM nameForRow:indexPath.row Section:indexPath.section];
    [cell.imageV sd_setImageWithURL:[self.recommendVM iconIVForRow:indexPath.row Section:indexPath.section] placeholderImage:[UIImage imageNamed:@"logo"]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
    if (!indexPath.section) {
        playerVC.player = [AVPlayer playerWithURL:[self.recommendVM playAVForRow:indexPath.row+itemNum Section:indexPath.section]];
    }else{
        playerVC.player = [AVPlayer playerWithURL:[self.recommendVM playAVForRow:indexPath.row Section:indexPath.section]];
    }
    [playerVC.player play];
    [self presentViewController:playerVC animated:YES completion:nil];
}
-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if(!section){
        CGSize size = CGSizeMake(kScreenW, 200);
        return size;
    }else {
        CGSize size = CGSizeMake(kScreenW, 50);
        return size;
    }
}
#pragma mark - Header Delegate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        YXRecommendHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:recommendHeaderIdentify forIndexPath:indexPath];
        if (!indexPath.section) {
            headerView.imageV.image = [UIImage imageNamed:@"换一换"];
            headerView.labelDel.text = @"换一换";
        }else{
            headerView.labelDel.text = @"更多";
            headerView.imageV.image = [UIImage imageNamed:@"更多"];
        }
        headerView.labelTitle.text = [self.recommendVM nameForSection:indexPath.section];
        [headerView.con addTarget:self action:@selector(clickTheBtn:) forControlEvents:UIControlEventTouchUpInside];
        headerView.con.tag = indexPath.section;
        reusableView = headerView;
    }
    return reusableView;
}
#pragma mark - Method clickTheBtn
//点击cell右上方按钮 触发事件
- (void)clickTheBtn:(UIControl *)sender{
    if (!sender.tag) {
        if (itemNum < 4) {
            itemNum += 2;
        }else {
            itemNum = 0;
        }
        [self.collectionView reloadData];
        return;
    }
    YXAllListTheHeroViewController *heroVC = [YXAllListTheHeroViewController new];
    heroVC.heroName = [self.recommendVM sectionNameForSection:sender.tag];
    heroVC.navigationItem.title = [self.recommendVM nameForSection:sender.tag];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:heroVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
}
#pragma mark - LazyLoad 懒加载
- (YXRecommendViewModel *)recommendVM {
    if(_recommendVM == nil) {
        _recommendVM = [[YXRecommendViewModel alloc] init];
    }
    return _recommendVM;
}
#pragma mark - Method dataTask
//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.recommendVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.recommendVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.recommendVM.dataTask cancel];
}

@end
