//
//  YXSearchViewController.m
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXSearchViewController.h"
#import "YXGameListCell.h"
#import "YXSearchViewModel.h"
#import "IQKeyboardReturnKeyHandler.h"

@import AVKit;
@import AVFoundation;
static NSString * const searchIdentifier = @"SearchCell";
@interface YXSearchViewController ()<UITextFieldDelegate>

/** YXSearchViewModel */
@property (nonatomic, strong) YXSearchViewModel *searchVM;


/** <#属性描述#> */
@property (nonatomic, strong) UIView *naviView;
/** <#属性描述#> */
@property (nonatomic, strong) UITextField *textField;

/** <#属性描述#> */
@property (nonatomic) IQKeyboardReturnKeyHandler   *returnKeyHandler;
@end

@implementation YXSearchViewController


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
    }
    return self;
}
- (void)backToLastPage:sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)searchSomeThing:sender{
    [self.searchVM.dataTask suspend];
    [self.searchVM.dataTask cancel];
    [self.searchVM.dataTask resume];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        WK(weakSelf);
        [self.collectionView addHeaderRefresh:^{
            [weakSelf.searchVM getDataWithRequestMode:VMRequestModeRefresh Key:weakSelf.textField.text completionHandler:^(NSError *error) {
                if (error) {
                    DDLogError(@"%@",error);
                    return ;
                }
                [weakSelf.collectionView reloadData];
                [weakSelf.collectionView endHeaderRefresh];
                if (weakSelf.searchVM.hasMore) {
                    [weakSelf.collectionView endFooterRefresh];
                }else{
                    [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                }
            }];
        }];
        [self.collectionView addBackFooterRefresh:^{
            [weakSelf.searchVM getDataWithRequestMode:VMRequestModeMore Key:weakSelf.textField.text completionHandler:^(NSError *error) {
                if (error) {
                    DDLogError(@"%@",error);
                    return ;
                }
                [weakSelf.collectionView reloadData];
                if (weakSelf.searchVM.hasMore) {
                    [weakSelf.collectionView endFooterRefresh];
                }else{
                    [weakSelf.collectionView endFooterRefreshWithNoMoreData];
                }
            }];
        }];
        [self.collectionView beginHeaderRefresh];
    }];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"搜索无结果"];
    UIImageView *imageV = [[UIImageView alloc]initWithImage:img];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    self.collectionView.backgroundView = imageV;
    self.collectionView.backgroundColor = kRGBColor(234, 234, 234, 1.0);
    [self.collectionView registerClass:[YXGameListCell class] forCellWithReuseIdentifier:searchIdentifier];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回-默认"] landscapeImagePhone:[UIImage imageNamed:@"返回-按下"] style:UIBarButtonItemStyleDone target:self action:@selector(backToLastPage:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.titleView = self.naviView;
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"搜索-默认"] landscapeImagePhone:[UIImage imageNamed:@"搜索-按下"] style:UIBarButtonItemStyleDone target:self action:@selector(searchSomeThing:)];
    self.navigationItem.rightBarButtonItem = rightBar;
    self.returnKeyHandler = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
    self.returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeySearch;
    [self.returnKeyHandler addTextFieldView:self.textField];
}
#pragma mark - UICollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.searchVM.numberOfRow;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YXGameListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:searchIdentifier forIndexPath:indexPath];
    cell.labelTitle.text = [self.searchVM titleForRow:indexPath.row];
    cell.labelMan.text = [self.searchVM onlineForRow:indexPath.row];
    cell.labelName.text = [self.searchVM nameForRow:indexPath.row];
    [cell.imageV sd_setImageWithURL:[self.searchVM iconIVForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"logo"]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    AVPlayerViewController *playerVC = [[AVPlayerViewController alloc]init];
    playerVC.player = [AVPlayer playerWithURL:[self.searchVM playAVForRow:indexPath.row]];
    [playerVC.player play];
    [self presentViewController:playerVC animated:YES completion:nil];
}
- (YXSearchViewModel *)searchVM {
    if(_searchVM == nil) {
        _searchVM = [[YXSearchViewModel alloc] init];
    }
    return _searchVM;
}

- (UITextField *)textField {
    if(_textField == nil) {
        _textField = [[UITextField alloc] init];
        [self.naviView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.placeholder = @"请输入关键词搜索";
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        imageV.image = [UIImage imageNamed:@"搜索"];
        imageV.tintColor = [UIColor lightGrayColor];
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        _textField.leftView = imageV;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.delegate = self;
    
    }
    return _textField;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [self searchSomeThing:nil];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}
- (UIView *)naviView {
    if(_naviView == nil) {
        _naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW/3.0*2, 30)];
        [self textField];
    }
    return _naviView;
}
//页面即将消失时 任务终止
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.searchVM.dataTask suspend];
}
//页面即将出现 开始任务
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.searchVM.dataTask resume];
}
//页面消失 任务取消
- (void)dealloc{
    [self.searchVM.dataTask cancel];
     self.returnKeyHandler = nil;
}


@end
