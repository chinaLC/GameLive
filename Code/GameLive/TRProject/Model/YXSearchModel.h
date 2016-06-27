//
//  YXSearchModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXDateModel.h"
@class SearchDataModel;
@interface YXSearchModel : NSObject

@property (nonatomic) NSInteger code;

@property (nonatomic) SearchDataModel *data;

@end

@interface SearchDataModel : NSObject


@property (nonatomic) NSArray<LinkObjectModel *> *items;

@property (nonatomic) NSInteger total;

@property (nonatomic) NSInteger pageNb;
@end