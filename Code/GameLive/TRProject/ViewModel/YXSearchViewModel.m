//
//  YXSearchViewModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXSearchViewModel.h"

@interface YXSearchViewModel ()

/** <#属性描述#> */
@property (nonatomic) NSInteger page;

/** <#属性描述#> */
@property (nonatomic) YXSearchModel *searchModel;

/** 页数 */
@property (nonatomic) NSInteger pageTotal;
@end
@implementation YXSearchViewModel

- (void)getDataWithRequestMode:(VMRequestMode)requestMode Key:(NSString *)key completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger num = 0;
    if (requestMode == VMRequestModeMore) {
        num = _page + 1;
    }
    _dataTask = [YXNetManager postTheDataWithKey:key Page:num CompletionHandler:^(id model, NSError *error) {
        _searchModel = model;
        if (requestMode == VMRequestModeRefresh) {
            [self.dataList removeAllObjects];
            _pageTotal = self.searchModel.data.pageNb - 1;
        }
        [self.dataList addObjectsFromArray:self.searchModel.data.items];
        _page = num;
        _hasMore = num < self.pageTotal;
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSMutableArray<LinkObjectModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<LinkObjectModel *> alloc] init];
    }
    return _dataList;
}
#pragma mark - Method
- (NSInteger)numberOfRow{
    return self.dataList.count;
}
- (NSURL *)iconIVForRow:(NSInteger)row{
    return self.dataList[row].thumb.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.dataList[row].title;
}
- (NSString *)onlineForRow:(NSInteger)row{
    NSInteger num = self.dataList[row].view.integerValue;
    if (num > 10000) {
        NSString *viewNum = [NSString stringWithFormat:@"%.1f万", num / 10000.0];
        return viewNum;
    }
    return self.dataList[row].view;
}
- (NSString *)nameForRow:(NSInteger)row{
    return self.dataList[row].nick;
}
- (NSURL *)playAVForRow:(NSInteger)row{
    return [NSString stringWithFormat:kGamePlay,self.dataList[row].uid].yx_URL;
}
@end
