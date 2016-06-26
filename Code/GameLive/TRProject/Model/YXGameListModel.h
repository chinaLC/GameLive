//
//  YXGameListModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXDateModel.h"
@class GameListRecommendModel;
@interface YXGameListModel : NSObject

@property (nonatomic, strong) GameListRecommendModel *recommend;

@property (nonatomic, strong) NSArray<LinkObjectModel *> *data;

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, copy) NSString *icon;


@end
@interface GameListRecommendModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong) NSArray<YXDateModel *> *data;

@end


