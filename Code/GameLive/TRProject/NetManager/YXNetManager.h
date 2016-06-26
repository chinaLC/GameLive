//
//  YXNetManager.h
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXRecommendModel.h"
#import "YXGameListModel.h"
#import "YXTheGameModel.h"
#import "YXAllListModel.h"
@interface YXNetManager : NSObject
+ (id)getRecommendCompletionHandler:(void(^)(id model, NSError *error))completionHandler;
+ (id)getGameListFromList:(NSString *)list CompletionHandler:(void (^)(id model, NSError *error))completionHandler;
+ (id)getTheGameFromTheGameName:(NSString *)gameName List:(NSString *)list CompletionHandler:(void(^)(id model, NSError *error))completionHandler;
+ (id)getAllListCompletionHandler:(void(^)(id model, NSError *error))completionHandler;
@end
