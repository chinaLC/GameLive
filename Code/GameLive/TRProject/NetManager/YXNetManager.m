//
//  YXNetManager.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXNetManager.h"

@implementation YXNetManager
+ (id)getRecommendCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kRecommendPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler((YXRecommendModel *)[YXRecommendModel parseJSON:jsonObject], error);
    }];
}
+ (id)getGameListFromList:(NSString *)list CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = nil;
    if (list) {
        path = [NSString stringWithFormat:kGameListPath, list];
    }else {
        path = [NSString stringWithFormat:kGameListPath, @""];
    }

    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler((YXGameListModel *)[YXGameListModel parseJSON:jsonObject], error);
    }];
}
+ (id)getTheGameFromTheGameName:(NSString *)gameName List:(NSString *)list CompletionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = nil;
    if (list) {
        path = [NSString stringWithFormat:kTheGamePath, gameName, list];
    }else {
        path = [NSString stringWithFormat:kTheGamePath, gameName, @""];
    }
    
    return [self GET:path parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler((YXTheGameModel *)[YXTheGameModel parseJSON:jsonObject], error);
    }];
}
+ (id)getAllListCompletionHandler:(void (^)(id, NSError *))completionHandler{
    return [self GET:kAllListPath parameters:nil progress:nil completionHandler:^(id jsonObject, NSError *error) {
        !completionHandler ?: completionHandler((NSArray<YXAllListModel *>*)[YXAllListModel parseJSON:jsonObject], error);
    }];
}
@end
