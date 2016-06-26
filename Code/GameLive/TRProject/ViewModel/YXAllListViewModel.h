//
//  YXAllListViewModel.h
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXNetManager.h"
@interface YXAllListViewModel : NSObject
- (void)getAllListCompletionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) NSURLSessionDataTask *dataTask;

/** YXRecommendModel */
@property (nonatomic, strong) NSArray<YXAllListModel *> *listM;
- (NSInteger)numberForRow;
- (NSURL *)iconIVForRow:(NSInteger)row;
- (NSString *)nameForRow:(NSInteger)row;
- (NSString *)gameNameForRow:(NSInteger)row;
@end
