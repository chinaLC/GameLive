//
//  YXSectionHeaderView.m
//  TRProject
//
//  Created by 李晨 on 16/6/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXSectionHeaderView.h"
#import "YXMidCell.h"
static NSString *const identify = @"Cell";

@import AVKit;
@import AVFoundation;

@interface YXSectionHeaderView ()<iCarouselDelegate, iCarouselDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

/** 左方视图 */
@property (nonatomic, strong) UIImageView *leftImage;

/** 灰条 */
@property (nonatomic, strong) UIView *viewLine;

/** 中间滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;

/** 中间滚动视图网络 */
@property (nonatomic, readonly) NSArray<YXDateModel *> *midVM;

/** 上方滚动视图网络 */
@property (nonatomic, readonly) NSArray<YXDateModel *> *topVM;

/** <#属性描述#> */
@property (nonatomic, strong) UIPageControl *pc;

/** <#属性描述#> */
@property (nonatomic, strong) NSTimer *timer;

@end
@implementation  YXSectionHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self imageV];
        [self labelDel];
        [self labelTitle];
        [self con];
        [self viewLine];
    }
    return self;
}
- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.con addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.labelDel.mas_left).equalTo(-5);
            make.centerY.equalTo(0);
            make.width.height.equalTo(18);
        }];
    }
    return _imageV;
}

- (UILabel *)labelTitle {
    if(_labelTitle == nil) {
        _labelTitle = [[UILabel alloc] init];
        [self addSubview:_labelTitle];
        [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImage.mas_right).equalTo(8);
            make.bottom.equalTo(-10);
        }];
        _labelTitle.font = [UIFont systemFontOfSize:22];
        
    }
    return _labelTitle;
}

- (UILabel *)labelDel {
    if(_labelDel == nil) {
        _labelDel = [[UILabel alloc] init];
        [self.con addSubview:_labelDel];
        [_labelDel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
        }];
        _labelDel.font = [UIFont systemFontOfSize:15];
    }
    return _labelDel;
}


- (UIControl *)con {
    if(_con == nil) {
        _con = [[UIControl alloc] init];
        [self addSubview:_con];
        CGFloat width = kScreenW /4.0;
        [_con mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.height.equalTo(50);
            make.width.equalTo(width);
            make.bottom.equalTo(0);
        }];
    }
    return _con;
}
- (UIImageView *)leftImage {
    if(_leftImage == nil) {
        _leftImage = [[UIImageView alloc] init];
        [self addSubview:_leftImage];
        [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.width.equalTo(3);
            make.height.equalTo(30);
            make.bottom.equalTo(-10);
        }];
        
        _leftImage.image = [UIImage imageNamed:@"栏目标题"];
    }
    return _leftImage;
}


- (UIView *)viewLine {
	if(_viewLine == nil) {
		_viewLine = [[UIView alloc] init];
        [self addSubview:_viewLine];
        [_viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.labelTitle.mas_top).equalTo(-15);
            make.left.right.equalTo(0);
            make.height.equalTo(2);
        }];
        _viewLine.backgroundColor = kRGBColor(205, 205, 205, 1.0);
	}
	return _viewLine;
}


- (void)reloadViewWithMidVM:(NSArray<YXDateModel *> *)midVM andTopVM:(NSArray<YXDateModel *> *)topVM CompletionHandler:(void (^)())completionHandler{
    _midVM = midVM;
    _topVM = topVM;
    !completionHandler ?: completionHandler();
}
- (iCarousel *)ic {
    //640 * 320
    _ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW/ 2)];
    [self addSubview:_ic];
    _ic.delegate = self;
    _ic.dataSource = self;
    
    _pc = [UIPageControl new];
    _pc.numberOfPages = self.topVM.count;
    [_ic addSubview:_pc];
    [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(4);
        make.right.equalTo(-3);
    }];
    [_timer invalidate];
    _timer = nil;
    
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
    _ic.scrollSpeed = .2;
    return _ic;
}

#pragma mark - ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.topVM.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *iv = [UIImageView new];
        iv.tag = 100;
        [view addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        UIView *viewBack = [UIView new];
        [view addSubview:viewBack];
        [viewBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
        viewBack.backgroundColor = kRGBColor(0, 0, 0, 0.6);
        UILabel *label = [UILabel new];
        label.tag = 101;
        [viewBack addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.centerY.equalTo(0);
        }];
        label.textColor = [UIColor whiteColor];
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [iv sd_setImageWithURL:self.topVM[index].linkObject.appShufflingImage.yx_URL placeholderImage:nil];
    UILabel *label = (UILabel *)[view viewWithTag:101];
    label.text = self.topVM[index].linkObject.title;
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
    playerVC.player = [AVPlayer playerWithURL:[NSString stringWithFormat:kGamePlay,self.topVM[index].linkObject.uid].yx_URL];
    [playerVC.player play];
    [self.viewController presentViewController:playerVC animated:YES completion:nil];
}

- (UICollectionView *)colView {
	if(_colView == nil) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.itemSize = CGSizeMake(120, 120);
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
		_colView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_colView];
        [_colView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.left.right.equalTo(0);
            make.bottom.equalTo(self.viewLine.mas_top);
        }];
        _colView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
        _colView.delegate = self;
        _colView.dataSource = self;
        [_colView registerClass:[YXMidCell class] forCellWithReuseIdentifier:identify];
        _colView.showsHorizontalScrollIndicator = NO;
	}
	return _colView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.midVM.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXMidCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:self.midVM[indexPath.row].linkObject.avatar.yx_URL placeholderImage:nil];
    cell.labelX.text = self.midVM[indexPath.row].linkObject.nick ;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
    playerVC.player = [AVPlayer playerWithURL:[NSString stringWithFormat:kGamePlay,self.midVM[indexPath.row].linkObject.uid].yx_URL];
    [playerVC.player play];
    [self.viewController presentViewController:playerVC animated:YES completion:nil];
}
@end
