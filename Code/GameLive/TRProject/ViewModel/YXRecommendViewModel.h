//
//  YXRecommendViewModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXNetManager.h"
@interface YXRecommendViewModel : NSObject

- (void)getDataCompletionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) NSURLSessionDataTask *dataTask;

/** YXRecommendModel */
@property (nonatomic, strong) YXRecommendModel *recommendModel;

- (NSInteger)numberOfSection;
- (NSString *)nameForSection:(NSInteger)section;

- (NSURL *)iconIVForRow:(NSInteger)row Section:(NSInteger)section;
- (NSString *)titleForRow:(NSInteger)row Section:(NSInteger)section;
- (NSString *)onlineForRow:(NSInteger)row Section:(NSInteger)section;
- (NSString *)nameForRow:(NSInteger)row Section:(NSInteger)section;

- (NSString *)sectionNameForSection:(NSInteger)section;

- (NSURL *)playAVForRow:(NSInteger)row Section:(NSInteger)section;
@end
