//
//  YXGameListViewModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXGameListViewModel.h"

@interface YXGameListViewModel ()

/** 全局变量 */
@property (nonatomic) NSInteger page;
@end
@implementation YXGameListViewModel
#pragma mark - LifeCycle 生命周期
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger num = 0;
    NSString *path = nil;
    if (requestMode == VMRequestModeMore) {
        num = _page + 1;
        path = [NSString stringWithFormat:@"_%ld", num];
    }
    _dataTask = [YXNetManager getGameListFromList:path CompletionHandler:^(id model, NSError *error) {
        if (requestMode == VMRequestModeRefresh) {
            [self.gameList removeAllObjects];
        }
        YXGameListModel *gameModel = model;
        [self.gameList addObjectsFromArray:gameModel.data];
        _page = num;
        _hasMore = self.gameList.count == 90;
        !completionHandler ?: completionHandler(error);
    }];

}
#pragma mark - LazyLoad 懒加载
- (NSMutableArray<LinkObjectModel *> *)gameList {
    if(_gameList == nil) {
        _gameList = [[NSMutableArray<LinkObjectModel *> alloc] init];
    }
    return _gameList;
}
#pragma mark - Method
- (NSInteger)numberOfRow{
    return self.gameList.count;
}
- (NSURL *)iconIVForRow:(NSInteger)row{
    return self.gameList[row].thumb.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.gameList[row].title;
}
- (NSString *)onlineForRow:(NSInteger)row{
    NSInteger num = self.gameList[row].view.integerValue;
    if (num > 10000) {
        NSString *viewNum = [NSString stringWithFormat:@"%.1f万", num / 10000.0];
        return viewNum;
    }
    return self.gameList[row].view;
}
- (NSString *)nameForRow:(NSInteger)row{
    return self.gameList[row].nick;
}
- (NSURL *)playAVForRow:(NSInteger)row{
    return [NSString stringWithFormat:kGamePlay,self.gameList[row].uid].yx_URL;
}
@end
