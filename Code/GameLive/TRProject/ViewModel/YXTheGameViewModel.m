//
//  YXTheGameViewModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXTheGameViewModel.h"

@interface YXTheGameViewModel ()

/** 参数 */
@property (nonatomic, assign) NSInteger page;
@end
@implementation YXTheGameViewModel
- (instancetype)init
{
    NSAssert1(NO, @"必须使用(instancetype)initWithGameName:初始化 %s", __FUNCTION__);
    return nil;
}
- (instancetype)initWithGameName:(NSString *)gameName
{
    self = [super init];
    if (self) {
        _gameName = gameName;
    }
    return self;
}
- (void)getDataWithRequestMode:(VMRequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger num = 0;
    NSString *path = nil;
    if (requestMode == VMRequestModeMore) {
        num = _page + 1;
        path = [NSString stringWithFormat:@"_%ld", num];
    }
    [YXNetManager getTheGameFromTheGameName:self.gameName List:path CompletionHandler:^(id model, NSError *error) {
        if (requestMode == VMRequestModeRefresh) {
            [self.theGameList removeAllObjects];
        }
        YXTheGameModel *gameModel = model;
        [self.theGameList addObjectsFromArray:gameModel.data];
        _page = num;
        _hasMore = gameModel.data.count == 90;
        !completionHandler ?: completionHandler(error);
    }];
}
#pragma mark - LazyLoad 懒加载
- (NSMutableArray<LinkObjectModel *> *)theGameList {
    if(_theGameList == nil) {
        _theGameList = [[NSMutableArray<LinkObjectModel *> alloc] init];
    }
    return _theGameList;
}
#pragma mark - Method
- (NSInteger)numberOfRow{
    return self.theGameList.count;
}
- (NSURL *)iconIVForRow:(NSInteger)row{
    return self.theGameList[row].thumb.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row{
    return self.theGameList[row].title;
}
- (NSString *)onlineForRow:(NSInteger)row{
    NSInteger num = self.theGameList[row].view.integerValue;
    if (num > 10000) {
        NSString *viewNum = [NSString stringWithFormat:@"%.1f万", num / 10000.0];
        return viewNum;
    }
    return self.theGameList[row].view;
}
- (NSString *)nameForRow:(NSInteger)row{
    return self.theGameList[row].nick;
}
- (NSURL *)playAVForRow:(NSInteger)row{
    return [NSString stringWithFormat:kGamePlay,self.theGameList[row].uid].yx_URL;
}
@end
