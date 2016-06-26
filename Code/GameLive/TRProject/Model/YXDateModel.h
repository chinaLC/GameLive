//
//  YXDateModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LinkObjectModel;
@interface YXDateModel : NSObject
//id ->ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *subtitle;
//slot_id -> slotId
@property (nonatomic, assign) NSInteger slotId;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;
//create_at -> createAt
@property (nonatomic, copy) NSString *createAt;
//link_object -> linkObject
@property (nonatomic, strong) LinkObjectModel *linkObject;

@property (nonatomic, copy) NSString *ext;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *fk;

@end

@interface LinkObjectModel : NSObject

@property (nonatomic, copy) NSString *nick;
//weight_add -> weightAdd
@property (nonatomic, copy) NSString *weightAdd;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;
//follow_add -> followAdd
@property (nonatomic, copy) NSString *followAdd;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) BOOL hidden;
//play_count -> playCount
@property (nonatomic, copy) NSString *playCount;
//negative_view -> negativeView
@property (nonatomic, copy) NSString *negativeView;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;
//coin_add -> coinAdd
@property (nonatomic, copy) NSString *coinAdd;
//default_image -> defaultImage
@property (nonatomic, copy) NSString *defaultImage;
//create_at -> createAt
@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *intro;
//category_name -> categoryName
@property (nonatomic, copy) NSString *categoryName;
//new_start_time -> theNewStartTime
@property (nonatomic, copy) NSString *theNewStartTime;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;
//recommend_image -> recommendImage
@property (nonatomic, copy) NSString *recommendImage;
//locked_view -> lockedView
@property (nonatomic, copy) NSString *lockedView;
//last_end_at -> lastEndAt
@property (nonatomic, copy) NSString *lastEndAt;
//video_quality -> videoQuality
@property (nonatomic, copy) NSString *videoQuality;

@property (nonatomic, copy) NSString *announcement;
//first_play_at -> firstPlayAt
@property (nonatomic, copy) NSString *firstPlayAt;

@property (nonatomic, copy) NSString *follow;
//follow_bak -> followBak
@property (nonatomic, copy) NSString *followBak;
//play_at -> playAt
@property (nonatomic, copy) NSString *playAt;

@property (nonatomic, copy) NSString *weight;
//app_shuffling_image -> appShufflingImage
@property (nonatomic, copy) NSString *appShufflingImage;
//category_id -> categoryId
@property (nonatomic, copy) NSString *categoryId;

@property (nonatomic, copy) NSString *title;
//category_slug -> categorySlug
@property (nonatomic, copy) NSString *categorySlug;

@end

