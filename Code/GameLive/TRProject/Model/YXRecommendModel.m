//
//  YXRecommendModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXRecommendModel.h"

@implementation YXRecommendModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"moblieWebgame":@"moblie-webgame",
             @"moblieMinecraft":@"moblie-minecraft",
             @"mobileTvgame":@"mobile-tvgame",
             @"moblieSport":@"moblie-sport",
             @"mobileStar":@"mobile-star",
             @"mobileRecommendation":@"mobile-recommendation",
             @"mobileIndex":@"mobile-index",
             @"mobileLol":@"mobile-lol",
             @"mobileBeauty":@"mobile-beauty",
             @"mobileHeartstone":@"mobile-heartstone",
             @"moblieBlizzard":@"moblie-blizzard",
             @"mobileDota2":@"mobile-dota2",
             @"moblieDnf":@"moblie-dnf"};
}
 
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"moblieWebgame":[YXDateModel class],
             @"moblieMinecraft":[YXDateModel class],
             @"mobileTvgame":[YXDateModel class],
             @"moblieSport":[YXDateModel class],
             @"mobileStar":[YXDateModel class],
             @"mobileRecommendation":[YXDateModel class],
             @"mobileIndex":[YXDateModel class],
             @"mobileLol":[YXDateModel class],
             @"mobileBeauty":[YXDateModel class],
             @"mobileHeartstone":[YXDateModel class],
             @"moblieBlizzard":[YXDateModel class],
             @"mobileDota2":[YXDateModel class],
             @"moblieDnf":[YXDateModel class],
             @"list":[GameListModel class]};
}

@end

@implementation GameListModel

@end

