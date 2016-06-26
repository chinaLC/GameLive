//
//  YXRecommendViewModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendViewModel.h"

@interface YXRecommendViewModel ()

/** <#属性描述#> */
@property (nonatomic, strong) NSArray<GameListModel *> *gameList;

/** <#属性描述#> */
@property (nonatomic, strong) NSArray <NSArray<YXDateModel *>*> *dateM;
@end
@implementation YXRecommendViewModel
- (void)getDataCompletionHandler:(void (^)(NSError *))completionHandler{
    _dataTask = [YXNetManager getRecommendCompletionHandler:^(id model, NSError *error) {
        if (!error) {
            _recommendModel = model;
            _gameList = _recommendModel.list;
            _dateM = @[self.recommendModel.mobileRecommendation,self.recommendModel.mobileLol,self.recommendModel.mobileBeauty,self.recommendModel.mobileTvgame,self.recommendModel.mobileHeartstone,self.recommendModel.mobileDota2,self.recommendModel.moblieBlizzard,self.recommendModel.moblieDnf,self.recommendModel.moblieSport,self.recommendModel.moblieMinecraft,self.recommendModel.moblieWebgame];
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSInteger)numberOfSection{
    return self.dateM.count;
}
- (NSString *)nameForSection:(NSInteger)section{
    return self.gameList[section + 2].name;
}
- (NSURL *)iconIVForRow:(NSInteger)row Section:(NSInteger)section{
    return self.dateM[section][row].linkObject.thumb.yx_URL;
}
- (NSString *)titleForRow:(NSInteger)row Section:(NSInteger)section{
    return self.dateM[section][row].linkObject.title;
}
- (NSString *)onlineForRow:(NSInteger)row Section:(NSInteger)section{
    NSInteger num = self.dateM[section][row].linkObject.view.integerValue;
    if (num > 10000) {
        NSString *viewNum = [NSString stringWithFormat:@"%.1f万", num / 10000.0];
        return viewNum;
    }
    return self.dateM[section][row].linkObject.view;
}
- (NSString *)nameForRow:(NSInteger)row Section:(NSInteger)section{
    return self.dateM[section][row].linkObject.nick;
}
//行跳转
- (NSString *)sectionNameForSection:(NSInteger)section{
    return [self.gameList[section + 2].slug substringFromIndex:7];
}
- (NSURL *)playAVForRow:(NSInteger)row Section:(NSInteger)section{
    return [NSString stringWithFormat:kGamePlay,self.dateM[section][row].linkObject.uid].yx_URL;
}

- (NSArray<YXDateModel *> *)midViewModel{
    return self.recommendModel.mobileStar;
}
- (NSArray<YXDateModel *> *)topViewModel{
    return self.recommendModel.mobileIndex;
}
@end
