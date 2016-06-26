//
//  YXDateModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXDateModel.h"

@implementation YXDateModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID":@"id",
             @"slotId":@"slot_id",
             @"createAt":@"create_at",
             @"linkObject":@"link_object"};
}

@end

@implementation LinkObjectModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"weightAdd":@"weight_add",
             @"followAdd":@"follow_add",
             @"playCount":@"play_count",
             @"negativeView":@"negative_view",
             @"coinAdd":@"coin_add",
             @"defaultImage":@"default_image",
             @"createAt":@"create_at",
             @"categoryName":@"category_name",
             @"theNewStartTime":@"new_start_time",
             @"recommendImage":@"recommend_image",
             @"lockedView":@"locked_view",
             @"lastEndAt":@"last_end_at",
             @"videoQuality":@"video_quality",
             @"firstPlayAt":@"first_play_at",
             @"followBak":@"follow_bak",
             @"playAt":@"play_at",
             @"appShufflingImage":@"app_shuffling_image",
             @"categoryId":@"category_id",
             @"categorySlug":@"category_slug"};
}
@end
