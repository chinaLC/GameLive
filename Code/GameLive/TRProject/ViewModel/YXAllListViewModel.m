//
//  YXAllListViewModel.m
//  TRProject
//
//  Created by 李晨 on 16/6/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "YXAllListViewModel.h"

@implementation YXAllListViewModel
- (void)getAllListCompletionHandler:(void (^)(NSError *))completionHandler{
    _dataTask = [YXNetManager getAllListCompletionHandler:^(id model, NSError *error) {
        if (!error) {
            _listM = model;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
#pragma mark - Method 
- (NSInteger)numberForRow{
    return self.listM.count;
}
- (NSURL *)iconIVForRow:(NSInteger)row{
    return self.listM[row].thumb.yx_URL;
}
- (NSString *)nameForRow:(NSInteger)row{
    return self.listM[row].name;
}
- (NSString *)gameNameForRow:(NSInteger)row{
    return self.listM[row].slug;
}
@end
