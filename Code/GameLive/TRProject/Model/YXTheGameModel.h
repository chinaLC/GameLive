//
//  YXTheGameModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXDateModel.h"

@interface YXTheGameModel : NSObject

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, strong) NSArray<LinkObjectModel *> *data;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger pageCount;

@end


