//
//  YXGameListViewModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "YXNetManager.h"
@interface YXGameListViewModel : TRBaseViewModel
/** 是否有更多页 */
@property (nonatomic) BOOL hasMore;

/** 可变数组存储数据 */
@property (nonatomic, strong) NSMutableArray<LinkObjectModel *> *gameList;
- (NSInteger)numberOfRow;
- (NSURL *)iconIVForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)onlineForRow:(NSInteger)row;
- (NSString *)nameForRow:(NSInteger)row;
- (NSURL *)playAVForRow:(NSInteger)row;
@end
