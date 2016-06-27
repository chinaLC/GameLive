//
//  YXSearchViewModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TRBaseViewModel.h"
#import "YXNetManager.h"    
@interface YXSearchViewModel : TRBaseViewModel

/** 数据 */
@property (nonatomic, strong) NSMutableArray<LinkObjectModel *> *dataList;

/** 是否有更多页 */
@property (nonatomic) BOOL hasMore;

- (NSInteger)numberOfRow;
- (NSURL *)iconIVForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)onlineForRow:(NSInteger)row;
- (NSString *)nameForRow:(NSInteger)row;
- (NSURL *)playAVForRow:(NSInteger)row;

- (void)getDataWithRequestMode:(VMRequestMode)requestMode Key:(NSString *)key completionHandler:(void(^)(NSError *error))completionHandler;
@end
