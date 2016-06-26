//
//  YXRecommendModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXDateModel.h"
@class GameListModel;
@interface YXRecommendModel : NSObject

//moblie-webgame -> moblieWebgame
@property (nonatomic, strong) NSArray<YXDateModel *> *moblieWebgame;
//moblie-minecraft -> moblieMinecraft
@property (nonatomic, strong) NSArray<YXDateModel *> *moblieMinecraft;
//mobile-tvgame -> mobileTvgame
@property (nonatomic, strong) NSArray<YXDateModel *> *mobileTvgame;
//moblie-sport -> moblieSport
@property (nonatomic, strong) NSArray<YXDateModel *> *moblieSport;
//mobile-star -> mobileStar
@property (nonatomic, strong) NSArray<YXDateModel *> *mobileStar;
//mobile-recommendation -> mobileRecommendation
@property (nonatomic, strong) NSArray<YXDateModel *> *mobileRecommendation;
//mobile-index -> mobileIndex
@property (nonatomic, strong) NSArray<YXDateModel*> *mobileIndex;
//mobile-lol -> mobileLol
@property (nonatomic, strong) NSArray<YXDateModel *> *mobileLol;
//mobile-beauty -> mobileBeauty
@property (nonatomic, strong) NSArray<YXDateModel *> *mobileBeauty;
//mobile-heartstone -> mobileHeartstone
@property (nonatomic, strong) NSArray<YXDateModel *> *mobileHeartstone;
//moblie-blizzard -> moblieBlizzard
@property (nonatomic, strong) NSArray<YXDateModel *> *moblieBlizzard;
//mobile-dota2 -> mobileDota2
@property (nonatomic, strong) NSArray<YXDateModel *> *mobileDota2;
//moblie-dnf -> moblieDnf
@property (nonatomic, strong) NSArray<YXDateModel *> *moblieDnf;

@property (nonatomic, strong) NSArray<GameListModel *> *list;
@end

@interface GameListModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *slug;

@end

